package com.yebin.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kinder.domain.MemberVO;
import com.kinder.domain.TeacherVO;
import com.yebin.domain.ApprovalVO;
import com.yebin.domain.FieldtripVO;
import com.yebin.domain.MaterialsVO;
import com.yebin.service.ApprovalService;
import com.yebin.service.ClassService;
import com.yebin.service.FieldtripService;

@RestController
public class dbSaveController {

	@Inject
	ClassService classService;

	@Inject
	FieldtripService fieldService;

	@Inject
	ApprovalService apprService;

	// MySql-담당 선생님의 반 이름/인원 가져오기
	@RequestMapping(value = "/postCountingkids", method = RequestMethod.POST)
	public List<Object> postCountingkids(HttpSession hs) {
		MemberVO vo = (MemberVO) hs.getAttribute("tlogin");
		List<Object> list = classService.countingKids(vo);

		return list;
	}

	// MySql-최종 선택한 체험학습지 DB에 업데이트
	@RequestMapping(value = "/postSaveFinalChoice", method = RequestMethod.POST)
	public void postSaveFinalChoice(@RequestParam String ftChoice, HttpSession hs) {
		System.out.println(hs.getAttribute("tempKeyList"));
		List<Map<String, Integer>> selist = (List<Map<String, Integer>>) hs.getAttribute("tempKeyList");
		FieldtripVO fieldVO = new FieldtripVO();

		for (String key : selist.iterator().next().keySet()) {
			if (key.toString().equals(ftChoice)) {
				System.out.println(key.toString());
				System.out.println(ftChoice);
				fieldVO.setFtcode((Integer) selist.iterator().next().get(key));
				String fvoAddr = fieldService.updateFtChoice(fieldVO);
				hs.setAttribute("keyword", fvoAddr);
				hs.setAttribute("ftcodeToken", fieldVO.getFtcode());
			}
		}
	}

	// MySql- 필요한 준비물 목록 DB에 저장
	@RequestMapping(value = "/postSaveMaterials", method = RequestMethod.POST)
	public void postSaveMaterials(MaterialsVO vo, HttpSession hs, String[] mtrList) {
		FieldtripVO fieldVO = new FieldtripVO();
		System.out.println(Arrays.deepToString(mtrList));
		fieldVO.setFtcode((int) hs.getAttribute("ftcodeToken"));
		hs.setAttribute("mtrList", mtrList);
		System.out.println(vo);
		fieldService.insertMaterials(vo, fieldVO);
	}

	// MySql- 보고서 양식에 들어갈 내용 가져오기
	@RequestMapping(value = "/getReportForm", method = RequestMethod.GET)
	public List<Object> getReportForm(HttpSession hs) {
		FieldtripVO fieldVO = new FieldtripVO();
		fieldVO.setFtcode((int) hs.getAttribute("ftcodeToken"));
		List<Object> reportSource = fieldService.selectReport(fieldVO);
		reportSource.add(hs.getAttribute("mtrList"));
		return reportSource;
	}

	// MySql- 원장 승인 이전 보고서 DB 등록하기
	@RequestMapping(value = "/postSaveApv", method = RequestMethod.POST)
	public ResponseEntity<String> postSaveApv(String apvpurpose, String apvremarks, String apvtitle, String apvclname,
			HttpSession hs, HttpServletRequest hr) {
		System.out.println("[견학목적] " + apvpurpose + " [견학계획] " + apvremarks);

		FieldtripVO fieldVO = new FieldtripVO();
		ApprovalVO apprVO = new ApprovalVO();
		fieldVO.setFtcode((int) hs.getAttribute("ftcodeToken"));
		apprVO.setApvpurpose(apvpurpose);
		apprVO.setApvremarks(apvremarks);
		apprVO.setApvtitle(apvtitle);
		apprVO.setApvclname(apvclname);
		apprService.insertApprDoc(fieldVO, apprVO);

		return new ResponseEntity<>(HttpStatus.OK);
	}

	// MySql- 승인요청한 보고서 목록 가져오기
	@RequestMapping(value = "/getApvList", method = RequestMethod.GET)
	public ArrayList<Object> getApvList(HttpSession hs) {
		TeacherVO teVO = new TeacherVO();
		MemberVO memVO = new MemberVO();

		teVO.setMemid(hs.getAttribute("ybMemid").toString());
		memVO.setMemid((String) hs.getAttribute("ybMemid"));

		if (apprService.isMaster(teVO)) {
			System.out.println("원장님 입니다.");
			hs.setAttribute("isMaster", true);
			return (ArrayList<Object>) fieldService.getApprList(memVO, "m");

		} else {
			System.out.println("선생님 입니다.");
			hs.setAttribute("isMaster", false);
			return (ArrayList<Object>) fieldService.getApprList(memVO, "t");
		}

	}

	@RequestMapping(value = "/getDetails", method = RequestMethod.GET)
	public List<Object> getDetails(String apvcode, HttpSession hs) {
		TeacherVO teVO = new TeacherVO();
		ApprovalVO apprVO = new ApprovalVO();
		apprVO.setApvcode(Integer.parseInt(apvcode));
		
		return apprService.getDetails(apprVO);
	}
	
	@RequestMapping(value ="/postUpdateApv", method = RequestMethod.POST)
	public ResponseEntity<String> postUpdateApv(String apvcode){
		System.out.println(apvcode);
		ApprovalVO apprVO = new ApprovalVO();
		apprVO.setApvcode(Integer.parseInt(apvcode));
		apprService.updateApv(apprVO);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	

}
