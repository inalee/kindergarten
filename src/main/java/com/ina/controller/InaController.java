package com.ina.controller;



import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ina.domain.EnrollBean;
import com.ina.domain.EnrollVO;
import com.ina.persistence.ChildrenDAO;
import com.ina.persistence.EnrollManageDAO;
import com.ina.persistence.WaitingDAO;
import com.kinder.domain.ChildrenVO;
import com.kinder.domain.ClassVO;
import com.kinder.domain.KindergartenVO;
import com.kinder.domain.MemberVO;
import com.kinder.domain.TeacherVO;
import com.kinder.persistence.KindergartenDAO;


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
	public String gmenu9(HttpSession session,Model model) {
		
		
		MemberVO vo = (MemberVO)session.getAttribute("glogin");
		int gcode = childdao.checkGid(vo.getMemid());
		
		List<Map<String, Object>> lm  = waitdao.wait_list2(gcode);
		

		

		for (Map<String, Object> map : lm) {

			int kincode = (int)map.get("kincode");
			List<Map<String, Object>> lm2 = waitdao.wait_list4(kincode);
			map.put("number", lm2.size());
			
			
			String cname = (String)map.get("cname");
			
			for (Map<String, Object> map2 : lm2) {
				String cname2 = (String)map2.get("cname");
				
				if (cname.equals(cname2)) {
					map.put("rank", map2.get("ROWNUM"));
				}
			}
			
		}



		model.addAttribute("wait1",waitdao.wait_list(gcode));
		model.addAttribute("wait2",lm);
		model.addAttribute("wait3",waitdao.wait_list3(gcode));
		model.addAttribute("wait5",waitdao.wait_list5(gcode));		
		
		
		return "/gmenu9";
	}

	@RequestMapping(value = "/tmenu6", method = RequestMethod.GET)
	public String tmenu6(HttpSession session,Model model) {
		TeacherVO tv = (TeacherVO)session.getAttribute("teacher");
		int kincode = tv.getKincode();
		model.addAttribute("kinlist",managedao.enroll_list(kincode));
		model.addAttribute("kinlist2",managedao.enroll_list2(kincode));
		model.addAttribute("kinlist3",managedao.enroll_list3(kincode));
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

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String upload() {
		
		return "/upload";
	}
	
	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public String manage() {
		
		return "/manage";
	}
		
	@RequestMapping(value = "/manage2", method = RequestMethod.GET)
	public String manage2(HttpSession session,Model model) {
		TeacherVO tv = (TeacherVO)session.getAttribute("teacher");
		int kincode = tv.getKincode();
		
		model.addAttribute("sellist",kindao.select_kinder_child(kincode));
		
		model.addAttribute("sellist2",kindao.select_class(kincode));

		return "/manage2";
	}
	
	@RequestMapping(value = "/update_class", method = RequestMethod.POST)
	public String update_class(ChildrenVO cv) {
		
		kindao.update_class(cv);
		
		return "manage2";
		
	}
	
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public void upload_post(HttpServletRequest request) {
		int encode = Integer.parseInt(request.getParameter("encode"));
		waitdao.update_state(encode);
	}
	
	

	@RequestMapping(value = "/status_modify", method = RequestMethod.POST)
	public String status_modify(HttpServletRequest request,EnrollVO ev) {

		
		managedao.modify_status(ev);
		
		return "/tmenu6";
	}
	
	@RequestMapping(value = "/final_enroll", method = RequestMethod.POST)
	public String final_enroll(HttpServletRequest request,EnrollVO ev) {

		
		managedao.p_manage_enroll(ev);
		
		return "/tmenu6";
	}
	
	
	
	
	@RequestMapping(value = "/enroll_page2", method = RequestMethod.POST)
	public String enroll_page2_post(HttpServletRequest request,HttpSession session,Model model) {

		int ccode = Integer.parseInt(request.getParameter("ccode"));
		session.setAttribute("ccode", ccode);
		
		int re = childdao.Kin_num(ccode);
		
		if(re>=3) {
			model.addAttribute("kinnum","over");
		}
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
		session.setAttribute("kincode", kincode);
		int ccode = (int)session.getAttribute("ccode");
		model.addAttribute("cname",childdao.search_child(ccode));
		
		EnrollBean eb = new EnrollBean();
		
		eb.setCcode(ccode);
		eb.setKincode(kincode);
		int re = childdao.same_kin(eb);
		
		if(re!=0) {
			model.addAttribute("samekin","same");
		}
		
		return "/enroll_page4";
	}	
	
	
	/**
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/enroll_page5", method = RequestMethod.GET)
	public String enroll_page5(HttpSession session,Model model) {
		int ccode = (int)session.getAttribute("ccode");
		int kincode = (int)session.getAttribute("kincode");
		EnrollBean eb = new EnrollBean();
		eb.setCcode(ccode);
		eb.setKincode(kincode);
		EnrollVO ev = childdao.result_enroll(eb);
		
		model.addAttribute("re_enroll",ev);
		
		
		
		KindergartenVO kgv = kindao.searchKinder2(kincode);
		model.addAttribute("kinname",kgv.getKinname());
		model.addAttribute("cname",childdao.search_child(ccode));
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
	@Inject WaitingDAO waitdao;
	@Inject EnrollManageDAO managedao;
	
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
		
		// kincode
		if(cv.getCstate().equals("미재학")) {
			cv.setKincode(0);
		}
		else {
		int kincode = Integer.parseInt(r.getParameter("kincode2"));
		cv.setKincode(kincode);
		}

		System.out.println("test:"+cv.getCstate());
		

//		//class 임시값
//		cv.setClcode(5);
		
		childdao.insertChild(cv);
		System.out.println("아이추가 완료");

		return "redirect:ina/gmenu8";
	}

	
	@RequestMapping(value="/enroll_kinder",method=RequestMethod.POST)
	public String enroll_kinder(HttpSession session,HttpServletRequest request) throws ParseException {
		int ccode = (int)session.getAttribute("ccode");
		int kincode = (int)session.getAttribute("kincode");
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String date = request.getParameter("hopedate");
		Date hopedate = transFormat.parse(date);
		
		EnrollBean eb = new EnrollBean();
		
		eb.setCcode(ccode);
		eb.setHopedate(hopedate);
		eb.setKincode(kincode);

		childdao.enroll_kinder(eb);
		return "redirect:enroll_page5";
	}
	
	@RequestMapping(value="/make_class",method=RequestMethod.POST)
	public String search_kinder2(ClassVO cv){
			
		kindao.make_class(cv);
		
		return "manage2";
		
	}
	

	
}
