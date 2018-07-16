package com.kinder.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	//private static final String LOGIN = "tlogin";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object memberVO = modelMap.get("memberVO");
		if(memberVO != null) {
			logger.info("new login success");
			System.out.println("받은 주소 :"+request.getRequestURI());
			if(request.getRequestURI().contains("glogin") || request.getRequestURI().contains("gLoginWithKakao")) {
				session.setAttribute("glogin", memberVO);
				response.sendRedirect("/kinder/gmain");
			}
			else {
				session.setAttribute("tlogin", memberVO);
				response.sendRedirect("/kinder/tmain");
			}
		}
		
	}
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		HttpSession session = request.getSession();
		if(session.getAttribute("glogin") != null) {
			logger.info("clear login data before");
			session.removeAttribute("glogin");
		}
		if(session.getAttribute("tlogin") != null) {
			logger.info("clear login data before");
			session.removeAttribute("tlogin");
		}
		return true;
	}

}
