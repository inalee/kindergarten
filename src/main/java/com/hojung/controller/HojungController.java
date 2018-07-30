package com.hojung.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hojung.domain.KinsearchCri;
import com.hojung.persistence.KinderDAO;
import com.hojung.service.KinderService;
import com.kinder.domain.KindergartenVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HojungController {
	
	private static final Logger logger = LoggerFactory.getLogger(HojungController.class);
	
	@Inject
	private KinderDAO dao;
	
	@Inject
	private KinderService kservice;
	
	@RequestMapping(value = "/search_keyword", method = RequestMethod.GET)
	public String search_keyword() {
		
		return "/search_keyword";
	}
	
	/* kinder keyword로 검색 */
	@RequestMapping("/select_kinder_kw")
	public @ResponseBody List<KindergartenVO> listKinderJson1(KinsearchCri cri) throws Exception {
		logger.info("select kindergarten......");
		System.out.println("=================================================="+cri);
		return kservice.selectKinders_kw(cri);//list로 리턴
	}
	
	@RequestMapping(value = "/kinder_detail", method = RequestMethod.GET)
	public String kinder_detail() {
		
		return "/kinder_detail";
	}
	
	@RequestMapping(value = "/search_map", method = RequestMethod.GET)
	public String search_map() {
		
		return "/search_map";
	}
	
	/* kinder map으로 검색 */
	@RequestMapping("/select_kinder_map")
	public @ResponseBody List<KindergartenVO> listKinderJson2(KinsearchCri cri) throws Exception {
		logger.info("select kindergarten......");
		System.out.println("=================================================="+cri);
		return kservice.selectKinders_map(cri);//list로 리턴
	}
	
//	@RequestMapping(value="/select_kinders", method=RequestMethod.GET)
//	public void selectKinders(Model model) throws Exception{
//		
//		model.addAttribute("list", service.listAll());
//	}
	
	@RequestMapping(value = "/gmenu15", method = RequestMethod.GET)
	public String gmenu15() {
		
		return "/gmenu15";
	}
	
	@RequestMapping(value = "/gmenu16", method = RequestMethod.GET)
	public String gmenu16() {
		
		return "/gmenu16";
	}
	
	@RequestMapping(value = "/gmenu17", method = RequestMethod.GET)
	public String gmenu17() {
		
		return "/gmenu17";
	}
	
	@RequestMapping(value = "/gmenu18", method = RequestMethod.GET)
	public String gmenu18() {
		
		return "/gmenu18";
	}
	
	@RequestMapping(value = "/tmenu13", method = RequestMethod.GET)
	public String tmenu13() {
		
		return "/tmenu13";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		
		return "/test";
	}
}
