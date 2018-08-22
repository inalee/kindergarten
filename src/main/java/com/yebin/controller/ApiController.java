package com.yebin.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.bson.Document;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kinder.domain.MemberVO;
import com.yebin.domain.AreacodeVO;
import com.yebin.domain.CategoryVO;
import com.yebin.domain.FieldtripVO;
import com.yebin.domain.TourismVO;
import com.yebin.service.ApiService;
import com.yebin.service.ClassService;
import com.yebin.service.FieldtripService;
import com.yebin.service.MongoService;
import com.yebin.util.JsonParse;

@RestController
public class ApiController {

	@Inject
	ApiService apiService;

	@Inject
	MongoService mongoService;

	@Inject
	FieldtripService fieldService;

	// RestAPI-창의 프로그램 API 가져오기
	@RequestMapping(value = "/getSearchResult", method = RequestMethod.GET)
	public ResponseEntity<String> getSerchedResult(@RequestParam String term, @RequestParam String zone,
			@RequestParam String city, @RequestParam String date, @RequestParam String person, HttpSession hs)
			throws Exception {

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");

		// MongoDB에 조건 검색 임시 저장
		mongoService.defaultSetting("kinder", "condTempSave");
		MemberVO vo = (MemberVO) hs.getAttribute("tlogin");
		String jsonString = "{'memid' : '" + vo.getMemid() + "', 'searchDate' : 'null'," + " 'term' : '" + term
				+ "', 'zone' : '" + zone + "', 'city' : '" + city + "', 'date' : '" + date + "', 'person' : '"
				+ (person == "" ? 0 : Integer.parseInt(person)) + "'}";

		mongoService.insertWithDate(jsonString, "searchDate");
		StringBuffer sb = apiService.programService(term, zone, city, date, (person == "" ? "0" : person));
		// mongoService.defaultSetting("kinder", "searchList");
		// mongoService.insertMany(sb.toString());

		return new ResponseEntity<String>(sb.toString(), responseHeaders, HttpStatus.CREATED);
	}

	// MongoDB-category 코드 가져오기
	@RequestMapping(value = "/getProgramCategory", method = RequestMethod.GET)
	public List<Document> getProgramCategory() {
		mongoService.defaultSetting("kinder", "programCategory");
		List<Document> cateList = mongoService.findAll();
		return cateList;
	}

	// MongoDB-areaCode 가져오기
	@RequestMapping(value = "/getAreacode", method = RequestMethod.GET)
	public List<Document> getAreacode() {
		mongoService.defaultSetting("kinder", "areacode");
		List<Document> areacodeList = mongoService.findAll();
		return areacodeList;
	}

