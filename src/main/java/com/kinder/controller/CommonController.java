package com.kinder.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kinder.domain.ClassVO;
import com.kinder.domain.GuardianVO;
import com.kinder.domain.KindergartenVO;
import com.kinder.domain.MemberVO;
import com.kinder.domain.SearchCri;
import com.kinder.domain.TeacherVO;
import com.kinder.dto.LoginDTO;
import com.kinder.persistence.KindergartenDAO;
import com.kinder.persistence.MemberDAO;
import com.kinder.service.MemberService;
import com.mysql.cj.Session;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CommonController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Inject
	private MemberService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		return "main";
	}
	
	@RequestMapping(value = "/kinder_find", method = RequestMethod.GET)
	public String kinder_find() {
		return "kinder_find";
	}
	
	@RequestMapping(value = "/glogin", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto,HttpSession session,Model model) {

		if(session.getAttribute("joincheck")=="joinok") {
			session.removeAttribute("joincheck");
			model.addAttribute("jointest","ok");
		}
		session.setAttribute("joinsort", 0);
	}
	
	@RequestMapping(value = "/gmain", method = RequestMethod.GET)
	public String guardianmenu() {
		
		return "gmain";
	}
	
	@RequestMapping(value = "/gloginPost", method = RequestMethod.POST)
	public void guardianPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {
		dto.setMemsort(0);
		MemberVO vo = service.login(dto);
		
		if(vo == null) return;
		model.addAttribute("memberVO", vo);
	}
	
	@RequestMapping(value = "/tmain", method = RequestMethod.GET)
	public String teachermenu(HttpSession session) {
		MemberVO vo = (MemberVO)(session.getAttribute("tlogin"));
		session.setAttribute("teacher", dao.seltecher(vo.getMemid()));
			
		return "tmain";
	}
	
	
	@RequestMapping(value = "/tlogin", method = RequestMethod.GET)
	public void teachlogin(@ModelAttribute("dto") LoginDTO dto,HttpSession session,Model model) {
		if(session.getAttribute("joincheck")=="joinok") {
			session.removeAttribute("joincheck");
			model.addAttribute("jointest","ok");
		}
		session.setAttribute("joinsort", 1);

	}
	
	@RequestMapping(value = "/tloginPost", method = RequestMethod.POST)
	public void teachPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {
		dto.setMemsort(1);
		MemberVO vo = service.login(dto);
		
		if(vo == null) return;
		model.addAttribute("memberVO", vo);
	}
	
	/* 관리자 로그인 페이지 */
	@RequestMapping(value = "/alogin", method = RequestMethod.GET)
	public String aloginGET() {
		return "alogin";
	}
	
	@RequestMapping(value = "/amain", method = RequestMethod.GET)
	public String amain() {
		
		return "amain";
	}
	

	@RequestMapping(value = "/nLoginPost", method = RequestMethod.POST)
	public ResponseEntity<String> nloginPost(HttpServletRequest r, HttpSession session) throws Exception {
		
		MemberVO vo = new MemberVO();
		vo.setMemid(r.getParameter("memid"));
		vo.setMemsort(Integer.parseInt(r.getParameter("memsort")));
		
		MemberVO mem = service.nlogin(vo);
		
		if(mem == null)
		{		
			if(dao.checkMemId((String)vo.getMemid()) == 1) {
				session.setAttribute("exist", true);
				return new ResponseEntity<>("success", HttpStatus.OK);			
			}
			return new ResponseEntity<>("fail", HttpStatus.OK);	
		}
		
		
		// 선생님인지 부모님인지 확인해야함
		if(vo.getMemsort() == 0) {
		session.setAttribute("glogin", mem);
		}
		else
			session.setAttribute("tlogin", mem);
		
		return new ResponseEntity<>("success", HttpStatus.OK);			
		
	}

	@RequestMapping(value = "/naverJoinPost", method = RequestMethod.POST)
	public ResponseEntity<String> naverJoinPost(HttpServletRequest r, HttpSession session, Model m){
		
		session.setAttribute("memid", r.getParameter("memid"));
		session.setAttribute("memname", r.getParameter("memname"));
		session.setAttribute("gender", r.getParameter("gender"));
		session.setAttribute("profileimage", r.getParameter("profileimage"));
		
		
		return new ResponseEntity<>(HttpStatus.OK);	
	}
	
	@RequestMapping(value = "/naverJoinPost", method = RequestMethod.GET)
	public void naverJoinGet(){
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		
		Object tobj = session.getAttribute("tlogin");
		Object gobj = session.getAttribute("glogin");
		if(tobj != null) {
			session.removeAttribute("tlogin");
			session.invalidate();
		}
		if(gobj != null) {
			session.removeAttribute("glogin");
			session.invalidate();
		}
		
		return "main";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(HttpSession session) {
		  session.removeAttribute("joincheck");
		return "join";
	}
	
	
	@Inject MemberDAO dao;

	
	
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String insert_member(HttpServletRequest r,Model model,HttpSession session,MemberVO vo){
		
		GuardianVO gv = new GuardianVO();
		TeacherVO tv = new TeacherVO();
		
		int memsort = Integer.parseInt(r.getParameter("memsort"));
		System.out.println("주소:"+vo.getMemaddress());
		dao.insertMember(vo);
		
		System.out.println("회원추가 완료");

		if(memsort==0) {
//			 부모일 경우, 부모 table 정보 입력
			gv.setMemid(r.getParameter("memid"));
			gv.setGrelation(r.getParameter("grelation"));
			dao.insertGuardian(gv);

			session.setAttribute("joincheck", "joinok");
			return "redirect:glogin";
		}
		else if(memsort==1) {
			//선생님일경우, 선생님 table 정보 입력
			tv.setKincode(Integer.parseInt(r.getParameter("kincode2")));
			tv.setMemid(r.getParameter("memid"));
			if(r.getParameter("tmaster").equals("0")) {
				tv.setTmaster(false);
			}
			else {
				tv.setTmaster(true);
			}
			
			dao.insertTeacher(tv);
			session.setAttribute("joincheck", "joinok");
			return "redirect:tlogin";
		}
		return "redirect:tlogin";
	}
	
	
	
	@RequestMapping(value = "/memIdcheck", method = RequestMethod.GET)
	public @ResponseBody int memIdcheck(HttpServletRequest r,String memid) {
		
		 	return dao.checkMemId(memid);
	}
	
	//카카오로그인 - 선생님
	@RequestMapping(value = "/tLoginWithKakao", method = RequestMethod.GET)
	public String tLoginWithKakao(HttpServletRequest request, Model model) throws Exception {
		HttpSession hs = request.getSession();
		MemberVO vo = new MemberVO();
		vo.setMemid((String)hs.getAttribute("id"));
		vo.setMemsort(1);
		if(dao.nLogin(vo) != null){
			vo.setMemname(dao.nLogin(vo).getMemname());
			model.addAttribute("memberVO",vo);
			hs.setAttribute("exist",false);
			return "tmain";
		}else if (dao.checkMemId((String)hs.getAttribute("id")) == 1) {
			hs.setAttribute("exist",true);
			return "tlogin";
		}else {
			hs.setAttribute("exist",false);
			return "tJoinWithKakao";			
		}
	}

	//카카오 회원가입 - 선생님
	@RequestMapping(value = "/tJoinWithKakao", method = RequestMethod.POST) 
	public ResponseEntity<String> tJoinWithKakao(HttpSession session,
			@RequestParam String id, @RequestParam String nickname, @RequestParam String kakaoID, 
			@RequestParam String token, @RequestParam String thumImg ){
		
		session.setAttribute("id", id);
		session.setAttribute("kakaoID", kakaoID);
		session.setAttribute("thumImg", thumImg);
		session.setAttribute("nickname", nickname);
		session.setAttribute("token", token);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	//카카오로그인 - 보호자
	@RequestMapping(value = "/gLoginWithKakao", method = RequestMethod.GET)
	public String gLoginWithKakao(HttpServletRequest request, Model model) throws Exception {
		HttpSession hs = request.getSession();
		MemberVO vo = new MemberVO();
		vo.setMemid((String)hs.getAttribute("id"));
		vo.setMemsort(0);
		if(dao.nLogin(vo) != null){
			vo.setMemname(dao.nLogin(vo).getMemname());
			model.addAttribute("memberVO",vo);
			hs.setAttribute("exist",false);
			return "gmain";
		}else if (dao.checkMemId((String)hs.getAttribute("id")) == 1) {
			hs.setAttribute("exist",true);
			return "glogin";
		}else {
			hs.setAttribute("exist",false);
			return "gJoinWithKakao";	
		}
	}

	//카카오회원가입 - 보호자 
	@RequestMapping(value = "/gJoinWithKakao", method = RequestMethod.POST) 
	public ResponseEntity<String> gJoinWithKakao(HttpSession session,
			@RequestParam String id, @RequestParam String nickname, @RequestParam String kakaoID, 
			@RequestParam String token, @RequestParam String thumImg ){
		
		session.setAttribute("id", id);
		session.setAttribute("kakaoID", kakaoID);
		session.setAttribute("thumImg", thumImg);
		session.setAttribute("nickname", nickname);
		session.setAttribute("token", token);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}

	
	@Inject	KindergartenDAO kindao; 
	
	@RequestMapping(value="/search_kinder",method=RequestMethod.GET)
	public  @ResponseBody List<KindergartenVO> search_kinder(SearchCri cri) {

		
		System.out.println(cri.getKinkindcode());
		
		List<KindergartenVO> kgv = kindao.searchKinder(cri);

		return kgv;
		
	}

	@RequestMapping(value="/search_kinder2",method=RequestMethod.GET)
	public @ResponseBody KindergartenVO search_kinder2(@RequestParam("kincode") int kincode){
			
		KindergartenVO kgv = kindao.searchKinder2(kincode);
		
		return kgv;
		
	}

	

	
	
}
