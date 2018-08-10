package com.yebin.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kinder.domain.MemberVO;
import com.yebin.service.ClassService;
import com.yebin.service.FieldtripService;

@RestController
public class dbSaveController {

	
	@Inject
	ClassService classService;
	
	@Inject
	FieldtripService fieldService;
	
	// MySql-담당 선생님의 반 이름/인원 가져오기
	@RequestMapping(value = "/postCountingkids", method = RequestMethod.POST)
	public List<Object> postCountingkids(HttpSession hs) {
		MemberVO vo = (MemberVO) hs.getAttribute("tlogin");
		List<Object> list = classService.countingKids(vo);

		return list;
	}
	
	@RequestMapping(value="/postSaveFinalChoice", method = RequestMethod.POST)
	public void postSaveFinalChoice(@RequestParam String ftChoice) {
		
		
		
	}
	
}
