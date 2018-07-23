package com.kinder.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.kinder.service.MemberService;

public class AuthInterceptor extends HandlerInterceptorAdapter {

  private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
  
  @Override
  public boolean preHandle(HttpServletRequest request,
	      HttpServletResponse response, Object handler) throws Exception {
	    
	    HttpSession session = request.getSession();   
	    String uri = request.getRequestURI();
	    if(uri.contains("tmain") || uri.contains("tmenu")) {
	    	if(session.getAttribute("tlogin") == null){
	       		logger.info("current user is not logined");
	      
	       		response.sendRedirect("/kinder/tlogin");
	          return false;
	        }
	    }  
	    if(uri.contains("gmain") || uri.contains("gmenu")) {
		    if(session.getAttribute("glogin") == null){
		       		logger.info("current user is not logined");
		      
		       		response.sendRedirect("/kinder/glogin");
		          return false;
		        }
		}  
	    return true;
	}
}
  
