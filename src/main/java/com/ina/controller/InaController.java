package com.ina.controller;



import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ina.domain.EnrollBean;
import com.ina.domain.EnrollVO;
import com.ina.domain.RegularEnrollVO;
import com.ina.domain.Regular_finalVO;
import com.ina.domain.regular_recruitVO;
import com.ina.persistence.ChildrenDAO;
import com.ina.persistence.EnrollManageDAO;
import com.ina.persistence.RegularDAO;
import com.ina.persistence.RegularEnrollDAO;
import com.ina.persistence.WaitingDAO;
import com.ina.service.CommonUtils;
import com.kinder.domain.ChildrenVO;
import com.kinder.domain.ClassVO;
import com.kinder.domain.KindergartenVO;
import com.kinder.domain.MemberVO;
import com.kinder.domain.SearchCri;
import com.kinder.domain.TeacherVO;
import com.kinder.persistence.KindergartenDAO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class InaController {
	
	private static final Logger logger = LoggerFactory.getLogger(InaController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@Inject	ChildrenDAO childdao;
	@Inject	KindergartenDAO kindao;
	@Inject WaitingDAO waitdao;
	@Inject EnrollManageDAO managedao;
	@Inject RegularDAO regudao;
	@Inject RegularEnrollDAO reguenrolldao;
	
	@RequestMapping(value = "/gmenu4", method = RequestMethod.GET)
	public String gmenu4() {
		
		return "/gmenu4";
	}

	@RequestMapping(value = "/gmenu6", method = RequestMethod.GET)
	public String gmenu6(Model model) {
		SearchCri cri = new SearchCri();
		
		cri.setKinkindcode(0);
		cri.setKinname("");
		cri.setSigungucode(0);
		
		List<Map<String, Object>> lm = regudao.search_regular(cri);
		
		model.addAttribute("list",lm);

		return "/gmenu6";
	}
	

	@RequestMapping(value = "/gmenu8", method = RequestMethod.GET)
	public String gmenu8() {
		
		return "/gmenu8";
	}
	
	@RequestMapping(value = "/testpage", method = RequestMethod.GET)
	public String testpage() {
		
		return "/testpage";
	}
	
	
	
	@RequestMapping(value = "/safety_gmenu", method = RequestMethod.GET)
	public String safety_gmenu() {
		
		return "/safety_gmenu";
	}
	
	@RequestMapping(value = "/regular", method = RequestMethod.GET)
	public String regular(Model model,HttpSession session) {
		
		TeacherVO tv = (TeacherVO)session.getAttribute("teacher");
		int kincode = tv.getKincode();
		model.addAttribute("regular_list",regudao.list_regular(kincode));

		return "/regular";
	}
	
	
	@RequestMapping(value = "/detail_regular_enroll", method = RequestMethod.GET)
	public String detail_regular_enroll(HttpServletRequest request,Model model) {
		int recode = Integer.parseInt(request.getParameter("recode"));
		int kincode = Integer.parseInt(request.getParameter("kincode"));
	
		model.addAttribute("recode",recode);
		model.addAttribute("kincode",kincode);
		model.addAttribute("reinfo",regudao.detail_regular(recode));
		model.addAttribute("kininfo",regudao.kinder_info(kincode));
		
		
		return "/detail_regular_enroll";
	}
	
	@RequestMapping(value = "/gmenu9", method = RequestMethod.GET)
	public String gmenu9(HttpSession session,Model model) {
		
		
		MemberVO vo = (MemberVO)session.getAttribute("glogin");
		int gcode = childdao.checkGid(vo.getMemid());
		
		List<Map<String, Object>> lm  = waitdao.wait_list2(gcode);
		

		

		for (Map<String, Object> map : lm) {

			int kincode = (int)map.get("kincode");
			List<Map<String, Object>> lm2 = waitdao.wait_list4(kincode);
			map.put("number", lm2.size());
			
			
			String cname = (String)map.get("cname");
			
			for (Map<String, Object> map2 : lm2) {
				String cname2 = (String)map2.get("cname");
				
				if (cname.equals(cname2)) {
					map.put("rank", map2.get("ROWNUM"));
				}
			}
			
		}


		
		model.addAttribute("wait2",lm);
		model.addAttribute("wait3",waitdao.wait_list3(gcode));
		model.addAttribute("wait5",waitdao.wait_list5(gcode));		
		model.addAttribute("regular_wait",waitdao.regular_wait(gcode));
		model.addAttribute("regular_wait2",waitdao.regular_wait2(gcode));
		model.addAttribute("regular_wait3",regudao.list_del_regular(gcode));
		
		
		return "/gmenu9";
	}

	@RequestMapping(value = "/tmenu6", method = RequestMethod.GET)
	public String tmenu6(HttpSession session,Model model) {
		TeacherVO tv = (TeacherVO)session.getAttribute("teacher");
		int kincode = tv.getKincode();
		model.addAttribute("kinlist",managedao.enroll_list(kincode));
		model.addAttribute("kinlist2",managedao.enroll_list2(kincode));
		model.addAttribute("kinlist3",managedao.enroll_list3(kincode));
		model.addAttribute("regular_list",waitdao.regular_wait3(kincode));
		model.addAttribute("regular_list2",regudao.final_list(kincode));
		model.addAttribute("regular_list3",regudao.cancel_list(kincode));
		return "/tmenu6";
	}
	
	@RequestMapping(value = "/tmenu7", method = RequestMethod.GET)
	public String tmenu7(Model model,HttpSession session) {
		
		TeacherVO tv = (TeacherVO)session.getAttribute("teacher");
		int kincode = tv.getKincode();
		model.addAttribute("kinder_info",kindao.select_all_kinder(kincode));

		return "/tmenu7";
	}

	@RequestMapping(value = "/enroll_page2", method = RequestMethod.GET)
	public String enroll_page2(HttpServletRequest request) {

		return "/enroll_page2";
	}	

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String upload() {
		
		return "/upload";
	}
	
	@RequestMapping(value = "/upload2", method = RequestMethod.GET)
	public String upload2() {
		
		return "/upload2";
	}
	
	@RequestMapping(value = "/regular_list", method = RequestMethod.GET)
	public String regular_list() {
		
		return "/regular_list";
	}
	
	@RequestMapping(value = "/coomingsoon", method = RequestMethod.GET)
	public String coomingsoon(HttpServletRequest request,Model model) {
		
		int recode = Integer.parseInt(request.getParameter("recode"));
		model.addAttribute("reinfo",regudao.detail_regular(recode));
		
		int kincode = Integer.parseInt(request.getParameter("kincode"));
		model.addAttribute("kininfo",regudao.kinder_info(kincode));
		
		
		return "/coomingsoon";
	}
	
	@RequestMapping(value = "/enroll_form", method = RequestMethod.GET)
	public String enroll_form(HttpSession session,Model model, HttpServletRequest request) {
		MemberVO vo = (MemberVO)session.getAttribute("glogin");
		int gcode = childdao.checkGid(vo.getMemid());
		model.addAttribute("ChildVO",childdao.childInfo(gcode));
		
		int recode = Integer.parseInt(request.getParameter("recode"));
		model.addAttribute("reinfo",regudao.detail_regular(recode));
		
		int kincode = Integer.parseInt(request.getParameter("kincode"));
		model.addAttribute("kininfo",regudao.kinder_info(kincode));
		
		return "/enroll_form";
	}
	
	
	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public String manage(HttpSession session,Model model) {
		TeacherVO tv = (TeacherVO)session.getAttribute("teacher");
		int kincode = tv.getKincode();
		model.addAttribute("teacherlist",kindao.find_teacher(kincode));
		return "/manage";
	}
		
	@RequestMapping(value = "/manage2", method = RequestMethod.GET)
	public String manage2(HttpSession session,Model model) {
		TeacherVO tv = (TeacherVO)session.getAttribute("teacher");
		int kincode = tv.getKincode();
		

		model.addAttribute("sellist2",kindao.select_class(kincode));
		model.addAttribute("sellist3",kindao.all_child(kincode));
		model.addAttribute("sellist4",kindao.class_info(kincode));

		return "/manage2";
	}
	
	@RequestMapping(value = "/update_class", method = RequestMethod.POST)
	public String update_class(ChildrenVO cv) {
		
		kindao.update_class(cv);
		
		return "manage2";
		
	}
	
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	
	public void upload_post(HttpServletRequest request) throws IllegalStateException, IOException {
	

		String filePath = "C:\\dev\\file\\";

		
		    MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
	        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	         
	        MultipartFile multipartFile = null;
	        String originalFileName = null;
	        String originalFileExtension = null;
	        String storedFileName = null;
	      
	         
	        File file = new File(filePath);
	        if(file.exists() == false){
	            file.mkdirs();
	            System.out.println("없음");
	        }
	         
	        while(iterator.hasNext()){
	            multipartFile = multipartHttpServletRequest.getFile(iterator.next());
	            if(multipartFile.isEmpty() == false){
	            	 logger.info("------------- file start -------------");
	            	 logger.info("name : "+multipartFile.getName());
	            	 logger.info("filename : "+multipartFile.getOriginalFilename());
	            	 logger.info("size : "+multipartFile.getSize());
	            	 logger.info("-------------- file end --------------\n");


	                originalFileName = multipartFile.getOriginalFilename();
	                originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
	                storedFileName = CommonUtils.getRandomString() + originalFileExtension;
	                logger.info("storedFileName : "+storedFileName);
	                file = new File(filePath + storedFileName);
	                multipartFile.transferTo(file);
	                
	        		String enfile = storedFileName;
	        		
	        		int encode = Integer.parseInt(request.getParameter("encode"));
	        		
	        		EnrollVO ev = new EnrollVO();
	        		ev.setEncode(encode);
	        		ev.setEnfile(enfile);
	        		ev.setEnorigin(multipartFile.getOriginalFilename());
	        		waitdao.update_state(ev);
	        		
	                
	            }
	        }
		
	}
	
	@RequestMapping(value = "/down_file", method = RequestMethod.GET)
	public void down_file(HttpServletRequest request,HttpServletResponse response) throws IOException {
		int encode = Integer.parseInt(request.getParameter("encode"));
		
		EnrollVO ev = managedao.down_file(encode);
		String storedFileName = ev.getEnfile();
		String originNmae = ev.getEnorigin();

		 byte fileByte[] = FileUtils.readFileToByteArray(new File("C:\\dev\\file\\"+storedFileName));
		 	
		   
		 
		    response.setContentType("application/octet-stream");
		    response.setContentLength(fileByte.length);
	
		    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originNmae,"UTF-8")+"\";");
		    response.setHeader("Content-Transfer-Encoding", "binary");
		    response.getOutputStream().write(fileByte);
		    	
		    response.getOutputStream().flush();
		    response.getOutputStream().close();

	}
	
	
	@RequestMapping(value = "/upload2", method = RequestMethod.POST)
	public void upload_post2(HttpServletRequest request) throws IllegalStateException, IOException {
		
		String filePath = "C:\\dev\\file\\";
		
	    MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
         
        MultipartFile multipartFile = null;
        String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;
      
         
        File file = new File(filePath);
        if(file.exists() == false){
            file.mkdirs();
        }
         
        while(iterator.hasNext()){
            multipartFile = multipartHttpServletRequest.getFile(iterator.next());
            if(multipartFile.isEmpty() == false){
            	 logger.info("------------- file start -------------");
            	 logger.info("name : "+multipartFile.getName());
            	 logger.info("filename : "+multipartFile.getOriginalFilename());
            	 logger.info("size : "+multipartFile.getSize());
            	 logger.info("-------------- file end --------------\n");


                originalFileName = multipartFile.getOriginalFilename();
                originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                storedFileName = CommonUtils.getRandomString() + originalFileExtension;
                logger.info("storedFileName : "+storedFileName);
                file = new File(filePath + storedFileName);
                multipartFile.transferTo(file);
             
        		
        		int re_encode = Integer.parseInt(request.getParameter("re_encode"));
        		
        		RegularEnrollVO rev = new RegularEnrollVO();
        		rev.setRe_encode(re_encode);
        		rev.setRefile(storedFileName);
        		rev.setReorigin(multipartFile.getOriginalFilename());
        		waitdao.update_regular_state(rev);
        	
                
            }
        }
        
        

	}
	
	
	@RequestMapping(value = "/down_file2", method = RequestMethod.GET)
	public void down_file2(HttpServletRequest request,HttpServletResponse response) throws IOException {
		int re_encode = Integer.parseInt(request.getParameter("re_encode"));
		
		RegularEnrollVO rev = waitdao.select_files(re_encode);
		String storedFileName = rev.getRefile();
		String originNmae = rev.getReorigin();

		 byte fileByte[] = FileUtils.readFileToByteArray(new File("C:\\dev\\file\\"+storedFileName));

		    response.setContentType("application/octet-stream");
		    response.setContentLength(fileByte.length);
	
		    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originNmae,"UTF-8")+"\";");
		    response.setHeader("Content-Transfer-Encoding", "binary");
		    response.getOutputStream().write(fileByte);
		    	
		    response.getOutputStream().flush();
		    response.getOutputStream().close();


	}
	
	

	@RequestMapping(value = "/status_modify", method = RequestMethod.POST)
	public String status_modify(HttpServletRequest request,EnrollVO ev) {

		
		managedao.modify_status(ev);
		
		return "/tmenu6";
	}
	
	@RequestMapping(value = "/status_modify2", method = RequestMethod.POST)
	public String status_modify2(HttpServletRequest request) {
		
		int re_encode = Integer.parseInt(request.getParameter("re_encode"));
		regudao.no_file(re_encode);
		
		return "/tmenu6";
	}
	
	
	
	@RequestMapping(value = "/final_enroll", method = RequestMethod.POST)
	public String final_enroll(HttpServletRequest request,EnrollVO ev) {

		
		managedao.p_manage_enroll(ev);
		
		return "/tmenu6";
	}
	
	@RequestMapping(value = "/final_enroll2", method = RequestMethod.POST)
	public String final_enroll2(HttpServletRequest request,Regular_finalVO rf) {
			
			regudao.regular_final(rf);
			
		return "/tmenu6";
	}
	
	
	
	
	@RequestMapping(value = "/enroll_page2", method = RequestMethod.POST)
	public String enroll_page2_post(HttpServletRequest request,HttpSession session,Model model) {

		int ccode = Integer.parseInt(request.getParameter("ccode"));
		session.setAttribute("ccode", ccode);
		
		int re = childdao.Kin_num(ccode);
		
		if(re>=3) {
			model.addAttribute("kinnum","over");
		}
		return "/enroll_page2";
	}
	
	
	@RequestMapping(value = "/enroll_page3", method = RequestMethod.GET)
	public String enroll_page3(HttpServletRequest request,HttpSession session) {
		//아이code , 입소순위받아서 update 해주기..
		int ccode = (int)session.getAttribute("ccode");
		System.out.println(ccode);
		
		int crank = Integer.parseInt(request.getParameter("totalnum"));

	
		ChildrenVO cv = new ChildrenVO();
		cv.setCcode(ccode);
		cv.setCrank(crank);
	
		childdao.updateRank(cv);
		return "/enroll_page3";
	}	


	
	@RequestMapping(value = "/enroll_page4", method = RequestMethod.GET)
	public String enroll_page4(HttpServletRequest request,Model model,HttpSession session) {
		
		int kincode = Integer.parseInt(request.getParameter("kincode"));
		model.addAttribute("kinder",kindao.searchKinder2(kincode));
		session.setAttribute("kincode", kincode);
		int ccode = (int)session.getAttribute("ccode");
		model.addAttribute("cname",childdao.search_child(ccode));
		
		EnrollBean eb = new EnrollBean();
		
		eb.setCcode(ccode);
		eb.setKincode(kincode);
		int re = childdao.same_kin(eb);
		
		if(re!=0) {
			model.addAttribute("samekin","same");
		}
		
		return "/enroll_page4";
	}	
	
	
	/**
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/enroll_page5", method = RequestMethod.GET)
	public String enroll_page5(HttpSession session,Model model) {
		int ccode = (int)session.getAttribute("ccode");
		int kincode = (int)session.getAttribute("kincode");
		EnrollBean eb = new EnrollBean();
		eb.setCcode(ccode);
		eb.setKincode(kincode);
		EnrollVO ev = childdao.result_enroll(eb);
		
		model.addAttribute("re_enroll",ev);
		
		
		
		KindergartenVO kgv = kindao.searchKinder2(kincode);
		model.addAttribute("kinname",kgv.getKinname());
		model.addAttribute("cname",childdao.search_child(ccode));
		return "/enroll_page5";
	}	
	
	
	
	@RequestMapping(value = "/enroll_page", method = RequestMethod.GET)
	public String enroll_page(HttpServletRequest request,HttpSession session,Model model) {
		
		//session에 저장되어있는 glogin에서 memid만 추출해내서.. gcode 찾기!!
		MemberVO vo = (MemberVO)session.getAttribute("glogin");
		int gcode = childdao.checkGid(vo.getMemid());
		model.addAttribute("ChildVO",childdao.childInfo(gcode));
		return "/enroll_page";
	}
	

	
	//아이 등록하는 메소드
	@RequestMapping(value="/insertChild", method = RequestMethod.POST)
	public String insert_Child(HttpServletRequest r,ChildrenVO cv){

		//주민번호 합쳐주기
		String cidnum = r.getParameter("cidnum1")+r.getParameter("cidnum2");
		cv.setCidnum(cidnum);
		
		//나이 (숫자로바꿔줌)
		int cage = Integer.parseInt(r.getParameter("cage"));
		cv.setCage(cage);
		
		String memid = r.getParameter("memid"); //hidden으로 전달함
		
		//gcode 찾는 dao 사용
		int gcode = childdao.checkGid(memid);
		cv.setGcode(gcode);
		
		// kincode
		if(cv.getCstate().equals("미재학")) {
			cv.setKincode(0);
		}
		else {
		int kincode = Integer.parseInt(r.getParameter("kincode2"));
		cv.setKincode(kincode);
		}

		System.out.println("test:"+cv.getCstate());
		


		cv.setClcode(1);
		
		childdao.insertChild(cv);
		System.out.println("아이추가 완료");

		return "redirect:ina/gmenu8";
	}

	
	@RequestMapping(value="/enroll_kinder",method=RequestMethod.POST)
	public String enroll_kinder(HttpSession session,HttpServletRequest request) throws ParseException {
		int ccode = (int)session.getAttribute("ccode");
		int kincode = (int)session.getAttribute("kincode");
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String date = request.getParameter("hopedate");
		Date hopedate = transFormat.parse(date);
		
		EnrollBean eb = new EnrollBean();
		
		eb.setCcode(ccode);
		eb.setHopedate(hopedate);
		eb.setKincode(kincode);

		childdao.enroll_kinder(eb);
		return "redirect:enroll_page5";
	}
	
	@RequestMapping(value="/make_class",method=RequestMethod.POST)
	public String search_kinder2(ClassVO cv){
			
		kindao.make_class(cv);
		
		return "redirect:manage2";
		
	}
	
	@RequestMapping(value="/del_enroll",method=RequestMethod.POST)
	public String del_enroll(HttpServletRequest request){
			
		int encode = Integer.parseInt(request.getParameter("encode"));
		managedao.enroll_delete(encode);
		
		return "gmenu9";
	}
	
	
	@RequestMapping(value="/del_enroll2",method=RequestMethod.POST)
	public String del_enroll2(HttpServletRequest request){
			
		int re_encode = Integer.parseInt(request.getParameter("re_encode"));
		managedao.regular_delete(re_encode);
		
		return "gmenu9";
	}
	
	
	@RequestMapping(value="/make_regular",method=RequestMethod.POST)
	public String make_regular(regular_recruitVO rrv) throws ParseException {

		String reopen = rrv.getReopen();
	    LocalDateTime localDate = LocalDateTime.parse(reopen);
	    String reopen2 = localDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		
	    rrv.setReopen(reopen2);
	     
		regudao.make_regular(rrv);
		return "redirect:regular";
	}
	
	
	
	@RequestMapping(value="insert_regular",method=RequestMethod.POST)
	public String insert_regular(HttpServletRequest request) throws ParseException {

		
		int recode = Integer.parseInt(request.getParameter("recode"));
		int ccode = Integer.parseInt(request.getParameter("ccode"));
	
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String date = request.getParameter("rehopedate");
		Date rehopedate = transFormat.parse(date);

		RegularEnrollVO rv = new RegularEnrollVO();
		
		rv.setCcode(ccode);
		rv.setRecode(recode);
		rv.setRehopedate(rehopedate);
		
		reguenrolldao.insert_regular(rv);
		
		int kincode = Integer.parseInt(request.getParameter("kincode"));
		
		return "redirect:enroll_form?recode="+recode+"&kincode="+kincode;
	}
	
	
	@RequestMapping(value="search_regular",method=RequestMethod.GET)
	public @ResponseBody List<Map<String, Object>> search_regular(SearchCri cri,Model model) {
		
		
		List<Map<String, Object>> lm = regudao.search_regular(cri);
		
		
		
		return lm;
	
	}
	
	
	@RequestMapping(value="del_regular",method=RequestMethod.GET)
	public String del_regular(HttpServletRequest request) {
		
		int recode = Integer.parseInt(request.getParameter("recode"));
		regudao.delete_regular(recode);
		
		return "regular";
	}
}
