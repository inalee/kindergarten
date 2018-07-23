package com.kinder.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kinder.mongo.MongoUtil;

public class LogInterceptor extends HandlerInterceptorAdapter {

  private static final Logger logger = LoggerFactory.getLogger(LogInterceptor.class);
  
  @Override
  public boolean preHandle(HttpServletRequest request,
	    HttpServletResponse response, Object handler) throws Exception {
	    HttpSession session = request.getSession();

	    String uri = request.getRequestURI();
	    if(uri.contains("kinder") && !uri.contains("css")) {
	    	logger.info("loginterceptor : " + uri);
	    	MongoUtil.kinderlog(request, session);
	    }
	    return true;
	}
}
  
