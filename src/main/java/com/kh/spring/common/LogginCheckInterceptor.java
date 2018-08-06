package com.kh.spring.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LogginCheckInterceptor extends HandlerInterceptorAdapter {

	private Logger logger=LoggerFactory.getLogger(LogginCheckInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(logger.isDebugEnabled()){
			logger.debug("=============intercepter start=================");
			logger.debug(request.getRequestURI()); //maaing주소 찍어줌.
			logger.debug("-----------------------------------------------");
		}
		
		if(request.getSession().getAttribute("memberLoggedIn")==null) {
			
			
			System.out.println(request.getSession().getAttribute("memberLoggedIn"));
			
			String ajaxCall = (String) request.getHeader("AJAX");

			 if("true".equals(ajaxCall)){
				 request.setAttribute("msg", "로그인을 해주세요");
				 request.setAttribute("loc", "/");
			     request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			 }



					
			
			return false;	//밑으로 계속내려간다. 즉 boardController로 지나가기떄문에 여기서 끊어서 줘야한다.
							//끊어주지 않을경우 respones가 없어서 보낼수 없다는 오류를출력한다.
		}
		
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		if(logger.isDebugEnabled()){
			logger.debug("=============postHandle=================");
			logger.debug("-----------------------------------------------");
		}
		
	
		
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		if(logger.isDebugEnabled()){
			logger.debug("=============after start=================");
			logger.debug(request.getRequestURI()); //maaing주소 찍어줌.
			logger.debug("-----------------------------------------------");
		}
		super.afterCompletion(request, response, handler, ex);
	}

}
