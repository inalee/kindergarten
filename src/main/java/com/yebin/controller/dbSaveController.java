package com.yebin.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kinder.domain.MemberVO;
import com.yebin.domain.FieldtripVO;
import com.yebin.domain.MaterialsVO;
import com.yebin.service.ClassService;
import com.yebin.service.FieldtripService;

@RestController
public class dbSaveController {

	@Inject
	ClassService classService;

	@Inject
	FieldtripService fieldService;

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

	// MySql- 승인 받기 전 보고서 DB 등록하기
	@RequestMapping(value = "/postSaveApv", method = RequestMethod.POST)
	public ResponseEntity<String> postSaveApv(String apvpurpose, String apvremarks, HttpSession hs) {
		FieldtripVO fieldVO = new FieldtripVO();
		fieldVO.setFtcode((int) hs.getAttribute("ftcodeToken"));
		System.out.println(apvpurpose);
		System.out.println(apvremarks);

		return new ResponseEntity<>(HttpStatus.OK);
	}

}
