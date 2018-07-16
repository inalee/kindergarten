package com.ina.controller;

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
	
	@RequestMapping(value = "/gmenu7", method = RequestMethod.GET)
	public String gmenu7() {
		
		return "/gmenu7";
	}
	
	@RequestMapping(value = "/gmenu8", method = RequestMethod.GET)
	public String gmenu8() {
		
		return "/gmenu8";
	}
	
	@RequestMapping(value = "/gmenu9", method = RequestMethod.GET)
	public String gmenu9() {
		
		return "/gmenu9";
	}
	
	@RequestMapping(value = "/gmenu10", method = RequestMethod.GET)
	public String gmenu10() {
		
		return "/gmenu10";
	}
	
	@RequestMapping(value = "/tmenu6", method = RequestMethod.GET)
	public String tmenu6() {
		
		return "/tmenu6";
	}
	
	@RequestMapping(value = "/tmenu7", method = RequestMethod.GET)
	public String tmenu7() {
		
		return "/tmenu7";
	}
	
}
