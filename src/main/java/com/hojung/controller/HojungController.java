package com.hojung.controller;

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
public class HojungController {
	
	private static final Logger logger = LoggerFactory.getLogger(HojungController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/gmenu14", method = RequestMethod.GET)
	public String gmenu14() {
		
		return "/gmenu14";
	}
	
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
	
}
