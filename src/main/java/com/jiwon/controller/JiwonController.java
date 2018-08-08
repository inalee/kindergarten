package com.jiwon.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kinder.domain.ClassVO;
import com.kinder.domain.MemberVO;
import com.jiwon.domain.VideoVO;
import com.jiwon.dto.AttendDTO;
import com.jiwon.dto.CalendarDTO;
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
	
	@Inject JChildrenDAO dao;
	@Inject	JapiService apiservice;
	/**
	 * Simply selects the home view to render by returning its name.
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
			if(!Objects.isNull(vo.getVkeyword()))
			System.out.println("keyword : "+vo.getVkeyword());
			return "/gmenu19";
		}
		@RequestMapping(value = "/youtubeApi", method = RequestMethod.GET)
		public ResponseEntity<String> youtubeApi(HttpServletRequest r) throws Exception {
			 HttpHeaders responseHeaders = new HttpHeaders();
			 responseHeaders.add("Content-Type", "application/json; charset=utf-8");
			 
			 String clientId = "AIzaSyD3VvQ9ybvDJAvsYm6pIsjZhrJ9qdDqpME";//애플리케이션 클라이언트 아이디값";
			 String query = r.getParameter("q");
			 query = query.equals("") ? "어린이" : query;
			 
			 String apiURL = String.format("https://www.googleapis.com/youtube/v3/search?key=%s&part=snippet&q=%s&maxResults=4&safeSearch=strict&type=video",
					   clientId, query); // json 결과
			 StringBuffer sb = apiservice.youtubeService(apiURL);
			// System.out.println("pre :" + res.toString());
			 
			 return new ResponseEntity<String>(sb.toString(), responseHeaders, HttpStatus.CREATED);
		}
		@RequestMapping(value = "/youtubeApiRecent", method = RequestMethod.GET)
		public ResponseEntity<String> youtubeApiRecent(HttpServletRequest r) throws Exception {
			 HttpHeaders responseHeaders = new HttpHeaders();
			 responseHeaders.add("Content-Type", "application/json; charset=utf-8");
			 
			 String clientId = "AIzaSyD3VvQ9ybvDJAvsYm6pIsjZhrJ9qdDqpME";//애플리케이션 클라이언트 아이디값";
			 String voId = "zvWvz7OqBc4";
			 String apiURL = String.format("https://www.googleapis.com/youtube/v3/search?key=%s&part=snippet&relatedToVideoId=%s&type=video&maxResults=4&safeSearch=strict",
					   clientId, voId); // json 결과
			 StringBuffer sb = apiservice.youtubeService(apiURL);
			// System.out.println("pre :" + res.toString());
			 
			 return new ResponseEntity<String>(sb.toString(), responseHeaders, HttpStatus.CREATED);
		}
	@RequestMapping(value = "/gmenu20", method = RequestMethod.GET)
	public String gmenu20() {
		
		return "/gmenu20";
	} 
	@RequestMapping(value = "/gmenu21", method = RequestMethod.GET)
	public void gmenu21(HttpSession session) throws Exception {
		MemberVO vo = (MemberVO)session.getAttribute("glogin");
		session.setAttribute("children", dao.getChildrenList(vo.getMemid()));
	}
	
	@RequestMapping(value = "/getChildAttendInfo", method = RequestMethod.GET)
	public String getChildAttendInfo(HttpServletRequest r) throws Exception {
		//System.out.println(r.getParameter("ccode"));
		String late = today + "T10:30:00Z";
		r.setAttribute("chInfo", dao.getChildInfo(Integer.parseInt(r.getParameter("ccode"))));
		List<Document> list = MongoAttendCheck.findChildAt(Integer.parseInt(r.getParameter("ccode")), today);
		int k = -1;
		String time;
		AttendDTO dto = new AttendDTO();
		for (Document document : list) {
			//System.out.println(document.get("date").toString().split(" ")[3]);
			time = document.get("date").toString().split(" ")[3];
			if(document.get("state").equals("leave")) {
				r.setAttribute("state", "leave");
				dto.setAtetime(time);
				k = 1;
			}else if(document.get("state").equals("attend")) {
				dto.setAtstime(time);
				if(k==-1) {
					if(((Date)document.get("date")).compareTo(format.parse(late)) > 0) {
						r.setAttribute("state", "late");
					}else {
						r.setAttribute("state", "attend");
					}
					k = 1;
				}
			}
		}
		if(k==-1) {
			r.setAttribute("state", "absent");
		}
		r.setAttribute("time", dto);
		
		return "/gmenu21";
	}
	@RequestMapping(value = "/tmenu5", method = RequestMethod.GET)
	public void tmenu5(Model model, HttpSession session) throws Exception {
		
		TeacherVO vo = (TeacherVO)session.getAttribute("teacher");
		int kincode = vo.getKincode();
		
		session.setAttribute("classinfo", dao.getClassList(kincode));
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
		
		model.addAttribute("clmem", ad);
		
		return "/tmenu5";
	}
	@RequestMapping(value = "/addAttend", method = RequestMethod.POST)
	public String addAttend(HttpServletRequest r, HttpSession s) throws Exception {
		TeacherVO vo = (TeacherVO)s.getAttribute("teacher");
		MongoAttendCheck.insertAttend(vo.getKincode(), Integer.parseInt(r.getParameter("clcode")), Integer.parseInt(r.getParameter("ccode")));
		return "/tmenu5";
	}
	@RequestMapping(value = "/addLeave", method = RequestMethod.POST)
	public String addLeave(HttpServletRequest r, HttpSession s) throws Exception {
		TeacherVO vo = (TeacherVO)s.getAttribute("teacher");
		MongoAttendCheck.insertLeave(vo.getKincode(), Integer.parseInt(r.getParameter("clcode")), Integer.parseInt(r.getParameter("ccode")));
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
	
	@Scheduled(cron="0 0 20 * * *")
	public void checkTime() throws Exception {
		
		String late = today + "T10:30:00Z";

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
	
	@RequestMapping(value = "/getSearch", method = RequestMethod.GET)
	public ResponseEntity<String> getSerchedResult(@RequestParam String query) throws Exception {
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		
		StringBuffer sb = apiservice.youtubeService(query);
		return new ResponseEntity<String>(sb.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
}
