package com.kh.spring.common;

import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyEmitterReturnValueHandler;

@Component
@Aspect
public class LoggerAspect {

	private Logger logger = LoggerFactory.getLogger(LoggerAspect.class);
	
	/*나눠서 하는방식	
    excution표현 = 자세히~
	@Pointcut("execution(* com.sung.spring..*(..))")
	public void myPointcut() {}	//메소드명을 하나의 ID값으로 봐도됨
	@Around("myPointcut()")
	
	within표현  패키지만
	@Around("execution(* com.sung.spring..*") //한번에하는방식
	*/
	
	@Around("execution(* com.kh.spring..*(..))") //한번에하는방식
	public Object loggerAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
		//System.out.println("진입");										//후보군
		Signature signature=joinPoint.getSignature();
		String type=signature.getDeclaringTypeName(); //어떤 AOP가 적용됫는지
		String methodName=signature.getName();
		String component="";			
		/*시비스 시작*/
		long begin=System.currentTimeMillis();
		logger.debug("ee"+type);
		if(type.indexOf("Controller")>-1){
			component="controller\t : ";
		}
		else if (type.indexOf("service")>-1) {
			component="service\t :";
		}
		else if (type.indexOf("Dao")>-1) {
			component="dao\t : ";
		}
		logger.debug("[before] "+component+type+"."+methodName+"()");
		//long end=System.currentTimeMillis();
		//logger.debug("실행시간: "+new Date(end-begin));
		
		Object obj=joinPoint.proceed();
			//aspect객체를 만들어서 보내준다.
		logger.debug("[after]");
		return obj;
		//arround는 대체적으로 Ojbect형식으로 리턴해준다.
			
	}
	
/*	@Before("execution(* com.sung.spring.memo.controller.MemoController.(deletetMemo))")
	public void memoDeleteAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
		HttpSession session=(HttpSession)RequestContextHolder.currentRequestAttributes().resolveReference(RequestAttributes.REFERENCE_SESSION);

		ServletWebRequest servletContainer = (ServletWebRequest)RequestContextHolder.getRequestAttributes();

		HttpServletRequest request = servletContainer.getRequest();

		HttpServletResponse response = servletContainer.getResponse();
		
		Member member=(Member)session;
		Object obj=joinPoint.proceed();

		if(member!=null&& member.getUserId().equals("jazzhong1")) {
			
			request.setAttribute("msg", "관리자만 삭제할수있습니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			//밑으로 계속내려간다. 즉 boardController로 지나가기떄문에 여기서 끊어서 줘야한다.
			//끊어주지 않을경우 respones가 없어서 보낼수 없다는 오류를출력한다.
			
		}
	}*/
}