package com.yebin.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.bson.Document;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kinder.mongo.MongoUtil;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.yebin.mongo.JsonParse;

@RestController
public class ApiController {	
	
	//MongoDB-areaCode 가져오기
	@RequestMapping(value= "/getAreacode", method=RequestMethod.GET)
	public @ResponseBody List<Document> getAreacode(HttpServletRequest hr){
		JsonParse jp = JsonParse.getInstance();
		List<Document> areacodeList = jp.find("kinder", "areacode");
		return areacodeList;
	}
	
	//MongoDB-category 코드 가져오기
	@RequestMapping(value = "/getProgramCategory", method = RequestMethod.GET)
	public @ResponseBody List<Document> getProgramCategory(HttpServletRequest hr) {
		JsonParse jp = JsonParse.getInstance();
		List<Document> cateList = jp.find("kinder", "programCategory");
		return cateList;
	}

//	체험학습 창의프로그램 해올때 한거
	@RequestMapping(value = "/getSerchedResult", method=RequestMethod.GET)
	public ResponseEntity<String> getSerchedResult(HttpServletRequest hr) throws Exception {
		HttpHeaders responseHeaders = new HttpHeaders();
		  responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		  String term = hr.getParameter("term");
		  String zone = hr.getParameter("zone");
		  String city = hr.getParameter("city");
		  String date = hr.getParameter("date");
		  String person = hr.getParameter("person");
		  System.out.println("[분류]"+term+" [지역]"+zone+" [도시]"+city+" [운영시작일]"+date+" [인원]"+person);
		  
		// 프로그램 : "https://www.crezone.net/api/program/list.php";
		// 자원 : "https://www.crezone.net/api/resource/list.php";
		StringBuilder urlBuilder = new StringBuilder("https://www.crezone.net/api/program/list.php?count=100&post_modified:desc"); /*URL*/
		urlBuilder.append("&" + URLEncoder.encode("term","UTF-8") + "=" + URLEncoder.encode(term, "UTF-8"));
		if(!zone.equals("지역없음")) {
			urlBuilder.append("&" + URLEncoder.encode("zone","UTF-8") + "=" + URLEncoder.encode(zone, "UTF-8"));	
			urlBuilder.append("&" + URLEncoder.encode("city","UTF-8") + "=" + URLEncoder.encode(city, "UTF-8"));			
		}
		urlBuilder.append("&" + URLEncoder.encode("do_date_start","UTF-8") + "=" + URLEncoder.encode(date, "UTF-8"));	
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
