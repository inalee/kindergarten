package com.ina.controller;

import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.google.common.collect.Lists;

import com.ina.persistence.ChildrenDAO;

import com.kinder.domain.ChildrenVO;
import com.kinder.domain.GuardianVO;
import com.kinder.domain.KindergartenVO;
import com.kinder.domain.MemberVO;
import com.kinder.domain.SearchCri;
import com.kinder.domain.TeacherVO;
import com.kinder.persistence.KindergartenDAO;
import com.kinder.persistence.MemberDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class InaController {
	
	private static final Logger logger = LoggerFactory.getLogger(InaController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/gmenu4", method = RequestMethod.GET)
	public String gmenu4() {
		
		return "/gmenu4";
	}
	
	@RequestMapping(value = "/gmenu5", method = RequestMethod.GET)
	public String gmenu5() {
		
		return "/gmenu5";
	}
	
	@RequestMapping(value = "/gmenu6", method = RequestMethod.GET)
	public String gmenu6() {
		
		return "/gmenu6";
	}
	

	@RequestMapping(value = "/gmenu8", method = RequestMethod.GET)
	public String gmenu8() {
		
		return "/gmenu8";
	}
	
	@RequestMapping(value = "/gmenu9", method = RequestMethod.GET)
	public String gmenu9() {
		
		return "/gmenu9";
	}

	@RequestMapping(value = "/tmenu6", method = RequestMethod.GET)
	public String tmenu6() {
		
		return "/tmenu6";
	}
	
	@RequestMapping(value = "/tmenu7", method = RequestMethod.GET)
	public String tmenu7() {
		
		return "/tmenu7";
	}

	@RequestMapping(value = "/enroll_page2", method = RequestMethod.GET)
	public String enroll_page2(HttpServletRequest request) {

		return "/enroll_page2";
	}	
	
	
	@RequestMapping(value = "/enroll_page2", method = RequestMethod.POST)
	public String enroll_page2_post(HttpServletRequest request,HttpSession session) {

		int ccode = Integer.parseInt(request.getParameter("ccode"));
		session.setAttribute("ccode", ccode);
		return "/enroll_page2";
	}
	
	
	@RequestMapping(value = "/enroll_page3", method = RequestMethod.GET)
	public String enroll_page3(HttpServletRequest request,HttpSession session) {
		//아이code , 입소순위받아서 update 해주기..
		int ccode = (int)session.getAttribute("ccode");
		System.out.println(ccode);
		
		int crank = Integer.parseInt(request.getParameter("totalnum"));

	
		ChildrenVO cv = new ChildrenVO();
		cv.setCcode(ccode);
		cv.setCrank(crank);
	
		childdao.updateRank(cv);
		return "/enroll_page3";
	}	


	
	@RequestMapping(value = "/enroll_page4", method = RequestMethod.GET)
	public String enroll_page4(HttpServletRequest request,Model model,HttpSession session) {
		
	int kincode = Integer.parseInt(request.getParameter("kincode"));
		model.addAttribute("kinder",kindao.searchKinder2(kincode));
		int ccode = (int)session.getAttribute("ccode");
		model.addAttribute("cname",childdao.search_child(ccode));
		return "/enroll_page4";
	}	
	
	
	@RequestMapping(value = "/enroll_page5", method = RequestMethod.GET)
	public String enroll_page5() {
		
		return "/enroll_page5";
	}	
	
	
	
	@RequestMapping(value = "/enroll_page", method = RequestMethod.GET)
	public String enroll_page(HttpServletRequest request,HttpSession session,Model model) {
		
		//session에 저장되어있는 glogin에서 memid만 추출해내서.. gcode 찾기!!
		MemberVO vo = (MemberVO)session.getAttribute("glogin");
		int gcode = childdao.checkGid(vo.getMemid());
		model.addAttribute("ChildVO",childdao.childInfo(gcode));
		return "/enroll_page";
	}
	
	@Inject	ChildrenDAO childdao;
	@Inject	KindergartenDAO kindao;
	
	//아이 등록하는 메소드
	@RequestMapping(value="/insertChild", method = RequestMethod.POST)
	public String insert_Child(HttpServletRequest r,ChildrenVO cv){
			
		//주민번호 합쳐주기
		String cidnum = r.getParameter("cidnum1")+r.getParameter("cidnum2");
		cv.setCidnum(cidnum);
		
		//나이 (숫자로바꿔줌)
		int cage = Integer.parseInt(r.getParameter("cage"));
		cv.setCage(cage);
		
		String memid = r.getParameter("memid"); //hidden으로 전달함
		
		//gcode 찾는 dao 사용
		int gcode = childdao.checkGid(memid);
		cv.setGcode(gcode);
		
		//임시값
		cv.setKincode(10);
		cv.setId(2);
		
		childdao.insertChild(cv);
		System.out.println("아이추가 완료");

		return "redirect:ina/gmenu8";
	}

	

	
	
	
}
