package com.kh.spring.member.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;


import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;

@SessionAttributes(value={"memberLoggedIn"})
@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	private Logger logger = Logger.getLogger(MemberController.class);
	
	@RequestMapping("/member/Login.do")
	public String memberLogin(String memberId, String memberPw, Model model)
	{
		logger.debug("로그인메소드호출");
		//System.out.println(memberId);
		//System.out.println(memberPw);
		Member m = service.loginCheck(memberId);
		
		//logger.debug("로그인객체"+m);
	
		//응답페이지 작성
		String msg="";
		String loc="/";
		String view="/common/msg";
		
		
		System.out.println(bcryptPasswordEncoder.encode(memberPw));

		if(m!=null)
		{
			
			if(bcryptPasswordEncoder.matches(memberPw, m.getMemberPw()))
			{
				msg="로그인성공";
				
				model.addAttribute("memberLoggedIn",m);
			}
			else {
				msg="비밀번호가 일치하지 않습니다.";
			}
		}
		else {
			msg="없는 아이디입니다.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return view;
	}
	
	@RequestMapping("/member/Logout.do")
	public String logout(SessionStatus sessionStatus)
	{
		if(!sessionStatus.isComplete())
		{
			//세션끊기
			sessionStatus.setComplete();
		}
		return "redirect:/";
	}
	
	@RequestMapping("/member/memberLogin.do")
	public String MemberLogin() {
		return "member/loginForm";
	}
	
	@RequestMapping("/intro/intro.do")
	public String Intro() {
		return "intro/intro";
	}

	@RequestMapping("/member/memberJoin.do")
	public String memberEnroll() {
		return "member/joinSelect";
	}
	
	@RequestMapping("/member/JoinShopOwner.do")
	public String joinShopOwner() {
		return "member/joinShop";
	}

	@RequestMapping("/member/JoinUser.do")
	public String joinUser() {
		return "member/joinUser";
	}
	
}
