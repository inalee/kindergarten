package com.jiwon.controller;

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
public class JiwonController {
	
	private static final Logger logger = LoggerFactory.getLogger(JiwonController.class);
	
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
	public String tmenu5() {
		
		return "/tmenu5";
	}
	
}
