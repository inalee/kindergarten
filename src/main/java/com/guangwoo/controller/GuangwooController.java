package com.guangwoo.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.guangwoo.domain.ScheduleVO;
import com.guangwoo.domain.StationVO;
import com.guangwoo.domain.VehicleVO;
import com.guangwoo.service.ScheduleService;
import com.guangwoo.service.StationService;
import com.guangwoo.service.VehicleService;
import com.kinder.domain.ChildrenVO;
import com.kinder.domain.TeacherVO;



@Controller
public class GuangwooController {
	
	private static final Logger logger = LoggerFactory.getLogger(GuangwooController.class);
	
	
	@Inject private VehicleService service;
	@Inject private ScheduleService sdservice;
	@Inject private StationService stservice;
	
	
	@RequestMapping(value = "/gmenu11", method = RequestMethod.GET)
	public String gmenu11() {
		
		return "/gmenu11";
	}
	@RequestMapping(value = "/gmenu11a", method = RequestMethod.GET)
	public String gmenu11a() {
		
		return "/gmenu11a";
	}
	@RequestMapping(value = "/gmenu11b", method = RequestMethod.GET)
	public String gmenu11b() {
		
		return "/gmenu11b";
	}
	@RequestMapping(value = "/gmenu11c", method = RequestMethod.GET)
	public String gmenu11c() {
		
		return "/gmenu11c";
	}
	
	@RequestMapping(value = "/tmenu8", method = RequestMethod.GET)
	public String tmenu8Get(HttpSession session, Model model) throws Exception {
		TeacherVO vo = (TeacherVO) session.getAttribute("teacher");
		model.addAttribute("list", service.selectcar(vo.getKincode()));
		
		return "/tmenu8";
	}
	@RequestMapping(value = "/tmenu8", method = RequestMethod.POST)
	public String tmenu8Post() throws Exception {
		
		return "/tmenu8";
	}
	
	
	@RequestMapping(value = "/tmenu9", method = RequestMethod.GET)
	public String tmenu9get(HttpSession session, Model model) throws Exception{
		TeacherVO vo = (TeacherVO) session.getAttribute("teacher");
		model.addAttribute("sdlist", sdservice.select_schedule(vo.getKincode()));
		model.addAttribute("sdcar", service.selectcar(vo.getKincode()));
		model.addAttribute("sdteacher", sdservice.select_schedule_teacher(vo.getKincode()));
		model.addAttribute("sdchildren", sdservice.select_schedule_children(vo.getKincode()));
		model.addAttribute("sdstation", sdservice.select_schedule_station(vo.getKincode()));
		
		return "/tmenu9";
	}
	
	@RequestMapping(value="del_schedule",method=RequestMethod.GET)
	public String del_schedule(HttpServletRequest request) throws Exception {
		
		int ccode = Integer.parseInt(request.getParameter("ccode"));
		sdservice.deleteschedule(ccode);
		
		return "tmenu9";
	}
	
	@RequestMapping(value = "/tmenu9", method = RequestMethod.POST)
	public String tmenu9post(HttpSession session,
			@RequestParam String svtime1,@RequestParam String svtime2,
			@RequestParam Integer carcode,@RequestParam Integer stcode,@RequestParam Integer ccode
			) throws Exception {
		
		

        if (Integer.parseInt(svtime1)<13) {
        	 String svtime = "오전"+','+svtime1+"시"+svtime2+"분";
 			ScheduleVO sdvo= new ScheduleVO();
 			sdvo.setSvtime(svtime);
 			sdvo.setCarcode(carcode);
 			sdvo.setStcode(stcode);
 			sdvo.setCcode(ccode);
 			sdservice.insertschedule(sdvo);
 			
		}else {
			String svtime = "오후"+','+svtime1+"시"+svtime2+"분";
 			ScheduleVO sdvo= new ScheduleVO();
 			sdvo.setSvtime(svtime);
 			sdvo.setCarcode(carcode);
 			sdvo.setStcode(stcode);
 			sdvo.setCcode(ccode);
 			sdservice.insertschedule(sdvo);
		}
       
		return "redirect:tmenu9";
	}
	
	
	@RequestMapping(value = "/tmenu10", method = RequestMethod.GET)
	public String tmenu10get(HttpSession session, Model model) throws Exception {
		TeacherVO vo = (TeacherVO) session.getAttribute("teacher");
		model.addAttribute("stlist", stservice.station_select(vo.getKincode()));
		return "/tmenu10";
	}
	
	@RequestMapping(value = "/tmenu10", method = RequestMethod.POST)
	public String tmenu10inpost(HttpSession session,
			@RequestParam String stname,@RequestParam Double stx, @RequestParam Double sty )throws Exception {
		StationVO svo = new StationVO();
		svo.setStname(stname);
		svo.setStx(stx);
		svo.setSty(sty);
		stservice.station_insert(svo);	

		return "redirect:tmenu10";
	}
	
	
	
}
