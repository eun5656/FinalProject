package com.kh.spring.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoggerInterceptor extends HandlerInterceptorAdapter {
	
	// '/**' 전체 총에 대해 처리 ! 서블릿  요청에 대한것 
	private Logger logger=(Logger)LoggerFactory.getLogger(LoggerInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		if(logger.isDebugEnabled()){	//Debug를 사용가능한 레벨이라면 true.
			//Debug출력되는 상황이라면.. isDebugEnabled를 이용하여 분기를 하면
			//리소스를 절약할 수이 ㅆ음.(성능)
			logger.debug("=============intercepter start=================");
			logger.debug(request.getRequestURI()); //maaing주소 찍어줌.
			logger.debug("-----------------------------------------------");
	
		}
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if(logger.isDebugEnabled()){
			logger.debug("============post view===================");	//진행중
			logger.debug("postHandle"); //maaing주소 찍어줌.
		}
		
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		if(logger.isDebugEnabled()) {
			logger.debug("============afterComletion-========");
		}
		super.afterCompletion(request, response, handler, ex);
	}

}