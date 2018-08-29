package com.jiwon.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.bson.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kinder.domain.ClassVO;
import com.kinder.domain.MemberVO;
import com.jiwon.domain.VideoVO;
import com.jiwon.dto.AttendDTO;
import com.jiwon.dto.CalendarDTO;
import com.jiwon.dto.ChildrenDTO;
import com.jiwon.mongo.MongoAttendCheck;
import com.jiwon.persistence.JChildrenDAO;
import com.jiwon.service.JapiService;
import com.kinder.domain.ChildrenVO;
import com.kinder.domain.TeacherVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class JiwonController {
	
	private static final Logger logger = LoggerFactory.getLogger(JiwonController.class);
	
	Calendar c = Calendar.getInstance();
	int month = c.get(Calendar.MONTH)+1 ;
	String today = c.get(Calendar.YEAR) + "-" + month + "-" + c.get(Calendar.DATE);
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
	String late = today + "T10:30:00Z";
	
	@Inject JChildrenDAO dao;
	@Inject JapiService apiservice;
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/gmenu19", method = RequestMethod.GET)
	public String gmenu19(HttpSession session) throws Exception {
		if(Objects.isNull(session.getAttribute("children"))) {
			MemberVO vo = (MemberVO)session.getAttribute("glogin");
			session.setAttribute("children", dao.getChildrenList(vo.getMemid()));
		}
		return "/gmenu19";
	}
	@RequestMapping(value = "/insertVideo", method = RequestMethod.POST)
	public String insertVideo(HttpServletRequest r, @ModelAttribute("VideoVO") VideoVO vo) throws Exception {
			dao.insertVideoInfo(vo);
		return "/gmenu19";
	}
	@RequestMapping(value = "/youtubeApi", method = RequestMethod.GET)
	public ResponseEntity<String> youtubeApi(HttpServletRequest r) throws Exception {
		 HttpHeaders responseHeaders = new HttpHeaders();
		 responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		 
		 String clientId = "AIzaSyD3VvQ9ybvDJAvsYm6pIsjZhrJ9qdDqpME";//애플리케이션 클라이언트 아이디값";
		 String query = r.getParameter("q");
		 query = query.equals("") ? "어린이" : query;
		 String[] queries = query.split(" ");
		 query = String.join("%20", queries);
		 String apiURL = String.format("https://www.googleapis.com/youtube/v3/search?key=%s&part=snippet&q=%s&maxResults=4&safeSearch=strict&type=video&d_catg=320040010",
				   clientId, query); // json 결과
		 StringBuffer sb= apiservice.youtubeService(apiURL);
		 return new ResponseEntity<String>(sb.toString(), responseHeaders, HttpStatus.CREATED);
	}
	@RequestMapping(value = "/youtubeApiBase", method = RequestMethod.GET)
	public ResponseEntity<String> youtubeApiBase(HttpServletRequest r) throws Exception {
		 HttpHeaders responseHeaders = new HttpHeaders();
		 responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		 
		 String clientId = "AIzaSyD3VvQ9ybvDJAvsYm6pIsjZhrJ9qdDqpME";//애플리케이션 클라이언트 아이디값";
		 String query = dao.getKeyword(Integer.parseInt(r.getParameter("ccode")));
		 System.out.println("Qeury : " + r.getParameter("ccode") + query);
		 if(Objects.isNull(query)) {
			query = dao.getInterest(Integer.parseInt(r.getParameter("ccode")));
			query = Objects.isNull(query)? "어린이" : query;
		 }
		 String[] queries = query.split(" ");
		 query = String.join("%20", queries);
		 String apiURL = String.format("https://www.googleapis.com/youtube/v3/search?key=%s&part=snippet&q=%s&maxResults=4&safeSearch=strict&type=video&order=rating",
				   clientId, query); // json 결과
		 StringBuffer sb= apiservice.youtubeService(apiURL);
		 return new ResponseEntity<String>(sb.toString(), responseHeaders, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/youtubeApiRecent", method = RequestMethod.GET)
	public ResponseEntity<String> youtubeApiRecent(HttpServletRequest r) throws Exception {
		 HttpHeaders responseHeaders = new HttpHeaders();
		 responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		 VideoVO vo = dao.getRecentVInfo(Integer.parseInt(r.getParameter("ccode")));
		 String clientId = "AIzaSyD3VvQ9ybvDJAvsYm6pIsjZhrJ9qdDqpME";//애플리케이션 클라이언트 아이디값";
		 String voId = vo.getVid();
		 String apiURL = String.format("https://www.googleapis.com/youtube/v3/search?key=%s&part=snippet&relatedToVideoId=%s&type=video&maxResults=4&safeSearch=strict",
				   clientId, voId); // json 결과
		 StringBuffer sb = new StringBuffer("[");
		 StringBuffer sb1 = apiservice.youtubeService(apiURL);
		// System.out.println("pre :" + res.toString());
		 sb.append(sb1 + ", {\"vname\" : \""+ vo.getVname() +"\"}]");
		 return new ResponseEntity<String>(sb.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/youtubeApiFreqCh", method = RequestMethod.GET)
	public ResponseEntity<String> youtubeApiFreqCh(HttpServletRequest r) throws Exception {
		 HttpHeaders responseHeaders = new HttpHeaders();
		 responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		 VideoVO vo = dao.getFreqChInfo(Integer.parseInt(r.getParameter("ccode")));
		 String clientId = "AIzaSyD3VvQ9ybvDJAvsYm6pIsjZhrJ9qdDqpME";//애플리케이션 클라이언트 아이디값";
		 String chId = vo.getVchannel(); 
		 //System.out.println(chId);
		 String apiURL = String.format("https://www.googleapis.com/youtube/v3/search?key=%s&part=snippet&maxResults=4&safeSearch=strict&type=video&channelId=%s&order=date",
				   clientId, chId); // json 결과
		 StringBuffer sb= apiservice.youtubeService(apiURL);

		 return new ResponseEntity<String>(sb.toString(), responseHeaders, HttpStatus.CREATED);
	}
	@RequestMapping(value = "/getPopV", method = RequestMethod.GET)
	public @ResponseBody List<VideoVO> getPopV(HttpServletRequest r) throws Exception {
		List<VideoVO> list = new ArrayList<>(); 
		list = dao.getPopVInfo();
		
		return list;
	}
	
	@RequestMapping(value = "/gmenu20", method = RequestMethod.GET)
	public String gmenu20(HttpSession session) throws Exception {
		if(Objects.isNull(session.getAttribute("children"))) {
			MemberVO vo = (MemberVO)session.getAttribute("glogin");
			session.setAttribute("children", dao.getChildrenList(vo.getMemid()));
		}
		return "/gmenu20";
	} 

	@RequestMapping(value = "/getBooks", method = RequestMethod.GET)
	public String getBooks(HttpServletRequest r) throws Exception {
		r.setAttribute("child", dao.getChildInfo(Integer.parseInt(r.getParameter("ccode"))));
		return "/gmenu20";
	} 
	
	// 네이버 프록시
	 @RequestMapping("/naver_book")
	 public ResponseEntity<String> doNaverProxy2(HttpServletRequest request) throws Exception {
		 HttpHeaders responseHeaders = new HttpHeaders();
		  responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		 String clientId = "Ni5BsQ5Uy1_JOw13JxiV";//애플리케이션 클라이언트 아이디값";
		 
		 String clientSecret = "h8HPswVuVi";//애플리케이션 클라이언트 시크릿값";
		 // 매개변수 처리
		 // 검색어
		 String text = request.getParameter("d_titl");
		 System.out.println("text : " + text);
		 text = URLEncoder.encode((Objects.isNull(text) ? "어린왕자" : text), "UTF-8");
		 // 검색 개수
		 String display = request.getParameter("display");
		 display = Objects.isNull(display) ? "10" : display;
		 // 검색 대상의 시작 번호
		 String start = request.getParameter("start");
		 start = Objects.isNull(start) ? "1" : start;
		 // 검색 주제
		 String target = request.getParameter("target");
		 target = Objects.isNull(target) ? "book_adv" : target;
		 System.out.println("target : " + target);

		 String apiURL = String.format("https://openapi.naver.com/v1/search/%s?d_titl=%s&display=%s&start=%s&sort=count",
		   Objects.isNull(target) ? "book" : target, text, Objects.isNull(display) ? "2" : display,
		   Objects.isNull(start) ? "1" : start); // json 결과
		 // String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text;
		 // // xml 결과
		 URL url = new URL(apiURL);
		 HttpURLConnection con = (HttpURLConnection) url.openConnection();
		 con.setRequestMethod("GET");
		 con.setRequestProperty("X-Naver-Client-Id", clientId);
		 con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		 int responseCode = con.getResponseCode();
		 BufferedReader br;
		 if (responseCode == 200) { // 정상 호출
		  br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		 } else { // 에러 발생
		  br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		 }
		 String inputLine;
		 StringBuffer res = new StringBuffer();
		 while ((inputLine = br.readLine()) != null) {
		  res.append(inputLine);
		 }
		 System.out.println("pre :" + res.toString());
		 return new ResponseEntity<String>(res.toString(), responseHeaders, HttpStatus.CREATED);
	 }
	
	@RequestMapping(value = "/gmenu21", method = RequestMethod.GET)
	public void gmenu21(HttpSession session, HttpServletRequest r) throws Exception {
		if(Objects.isNull(session.getAttribute("children"))) {
			MemberVO vo = (MemberVO)session.getAttribute("glogin");
			ArrayList<ChildrenDTO> chlist = (ArrayList<ChildrenDTO>)dao.getChildrenList(vo.getMemid());
			List<Document> list = new ArrayList<>();
			for(ChildrenDTO dto : chlist) {
				System.out.println("CCODE : "+dto.getCcode());
				list = MongoAttendCheck.findChildAt(dto.getCcode(), today);
				for (Document document : list) {
					if(document.get("state").equals("leave")) {
						dto.setState(3);
						break;
					}else if(document.get("state").equals("attend")) {
							if(((Date)document.get("date")).compareTo(format.parse(late)) > 0) {
								dto.setState(2);
							}else {
								dto.setState(1);
							}
							break;
					}else {
						dto.setState(0);
					}
				}
			}			
			session.setAttribute("children", chlist);			
		}
	}
	@RequestMapping(value = "/getChnGInfo", method = RequestMethod.GET)
	public @ResponseBody ChildrenDTO getChnGInfo(HttpServletRequest r) throws Exception {		
		return dao.getChnGInfo(Integer.parseInt(r.getParameter("ccode")));
	}
	@RequestMapping(value = "/getChildAttendInfo", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getChildAttendInfo(HttpServletRequest r) throws Exception {
		//System.out.println(r.getParameter("ccode"));
		Map<String, Object> map = new HashMap<>();
		map.put("chInfo", dao.getChildInfo(Integer.parseInt(r.getParameter("ccode"))));
		//r.setAttribute("chInfo", dao.getChildInfo(Integer.parseInt(r.getParameter("ccode"))));
		List<Document> list = MongoAttendCheck.findChildAt(Integer.parseInt(r.getParameter("ccode")), today);
		int k = -1;
		String time;
		AttendDTO dto = new AttendDTO();
		for (Document document : list) {
			//System.out.println(document.get("date").toString().split(" ")[3]);
			time = document.get("date").toString().split(" ")[3];
			if(document.get("state").equals("leave")) {
				map.put("state", "leave");
				dto.setAtetime(time);
				k = 1;
			}else if(document.get("state").equals("attend")) {
				dto.setAtstime(time);
				if(k==-1) {
					if(((Date)document.get("date")).compareTo(format.parse(late)) > 0) {
						map.put("state", "late");
					}else {
						map.put("state", "attend");
					}
					k = 1;
				}
			}
		}
		if(k==-1) {
			map.put("state", "absent");
		}
		//r.setAttribute("time", dto);
		map.put("time", dto);
		//r.setAttribute("teacher", dao.getTeacherInfo(Integer.parseInt(r.getParameter("ccode"))));
		map.put("teacher", dao.getTeacherInfo(Integer.parseInt(r.getParameter("ccode"))));
		map.put("kinInfo", dao.getKinderInfo(Integer.parseInt(r.getParameter("ccode"))));
		return map;
	}
	@RequestMapping(value = "/tmenu5", method = RequestMethod.GET)
	public void tmenu5(Model model, HttpSession session) throws Exception {
		
		TeacherVO tvo = (TeacherVO)session.getAttribute("teacher");
		int kincode = tvo.getKincode();
		List<ChildrenVO> child = dao.getKinderMember(kincode);
		List<Document> list = MongoAttendCheck.findKinderAttend(kincode, today);
		session.setAttribute("classinfo", dao.getClassList(kincode));

		int[] state = {0, 0, 0, 0, 0, 0};
		
		String late = today + "T10:30:00Z";
		
		int k;
		for (ChildrenVO vo : child) {	
			k = -1;
			for (Document document : list) {
				if(vo.getCcode() == (int)document.get("ccode")) {
					if(document.get("state").equals("leave")) {
						state[3]++;
						state[5]++;
						k = 1;
					}else if(document.get("state").equals("attend") && k==-1) {
						if(((Date)document.get("date")).compareTo(format.parse(late)) > 0) {
							state[2]++;
							state[5]++;
						}else {
							state[1]++;
							state[5]++;
						}
						k = 1;
					}
				}
			}
			if(k==-1) {
				if(vo.getClcode() == 1) {
					state[4]++;
					state[5]++;
				}else {
					state[0]++;
					state[5]++;
				}
			}
		}
		
		model.addAttribute("state", state);
		
		
	}
	
	@RequestMapping(value = "/week_attend", method = RequestMethod.GET)
	public @ResponseBody List<AttendDTO> week_attend(Model model, HttpSession session) throws Exception {
		Calendar c = Calendar.getInstance();
		c.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
		String monday = c.get(Calendar.YEAR) + "-" + month + "-" + c.get(Calendar.DATE);
		TeacherVO vo = (TeacherVO) session.getAttribute("teacher");
		System.out.println(vo.getKincode());
		AttendDTO dto = new AttendDTO(vo.getKincode(), monday);
		List<AttendDTO> list = dao.getAttendByWeek(dto);
		HashMap<String, Object> map = new HashMap<>();
		
		for(AttendDTO d : list) {
			
		}
		
		System.out.println(monday);
		return list;
	}
	@RequestMapping(value = "/getClassMember", method = RequestMethod.GET)
	public String getClassMember(Model model, HttpSession session, HttpServletRequest r) throws Exception {
		
		List<ChildrenVO> child = dao.getClassMember(Integer.parseInt(r.getParameter("clcode")));
		List<Document> list = MongoAttendCheck.findAttend(Integer.parseInt(r.getParameter("clcode")), today);
		List<AttendDTO> ad = new ArrayList<>();
		
		//System.out.println(today);
		String late = today + "T10:30:00Z";
		
		int k;
		for (ChildrenVO vo : child) {	
			k = -1;
			for (Document document : list) {
				if(vo.getCcode() == (int)document.get("ccode")) {
					if(document.get("state").equals("leave")) {
						ad.add(new AttendDTO((int)document.get("ccode"), vo.getCname(), (int)document.get("clcode"), 3));
						k = 1;
					}else if(document.get("state").equals("attend") && k==-1) {
						//System.out.println(vo.getCname() + " : " + document.get("date"));
						if(((Date)document.get("date")).compareTo(format.parse(late)) > 0) {
							ad.add(new AttendDTO((int)document.get("ccode"), vo.getCname(), (int)document.get("clcode"), 2));
						}else {
							ad.add(new AttendDTO((int)document.get("ccode"), vo.getCname(), (int)document.get("clcode"), 1));
						}
						k = 1;
					}
				}
			}
			if(k==-1) {
				ad.add(new AttendDTO(vo.getCcode(), vo.getCname(), Integer.parseInt(r.getParameter("clcode")), 0));
			}
		}
		
		model.addAttribute("children", ad);
		
		return "/tmenu5";
	}
	@RequestMapping(value = "/addAttend", method = RequestMethod.POST)
	public String addAttend(HttpServletRequest r, HttpSession s) throws Exception {
		TeacherVO vo = (TeacherVO)s.getAttribute("teacher");
		MongoAttendCheck.insertState(vo.getKincode(), Integer.parseInt(r.getParameter("clcode")), Integer.parseInt(r.getParameter("ccode")), "attend");
		return "/tmenu5";
	}
	@RequestMapping(value = "/addLeave", method = RequestMethod.POST)
	public String addLeave(HttpServletRequest r, HttpSession s) throws Exception {
		TeacherVO vo = (TeacherVO)s.getAttribute("teacher");
		MongoAttendCheck.insertState(vo.getKincode(), Integer.parseInt(r.getParameter("clcode")), Integer.parseInt(r.getParameter("ccode")), "leave");
		return "/tmenu5";
	}
	@RequestMapping(value="/getAttendState", method = RequestMethod.POST)
	public @ResponseBody List<CalendarDTO> getAttendState(HttpServletRequest r) throws Exception {

		List<CalendarDTO> ac = new ArrayList<>();
		//System.out.println(r.getParameter("date"));
		AttendDTO dto = new AttendDTO();
		dto.setClcode(Integer.parseInt(r.getParameter("clcode")));
		dto.setAtmonth(r.getParameter("pmonth"));
		//dto.setAtmonth("2018-07");
		ArrayList<AttendDTO> at = (ArrayList<AttendDTO>) dao.getAttendByMonth(dto);
		CalendarDTO cd = new CalendarDTO();
		int[] state = {0, 0 , 0};
		int j=0;
		for (AttendDTO i : at) {
			if(j != Integer.parseInt(i.getAtdate().split("-")[2])) {
				if(j != 0) {
					cd.setAbsent(state[0]);
					cd.setAttend(state[1]);
					cd.setLate(state[2]);
					ac.add(cd);
				}
				cd = new CalendarDTO();
				j = Integer.parseInt(i.getAtdate().split("-")[2]);
				cd.setDate(j);
				state[0]=0;
				state[1]=0;
				state[2]=0;
			}
			if(i.getAtstate() == 0)
				state[0]++;
			else if(i.getAtstate() == 1)
				state[1]++;
			else state[2]++;
			
			//System.out.println(i.getAtdate() +"// state : "+ j);
		}
		
		cd.setAbsent(state[0]);
		cd.setAttend(state[1]);
		cd.setLate(state[2]);
		ac.add(cd);
		return ac;
	}
	
	@Scheduled(cron="0 0 18 * * *")
	public void checkTime() throws Exception {
		//today = "2018-08-27";
		

		List<Integer> kl = dao.getKinderList();
		List<ClassVO> cl = new ArrayList<>();
		List<ChildrenVO> child = new ArrayList<>();
		List<Document> list = new ArrayList<>();
		AttendDTO dto = null;
		
		for (Integer i : kl) {
			System.out.println(i);	
			cl = dao.getClassList(i);
			for (ClassVO j : cl) {
				//System.out.println("clcode : " + j.getClcode());
				child = dao.getClassMember(j.getClcode());
				list = MongoAttendCheck.findAttend(j.getClcode(), today);
				int k;
				for (ChildrenVO vo : child) {	
					dto = new AttendDTO();
					k = -1;
					for (Document document : list) {
						if(vo.getCcode() == (int)document.get("ccode")) {
							if(document.get("state").equals("leave")) {
								String time =(Date) document.get("date") + "";
								String lt = time.split(" ")[3];
								dto.setAtetime(lt);
							}
							if(document.get("state").equals("attend")) {
								dto.setCcode(vo.getCcode());
								dto.setAtdate(today);
								String time =(Date) document.get("date") + "";
								String at = time.split(" ")[3];
								dto.setAtstime(at);
								if(((Date)document.get("date")).compareTo(format.parse(late)) > 0) {
									dto.setAtstate(2);
								}else {
									dto.setAtstate(1);
								}
								if(Objects.isNull(dto.getAtetime())) dto.setAtetime("20:00:00");
							}
							k=1;
						}
					}
					if(k==-1) {
						dto.setCcode(vo.getCcode());
						dto.setAtdate(today);
						dto.setAtstate(0);
					}
					//System.out.println("ccode : "+ dto.getCcode() +"atdate : " + dto.getAtdate());
					dao.insertACheck(dto);
				}
			}
		}
		
	}
	
	
}
