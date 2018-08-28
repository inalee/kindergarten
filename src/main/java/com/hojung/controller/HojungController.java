package com.hojung.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.protobuf.TextFormat.ParseException;
import com.hojung.domain.KidscafeVO;
import com.hojung.domain.KidscaferesCri;
import com.hojung.domain.KidscafesearchCri;
import com.hojung.domain.KidscafesumCri;
import com.hojung.domain.KinsearchCri;
import com.hojung.domain.MyresVO;
import com.hojung.persistence.KidscafeDAO;
import com.hojung.persistence.KinderDAO;
import com.hojung.service.KidscafeService;
import com.hojung.service.KinderService;
import com.kinder.domain.GuardianVO;
import com.kinder.domain.KindergartenVO;
import com.kinder.domain.MemberVO;
import com.kinder.domain.TeacherVO;

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
		/*string to date 수정!!!!*/
//		java.util.Date date = (java.util.Date) new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("cfresdate")); //string to date
//		System.out.println("================="+date);
		cri.setCfresdate(request.getParameter("cfresdate"));
		for (int i = Integer.parseInt(request.getParameter("starttime")); i < Integer.parseInt(request.getParameter("endtime")); i++) {
			cfrestime_lists[index]=i;
			index++;
		}
		cri.setCfrestime_lists(cfrestime_lists);
		cri.setAdultsnum(Integer.parseInt(request.getParameter("adults")));
		cri.setKidsnum(Integer.parseInt(request.getParameter("kids")));
		System.out.println("================="+cri);
		
		//예약 조건에 맞는 kidscafe 리스트
		List<KidscafeVO> kidscafe_list = kcservice.selectKidscafes(cri);
