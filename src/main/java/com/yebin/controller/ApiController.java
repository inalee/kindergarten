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

	@RequestMapping(value = "/getSearchResult", method = RequestMethod.GET)
	public ResponseEntity<String> getSerchedResult(@RequestParam String term, @RequestParam String zone,
			@RequestParam String city, @RequestParam String date, @RequestParam String person, HttpSession hs)
			throws Exception {

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");

		// MongoDB에 Insert하기 위한 DB, Collection 세팅
		mongoService.defaultSetting("kinder", "condTempSave");
		MemberVO vo = (MemberVO) hs.getAttribute("tlogin");
		
		// MongoDB에 Insert하기 위한 json형태의 string
		String jsonString = "{'memid' : '" + vo.getMemid() + "', 'searchDate' : 'null'," + " 'term' : '" + term
				+ "', 'zone' : '" + zone + "', 'city' : '" + city + "', 'date' : '" + date + "', 'person' : '"
				+ (person == "" ? 0 : Integer.parseInt(person)) + "'}";
		
		// MongoDB Insert 시 키 값에 날짜가 있을 경우 해당 키 이름을 알려주고, date 형태로 저장
		mongoService.insertWithDate(jsonString, "searchDate");
		
		// 사용자가 입력한 조건으로 API에 request해서 검색 결과를 받아옴
		StringBuffer sb = apiService.programService(term, zone, city, date, (person == "" ? "0" : person));

		// 검색 결과 리턴
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
			HttpSession hs) { //매개변수로 프로그램 타이틀 / 해당 json 데이터를 받음

		CategoryVO cateVO = new CategoryVO();
		FieldtripVO fieldVO = new FieldtripVO();
		AreacodeVO areaVO = new AreacodeVO();
		
		// MongoDB에서 임시저장한 분류를 가져오기 위해 기본 세팅 후
		mongoService.defaultSetting("kinder", "condTempSave");
		MemberVO memVO = (MemberVO) hs.getAttribute("tlogin");

		//Map에 해당 id가 가장 최근에 검색했던 조건리스트를 입력해 값을 받아옴
		Map<Object, Object> map = mongoService.jsonForMongo(mongoService.findRecentDate(memVO.getMemid()), "memid",
				"term", "zone", "city", "date", "person");

		
		// 받아온 bson 데이터를 Map형태로 변환해  데이터 정리해서 넣기
		String[] termSplit = null;
		termSplit = map.get("term").toString().split("-");
		cateVO.setCatesub(termSplit[0]);
		cateVO.setCatemain(termSplit[1]);
		areaVO.setArarea(map.get("zone").toString());
		areaVO.setArcity(map.get("city").toString());
		fieldVO.setFtperson(map.get("person").toString());
		fieldVO.setFtselecteddate(map.get("date").toString()+"-29");

		List<Map<String, Integer>> pvoList = new ArrayList<>();
		Map<String, Integer> tempKey = new HashMap<>();
		
		// 마침표역할을 하는 데이터를 사용하기 때문에 길이를 -1 해줌
		String[] data = new String[jsondata.length-1];
		for(int i = 0; i < jsondata.length; i++) {
			if(!jsondata[i].contains("noData")) {
				data[i] = jsondata[i];
				System.out.println(data[i]);				
			}
		}
		
		// 매개변수로 받은 jsondata를 파싱하는 과정 
		Map<String, Map<String, Object>> comMap = JsonParse.jsonToMap(data);
		
		for (int i = 0; i < keywords.length; i++) {
			fieldVO.setFttitle(keywords[i]); // 매개변수로 받아온 키워드(fttitle)를 fieldVO에 set
			for (String m : comMap.keySet()) { //map으로 변환한 json데이터를 돌리면서
				if (fieldVO.getFttitle().equals(m)) { //프로그램 제목과 해당 맵의 title이 같으면
					Map<String, Object> temp = comMap.get(m); // 해당 값을 가지고와서
					fieldVO.setFtweb(temp.get("website").toString()); //웹사이트 url과
					fieldVO.setFtaddr(temp.get("address").toString()); //주소를 해당 인스턴스에 set
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
			fvo.setFtcode((int)hs.getAttribute("ftcodeToken"));
		}
		
		for (int i = 0; i < tourCourse.length; i++) {
			Map<String, Object> map = JsonParse.jsonToSingleMap(tourCourse[i]);
			tvo.setTouraddr((String) map.get("placeAddr"));
			tvo.setTourremarks((String) map.get("placeName"));
			tvo.setTourweb((String) map.get("placeUrl"));
			fieldService.insertTourCourse(fvo, tvo);
		}
	}
	
	
	
}
