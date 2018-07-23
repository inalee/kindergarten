package com.yebin.controller;

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
public class YebinController {
	
	private static final Logger logger = LoggerFactory.getLogger(YebinController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/gmenu1", method = RequestMethod.GET)
	public String gmenu1() {
		
		return "/gmenu1";
	}
	
	@RequestMapping(value = "/gmenu2", method = RequestMethod.GET)
	public String gmenu2() {
		
		return "/gmenu2";
	}
	
	@RequestMapping(value = "/gmenu3", method = RequestMethod.GET)
	public String gmenu3() {
		
		return "/gmenu3";
	}
	
	@RequestMapping(value = "/tmenu1", method = RequestMethod.GET)
	public String tmenu1() {
		
		return "/tmenu1";
	}
	
	@RequestMapping(value = "/tmenu2", method = RequestMethod.GET)
	public String tmenu2() {
		
		return "/tmenu2";
	}
	
	@RequestMapping(value = "/tmenu3", method = RequestMethod.GET)
	public String tmenu3() {
		
		return "/tmenu3";
	}
	
	@RequestMapping(value = "/tmenu4", method = RequestMethod.GET)
	public String tmenu4() {
		
		return "/tmenu4";
	}
	
	@RequestMapping(value = "/fieldtrip", method = RequestMethod.GET)
	public String fieldtrip() {
		
		return "/t_fieldtripHelper";
	}
}
