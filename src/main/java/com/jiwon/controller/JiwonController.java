package com.jiwon.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.bson.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kinder.domain.ClassVO;
import com.jiwon.dto.AttendDTO;
import com.jiwon.mongo.MongoAttendCheck;
import com.jiwon.persistence.JChildrenDAO;
import com.kinder.domain.ChildrenVO;
import com.kinder.domain.TeacherVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class JiwonController {
	
	private static final Logger logger = LoggerFactory.getLogger(JiwonController.class);
	@Inject JChildrenDAO jdao;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/gmenu19", method = RequestMethod.GET)
	public String gmenu19() {
		
		return "/gmenu19";
	}
	
	@RequestMapping(value = "/gmenu20", method = RequestMethod.GET)
	public String gmenu20() {
		
		return "/gmenu20";
	}
	
	@RequestMapping(value = "/tmenu5", method = RequestMethod.GET)
	public void tmenu5(Model model, HttpSession session) throws Exception {
		
		TeacherVO vo = (TeacherVO)session.getAttribute("teacher");
		int kincode = vo.getKincode();
		
		session.setAttribute("classinfo", jdao.getClassList(kincode));
	}
	@RequestMapping(value = "/getClassMember", method = RequestMethod.GET)
	public String getClassMember(Model model, HttpSession session, HttpServletRequest r) throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
		Calendar c = Calendar.getInstance();
		int month = c.get(Calendar.MONTH)+1 ;
		String today = c.get(Calendar.YEAR) + "-" + month + "-" + c.get(Calendar.DATE);
		
		List<ChildrenVO> child = jdao.getClassMember(Integer.parseInt(r.getParameter("clcode")));
		List<Document> list = MongoAttendCheck.findAttend(Integer.parseInt(r.getParameter("clcode")), today);
		List<AttendDTO> ad = new ArrayList<>();
		
		System.out.println(today);
		String late = today + "T10:30:00Z";
		
		int k;
		for (ChildrenVO vo : child) {	
			k = -1;
			for (Document document : list) {
				if(vo.getCcode() == (int)document.get("ccode")) {
					if(document.get("state").equals("leave")) {
						ad.add(new AttendDTO((int)document.get("ccode"), vo.getCname(), (int)document.get("clcode"), 2));
						k = 1;
					}else if(document.get("state").equals("attend") && k==-1) {
						//System.out.println(vo.getCname() + " : " + document.get("date"));
						if(((Date)document.get("date")).compareTo(format.parse(late)) > 0) {
							ad.add(new AttendDTO((int)document.get("ccode"), vo.getCname(), (int)document.get("clcode"), 3));
						}else {
							ad.add(new AttendDTO((int)document.get("ccode"), vo.getCname(), (int)document.get("clcode"), 1));
						}
						k = 1;
					}
				}
			}
			if(k==-1) {
				ad.add(new AttendDTO(vo.getCcode(), vo.getCname(), Integer.parseInt(r.getParameter("clcode")), 0));
			}
		}
		
		model.addAttribute("clmem", ad);
		
		return "/tmenu5";
	}
	@RequestMapping(value = "/addAttend", method = RequestMethod.POST)
	public String addAttend(HttpServletRequest r, HttpSession s) throws Exception {
		TeacherVO vo = (TeacherVO)s.getAttribute("teacher");
		MongoAttendCheck.insertAttend(vo.getKincode(), Integer.parseInt(r.getParameter("clcode")), Integer.parseInt(r.getParameter("ccode")));
		return "/tmenu5";
	}
	@RequestMapping(value = "/addLeave", method = RequestMethod.POST)
	public String addLeave(HttpServletRequest r, HttpSession s) throws Exception {
		TeacherVO vo = (TeacherVO)s.getAttribute("teacher");
		MongoAttendCheck.insertLeave(vo.getKincode(), Integer.parseInt(r.getParameter("clcode")), Integer.parseInt(r.getParameter("ccode")));
		return "/tmenu5";
	}
	
}