	// Google Natural Language API-감성단어 가져오기
	@RequestMapping(value = "/getEmotionWords", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	public String getEmotionWords() {
		String RequestJson = "집가긴 싫은데 그냥 아무것도 안하고 쉬고싶다. 에어컨 더 세게 틀고싶다";
		StringBuffer sb = apiService.naturalLangService(RequestJson);
		return sb.toString();
	}

	// NAVER 검색 API-검색하기
	@RequestMapping(value = "/getSearch", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	public String getSearch(@RequestParam String keyword) {
		StringBuffer response = apiService.searchKeywords(keyword);
		return response.toString();
	}

	// MySql - 사용자가 선택한 체험학습 후보지 저장
	@RequestMapping(value = "/postSaveList", method = RequestMethod.POST)
	public ResponseEntity<String> postSaveList(@RequestParam String[] keywords, @RequestParam String[] jsondata,
			HttpSession hs) {

		// HttpHeaders responseHeaders = new HttpHeaders();
		// responseHeaders.add("Content-Type", "application/json; charset=utf-8");

		// MongoDB에서 임시저장한 분류 가져오기
		mongoService.defaultSetting("kinder", "condTempSave");
		MemberVO memVO = (MemberVO) hs.getAttribute("tlogin");
		CategoryVO cateVO = new CategoryVO();
		FieldtripVO fieldVO = new FieldtripVO();
		AreacodeVO areaVO = new AreacodeVO();
		Map<Object, Object> map = mongoService.jsonForMongo(mongoService.findRecentDate(memVO.getMemid()), "memid",
				"term", "zone", "city", "date", "person");

		// MySql에 받아온 데이터 정리해서 넣기
		String[] termSplit = null;
		termSplit = map.get("term").toString().split("-");
		cateVO.setCatesub(termSplit[0]);
		cateVO.setCatemain(termSplit[1]);
		areaVO.setArarea(map.get("zone").toString());
		areaVO.setArcity(map.get("city").toString());
		fieldVO.setFtperson(map.get("person").toString());

		List<Map<String, Integer>> pvoList = new ArrayList<>();
		Map<String, Integer> tempKey = new HashMap<>();

		for(int i = 0; i < jsondata.length; i++) {
			if(jsondata[i].contains("noData")) {
//				jsondata[i]
			}
		}
		
		for(String a : jsondata) {
			if(a.contains("nodata")) {

			}
		}
		
		
		System.out.println("왜짤리냐고?"+jsondata[0]);
		Map<String, Map<String, Object>> comMap = JsonParse.jsonToMap(jsondata);
		for (int i = 0; i < keywords.length; i++) {
			fieldVO.setFttitle(keywords[i]);

			for (String m : comMap.keySet()) {
				if (fieldVO.getFttitle().equals(m)) {
					Map<String, Object> temp = comMap.get(m);
					fieldVO.setFtweb(temp.get("website").toString());
					fieldVO.setFtaddr(temp.get("address").toString());
					String[] doSplit = null;
					if (temp.get("do").equals("제한없음")) {

						for (FieldtripVO vo : fieldService.findnInsertCandidates(fieldVO, memVO, cateVO, areaVO)) {
							tempKey.put(vo.getFttitle(), vo.getFtcode());
							pvoList.add(tempKey);
						}
					} else {

						doSplit = temp.get("do").toString().split("~");

						try {
							Date ftstart = new SimpleDateFormat("yyyy-MM-dd").parse(doSplit[0]);
							Date ftend = new SimpleDateFormat("yyyy-MM-dd").parse(doSplit[1]);
							fieldVO.setFtstart(ftstart);
							fieldVO.setFtend(ftend);

							// insert 후 해당하는 DB고유키 저장
							for (FieldtripVO vo : fieldService.findnInsertCandidates(fieldVO, memVO, cateVO, areaVO)) {
								tempKey.put(vo.getFttitle(), vo.getFtcode());
								pvoList.add(tempKey);
							}
						} catch (ParseException e) {
							e.printStackTrace();
						}
						break;
					}
				}
			}
		}

		hs.setAttribute("tempKeyList", pvoList); // 맵 형태가 담긴 리스트
		System.out.println(hs.getAttribute("tempKeyList").toString());

		return new ResponseEntity<>(HttpStatus.OK);
	}

	// 선택한 코스들을 DB에 저장
	@RequestMapping(value = "/saveCourse", method = RequestMethod.POST)
	public void saveCourse(@RequestParam String[] tourCourse, HttpSession hs) {
		System.out.println(Arrays.deepToString(tourCourse));
		ArrayList<Map<String, Integer>> list = (ArrayList<Map<String, Integer>>) hs.getAttribute("tempKeyList");
		Map<String, Integer> FtcodeMap = list.iterator().next();
		FieldtripVO fvo = new FieldtripVO();
		TourismVO tvo = new TourismVO();

		for (String f : FtcodeMap.keySet()) {
			fvo.setFtcode(FtcodeMap.get(f));
		}

		for (int i = 0; i < tourCourse.length; i++) {
			Map<String, Object> map = JsonParse.jsonToSingleMap(tourCourse[i]);
			tvo.setTouraddr((String) map.get("placeAddr"));
			tvo.setTourremarks((String) map.get("placeName"));
			tvo.setTourweb((String) map.get("placeUrl"));
			fieldService.insertTourCourse(fvo, tvo);
		}
	}

	@RequestMapping(value = "/login/{number}", method = RequestMethod.GET)
	public @ResponseBody int loginPost(@PathVariable int number) {
		System.out.println("dfdffdf" + number);

		return number;
	}

}
