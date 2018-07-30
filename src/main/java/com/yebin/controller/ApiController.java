package com.yebin.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.bson.Document;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kinder.domain.MemberVO;
import com.yebin.domain.CategoryVO;
import com.yebin.mongo.JsonParse;
import com.yebin.service.ApiService;
import com.yebin.service.CategoryService;
import com.yebin.service.ClassService;
import com.yebin.service.MongoService;
import com.yebin.service.MongoServiceImpl;

@RestController
public class ApiController {

	@Inject
	ClassService classService;

	@Inject
	ApiService apiService;
	
	@Inject
	MongoService mongoService;
	
//	@Inject
//	CategoryService cateService;

	// RestAPI-창의 프로그램 API 가져오기
	@RequestMapping(value = "/getSerchedResult", method = RequestMethod.GET)
	public ResponseEntity<String> getSerchedResult(@RequestParam String term, @RequestParam String zone,
			@RequestParam String city, @RequestParam String date, @RequestParam String person, HttpSession hs) throws Exception {

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		
		//MongoDB에 조건 검색 임시 저장
		mongoService.defaultSetting("kinder", "condTempSave");
		MemberVO vo = (MemberVO) hs.getAttribute("tlogin");
		String jsonString = "{'memid' : '"+vo.getMemid()+"', 'searchDate' : 'null',"
		+ " 'term' : '"+term+"', 'zone' : '"+zone+"', 'city' : '"+city+"', 'date' : '"+date+"', 'person' : '"+person+"'}";
		mongoService.insertWithDate(jsonString, "searchDate");
		StringBuffer sb = apiService.programService(term, zone, city, date, person);
		return new ResponseEntity<String>(sb.toString(), responseHeaders, HttpStatus.CREATED);
	}

	// MongoDB-category 코드 가져오기
	@RequestMapping(value = "/getProgramCategory", method = RequestMethod.GET)
	public @ResponseBody List<Document> getProgramCategory() {
		mongoService.defaultSetting("kinder", "programCategory");
		List<Document> cateList = mongoService.find();
		return cateList;
	}

	// MongoDB-areaCode 가져오기
	@RequestMapping(value = "/getAreacode", method = RequestMethod.GET)
	public @ResponseBody List<Document> getAreacode() {
		mongoService.defaultSetting("kinder", "areacode");
		List<Document> areacodeList = mongoService.find();
		return areacodeList;
	}
	
	// MongoDB-감성단어 가져오기
	@RequestMapping(value = "/getEmotionWords", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	public @ResponseBody String getEmotionWords() {
		String RequestJson = "집가긴 싫은데 그냥 아무것도 안하고 쉬고싶다. 에어컨 더 세게 틀고싶다";
		StringBuffer sb = apiService.naturalLangService(RequestJson);
		return sb.toString();
	}

	// MySql-담당 선생님의 반 이름/인원 가져오기
	@RequestMapping(value = "/postCountingkids", method = RequestMethod.POST)
	public @ResponseBody List<Object> postCountingkids(HttpSession hs) {
		MemberVO vo = (MemberVO) hs.getAttribute("tlogin");
		List<Object> list = classService.countingKids(vo);

		return list;
	}
	
	// NAVER 검색 API-검색하기
	@RequestMapping(value = "/getSearch", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	public @ResponseBody String getSearch(@RequestParam String keyword) {
		
		StringBuffer response = apiService.searchKeywords(keyword);
		return response.toString();
	}
	
	// MySql - 사용자가 선택한 체험학습 후보지 저장
//	@RequestMapping(value = "/postSaveList", method = RequestMethod.POST)
//	public @ResponseBody String postSaveList(@RequestParam String keywords, HttpSession hs) {
//		
//		//MongoDB에서 임시저장한 분류 가져오기
//		mongoService.defaultSetting("kinder", "condTempSave");
//		MemberVO memVO = (MemberVO) hs.getAttribute("tlogin");
//		CategoryVO cateVO = new CategoryVO();
//		Map<Object, Object> map = mongoService.jsonParsing(mongoService.findRecentDate(memVO.getMemid()),
//				"memid", "term", "zone", "city", "date", "person");
//		
//		String[] termSplit = null;
//		for(Object key : map.keySet()) {
//			if(key.equals("term")) {
//				termSplit = map.get(key).toString().split("-");
//				cateVO.setCatemain(termSplit[0]);
//				cateVO.setCatesub(termSplit[1]);
//			}
//		}
//		cateService.insertCategory(cateVO);
//		
//		return response.toString();
//	}


}





