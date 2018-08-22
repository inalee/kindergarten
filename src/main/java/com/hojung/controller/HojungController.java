package com.hojung.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hojung.domain.KidscafeVO;
import com.hojung.domain.KidscafesearchCri;
import com.hojung.domain.KinsearchCri;
import com.hojung.persistence.KidscafeDAO;
import com.hojung.persistence.KinderDAO;
import com.hojung.service.KidscafeService;
import com.hojung.service.KinderService;
import com.kinder.domain.KindergartenVO;

import net.sf.json.JSONArray;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HojungController {
	
	private static final Logger logger = LoggerFactory.getLogger(HojungController.class);
	
	@Inject
	private KinderDAO kdao;
	@Inject
	private KidscafeDAO kcdao;
	
	@Inject
	private KinderService kservice;
	@Inject
	private KidscafeService kcservice;
	
	@RequestMapping(value = "/search_keyword_gmenu", method = RequestMethod.GET)
	public String search_keyword() {
		
		return "/kinder_search_keyword";
	}
	
	/* kinder keyword로 검색 */
	@RequestMapping("/select_kinder_kw")
	public @ResponseBody List<KindergartenVO> listKinderJson1(KinsearchCri cri) throws Exception {
		logger.info("select kindergarten......");
		System.out.println("=================================================="+cri);
		return kservice.selectKinders_kw(cri);//list로 리턴
	}
	
	@RequestMapping(value = "/search_map", method = RequestMethod.GET)
	public String search_map() {
		
		return "/kinder_search_map";
	}
	
	/* kinder map으로 검색 */
	@RequestMapping("/select_kinder_map")
	public @ResponseBody List<KindergartenVO> listKinderJson2(KinsearchCri cri) throws Exception {
		logger.info("select kindergarten......");
		System.out.println("=================================================="+cri);
		return kservice.selectKinders_map(cri);//list로 리턴
	}
	
	@RequestMapping(value = "/kinder_detail", method = RequestMethod.GET)
	public String kinder_detail() {
		
		return "/kinder_detail";
	}
	
	
	/* 키즈카페 메인 */
	@RequestMapping(value = "/kidscafe_gmenu", method = RequestMethod.GET)
	public String kidscafe_main() {
		
		return "/kidscafe_main";
	}
	
	/* 예약 조건에 맞는 카페 list로 반환  */
	@RequestMapping(value = "/kidscafe", method = RequestMethod.GET)
	public String kidscafe_select(HttpServletRequest request, Model model) throws Exception {
		
		//조건 cri에 넣기
		int [] cfrestime_lists = new int[Integer.parseInt(request.getParameter("endtime"))-Integer.parseInt(request.getParameter("starttime"))];
		int index = 0;
		KidscafesearchCri cri = new KidscafesearchCri();
		
		cri.setSigungucode(Integer.parseInt(request.getParameter("sigungucode")));
		cri.setCfname(request.getParameter("cfname"));
		cri.setCfresdate(request.getParameter("cfresdate"));
		for (int i = Integer.parseInt(request.getParameter("starttime")); i < Integer.parseInt(request.getParameter("endtime")); i++) {
			cfrestime_lists[index]=i;
			index++;
		}
		cri.setCfrestime_lists(cfrestime_lists);
		cri.setCfresnum(Integer.parseInt(request.getParameter("count1"))+Integer.parseInt(request.getParameter("count2")));
		System.out.println("================="+cri);
		
		//예약 조건에 맞는 kidscafe 리스트
//		List<KidscafeVO> Kidscafe_list = kcservice.selectKidscafes(cri);
//		for (KidscafeVO kc : Kidscafe_list) {
//			System.out.println(kc.getCfpermit());
//		}
		
		model.addAttribute("kidscafe_list", kcservice.selectKidscafes(cri));
		
		JSONArray jsonArray = new JSONArray();
		model.addAttribute("kidscafe_list_json", jsonArray.fromObject(kcservice.selectKidscafes(cri)));
		
		return "/kidscafe_list";
	}
	
	/* 키즈카페 예약페이지 */ 
	@RequestMapping(value = "/cafereservation", method = RequestMethod.GET)
	public String read(@RequestParam("cfcode") int cfcode, Model model) throws Exception{
		// 상세페이지 url 불러오기
		model.addAttribute("kidscafe", kcservice.selectOneKidscafe(cfcode));
		
		Elements emts = null;
		HashMap<String, String> map = new HashMap<>();
		String src = null;
		
		ArrayList<String> test = new ArrayList<>();
		
		String url = "https://store.naver.com/attractions/detail?entry=plt&id=176714204&query=%EA%BC%AC%EB%A7%88%EB%8C%80%ED%86%B5%EB%A0%B9%20%EC%B2%9C%ED%98%B8%EC%A0%90";
		
		try {
			// img 태그들을 emts
			emts = Jsoup.connect(url).get().select(".biz_name_area .name");

			for (Element e : emts) {
				// 경로에서 파일이름만 추출
				src = e.text();
				System.out.println(src);
				
				test.add(src);
			}

		} catch (Exception e) {

		}
		
		model.addAttribute("map", map);
		
		return "/kidscafe_reservation";
	}
	
	
	
	@RequestMapping(value = "/gmenu15", method = RequestMethod.GET)
	public String gmenu15() {
		
		return "/gmenu15";
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
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		
		return "/test";
	}
}