//		for (KidscafeVO kc : Kidscafe_list) {
//			System.out.println(kc.getCfpermit());
//		}
//		model.addAttribute("kidscafe_list", kidscafe_list); // 검색 결과
		
		JSONArray jsonArray = new JSONArray();
		model.addAttribute("kidscafe_list_json", jsonArray.fromObject(kidscafe_list)); // 검색 결과 json
		
		model.addAttribute("cri", cri); // 예약 조건 파라미터
		
		return "/kidscafe_list";
	}
	
	/* 키즈카페 예약페이지 */ 
	@RequestMapping(value = "/cafereservation", method = RequestMethod.GET)
	public String resPage(@RequestParam("cfcode") int cfcode, @RequestParam("cfresdate") Date cfresdate, Model model) throws Exception{
		// kidscafe 정보 불러오기
		KidscafeVO kidscafe = kcservice.selectOneKidscafe(cfcode);
		model.addAttribute("kidscafe", kidscafe);
		
		// cfres_summary 정보 불러오기
		KidscafesumCri cri = new KidscafesumCri();
		cri.setCfcode(cfcode);
		cri.setCfresdate(cfresdate);
		HashMap<Integer, Integer> ressum = kcservice.selectResSum(cri);
		model.addAttribute("ressum", ressum);
		
		HashMap<String, String> hm = new HashMap<>();
		HashMap<String, String> price = new HashMap<>();
		Elements emts1, emts2, emts3, prices = null;
		String emt = null;
		String url1 = "https://store.naver.com/restaurants/detail?id="+kidscafe.getUrlcode();
		String url2= "https://m.store.naver.com/restaurants/"+kidscafe.getUrlcode();
//		ArrayList<String> test = new ArrayList<>();

		try {
			emts1 = Jsoup.connect(url1).get().select(".txt");
			
			if(emts1.get(0).text()!="" || emts1.get(0).text()!=null) hm.put("cfphone", emts1.get(0).text()); //전화번호
			else hm.put("cfphone", "-");
			if(emts1.get(4).text().contains("http")) {
				if(emts1.get(4).text()!="" || emts1.get(4).text()!=null) hm.put("homepage", emts1.get(4).text()); //홈페이지
				else hm.put("homepage", "-");
				if(!emts1.get(5).text().contains("고쳐주고")) {
					if(emts1.get(5).text()!="" || emts1.get(5).text()!=null) hm.put("info", emts1.get(5).text()); // 이용정보
					else hm.put("info", "-");
				}
			} else {
				if(!emts1.get(5).text().contains("고쳐주고")) {
					if(emts1.get(5).text()!="" || emts1.get(5).text()!=null) hm.put("info", emts1.get(5).text()); // 이용정보
					else hm.put("info", "-");
				}
			}

			emts2 = Jsoup.connect(url1).get().select(".txt .list_menu .name");
			prices = Jsoup.connect(url1).get().select(".txt .list_menu .price");
			
			for (int i = 0; i < emts2.size(); i++) {
				price.put(emts2.get(i).text(), prices.get(i).text()); //가격정보
			}
			
			emts3 = Jsoup.connect(url2).get().select("meta");
			for (Element e : emts3) {
				if(e.toString().contains("twitter:description")) {					
					if(e.toString().substring(46, e.toString().length()-2)!="" || e.toString().substring(46, e.toString().length()-2)!=null) hm.put("description", e.toString().substring(46, e.toString().length()-2));//상세설명
					else hm.put("description", "-");
				}
			}

			
			
			
		} catch (Exception e) {

		}
		
		model.addAttribute("hm", hm);
		model.addAttribute("price", price);
		
		return "/kidscafe_reservation";
	}
	
	
	/* 키즈카페 예약  */
	@RequestMapping(value = "/kidscaferes", method = RequestMethod.POST)
	public String kidscafe_res(HttpSession session, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		
		// 세션에서 현재 로그인 정보를 가져옴
		MemberVO mem = (MemberVO) session.getAttribute("glogin");
		GuardianVO gvo = kservice.selectGuardian(mem.getMemid());
		
		KidscaferesCri cri = new KidscaferesCri();
		
		cri.setCfcode(Integer.parseInt(request.getParameter("cfcode")));
		cri.setGcode(gvo.getGcode());
		System.out.println("================="+request.getParameter("hidden_res_date"));
		
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MMM-dd");
		String cfresdate = request.getParameter("hidden_res_date");
		java.util.Date date = null;

        try {

            date = (Date) formatter.parse(cfresdate);
            System.out.println(date);
            System.out.println(formatter.format(date));

        } catch (java.text.ParseException e) {
            e.printStackTrace();
        }

		cri.setCfresdate(date);
		cri.setAdultsnum(Integer.parseInt(request.getParameter("adults")));
		cri.setKidsnum(Integer.parseInt(request.getParameter("kids")));
		
		String str = request.getParameter("hidden_res_time");
		int starttime = Integer.parseInt(str.split(":")[0]);
		int endtime = Integer.parseInt(str.split(":")[1].substring(5));
		
		int [] cfrestime_lists = new int[endtime-starttime+1];
		int index = 0;
		
		for (int i = starttime; i < endtime+1; i++) {
			cfrestime_lists[index]=i;
			index++;
		}
		
		cri.setCfrestime_lists(cfrestime_lists);
		System.out.println("================="+cri);
		
		rttr.addFlashAttribute("msg", "success");

		return "redirect:my_res_gmenu";
	}
	
	
	/* 나의 예약 내역 */
	@RequestMapping(value = "/my_res_gmenu", method = RequestMethod.GET)
	public String Myreservation(HttpSession session, Model model) throws Exception {

		// 세션에서 현재 로그인 정보를 가져옴
		MemberVO mem = (MemberVO) session.getAttribute("glogin");
		GuardianVO gvo = kservice.selectGuardian(mem.getMemid());
		
		// 현재 로그인한 회원의 예약 리스트를 가져옴
		List<MyresVO> res_list = kcservice.selectMyRes(gvo.getGcode());
		for (MyresVO myresVO : res_list) {
			List<Integer> integers = kcservice.selectMyRestime(myresVO.getCfrescode());
			int[] ret = new int[integers.size()];
			    for (int i=0; i < ret.length; i++)
			    {
			        ret[i] = integers.get(i).intValue();
			    }
			myresVO.setCfrestime_lists(ret);
			myresVO.setCfrestime_str(ret[0]+":00 ~ "+ret[ret.length-1]+":59");
		}
		
		model.addAttribute("res_list", res_list);
		
		return "/my_reservation";
	}
	
	/* 예약 취소 */
	@RequestMapping(value = "/deleteres", method = RequestMethod.GET)
	public String Myreservation(@RequestParam("cfrescode") int cfrescode, RedirectAttributes rttr) throws Exception {
		
		kcservice.deleteMyRes(cfrescode);
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:my_res_gmenu";
	}
	
	
	@RequestMapping(value = "/gmenu15", method = RequestMethod.GET)
	public String gmenu15() {
		
		return "/gmenu15";
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
