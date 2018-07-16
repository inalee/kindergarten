package com.guangwoo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class GuangwooController {
	
	private static final Logger logger = LoggerFactory.getLogger(GuangwooController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/gmenu11", method = RequestMethod.GET)
	public String gmenu11() {
		
		return "/gmenu11";
	}
	
	@RequestMapping(value = "/gmenu12", method = RequestMethod.GET)
	public String gmenu12() {
		
		return "/gmenu12";
	}
	
	@RequestMapping(value = "/gmenu13", method = RequestMethod.GET)
	public String gmenu13() {
		
		return "/gmenu13";
	}
	
	@RequestMapping(value = "/tmenu8", method = RequestMethod.GET)
	public String tmenu8() {
		
		return "/tmenu8";
	}
	
	@RequestMapping(value = "/tmenu9", method = RequestMethod.GET)
	public String tmenu9() {
		
		return "/tmenu9";
	}
	
	@RequestMapping(value = "/tmenu10", method = RequestMethod.GET)
	public String tmenu10() {
		
		return "/tmenu10";
	}
	
	@RequestMapping(value = "/tmenu11", method = RequestMethod.GET)
	public String tmenu11() {
		
		return "/tmenu11";
	}
	
	@RequestMapping(value = "/tmenu12", method = RequestMethod.GET)
	public String tmenu12() {
		
		return "/tmenu12";
	}
	

}
