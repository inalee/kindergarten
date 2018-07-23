package com.yebin.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ApiController {	
	
	
	//MongoDB-areaCode 가져오기
	@RequestMapping(value= "/getAreacode", method=RequestMethod.GET)
	public @ResponseBody String getAreacode(HttpServletRequest hr){
		
		return "";
	}
	
	
//	체험학습 창의프로그램 해올때 한거
	@RequestMapping(value = "/getSerchedResult", method=RequestMethod.GET)
	public ResponseEntity<String> getSerchedResult(HttpServletRequest hr) throws Exception {
		HttpHeaders responseHeaders = new HttpHeaders();
		  responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		 System.out.println(hr.getParameter("term"));
		  System.out.println(hr.getParameter("zone"));
		  System.out.println(hr.getParameter("city"));
		  System.out.println(hr.getParameter("date"));
		  System.out.println(hr.getParameter("person"));
		  
		// 프로그램 : "https://www.crezone.net/api/program/list.php";
		// 자원 : "https://www.crezone.net/api/resource/list.php";
		StringBuilder urlBuilder = new StringBuilder("https://www.crezone.net/api/resource/list.php?count=50"); /*URL*/
//		urlBuilder.append("?" + URLEncoder.encode("term","UTF-8") + "=" + URLEncoder.encode("체험시설", "UTF-8"));
		String line = "";
		StringBuffer sb = new StringBuffer();

		// url 읽어오기
		try (BufferedReader br = new BufferedReader(new InputStreamReader(new URL(urlBuilder.toString()).openStream(), "utf-8"))) {
			// html을 String으로 parsing
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Get_Page 예외 : " + e.getMessage());
		}

		// 출력
		System.out.println(sb.toString());
		
		 return new ResponseEntity<String>(sb.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
}
