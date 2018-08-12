package com.kh.spring.member.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.store.model.vo.Store;

@SessionAttributes(value={"memberLoggedIn"})
@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	private Logger logger = Logger.getLogger(MemberController.class);
	
	@RequestMapping("/member/Login.do")
	public String memberLogin(String member_id, String member_pw, Model model)
	{
		logger.debug("로그인메소드호출");
		
		Member m = service.loginCheck(member_id);
		
		//logger.debug("로그인객체"+m);
	
		//응답페이지 작성
		String msg="";
		String loc="/";
		String view="/common/msg";
		
		
		System.out.println(bcryptPasswordEncoder.encode(member_pw));

		if(m!=null)
		{
			
			if(bcryptPasswordEncoder.matches(member_pw, m.getMember_pw()))
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
	
	// 소개
	@RequestMapping("/intro/intro.do")
	public String Intro() {
		return "intro/intro";
	}


	// 처음 회원가입 클릭 시 나오는 화면
	@RequestMapping("/member/joinSelect.do")
	public String memberEnroll() {
		return "member/joinSelect";
	}
	
	// 샵원장 가입
	@RequestMapping("/member/JoinShopOwner.do")
	public String joinShopOwner() {
		return "member/joinShop";
	}

	// 일반회원 가입
	@RequestMapping("/member/JoinUser.do")
	public String joinUser() {
		return "member/joinUser";
	}
	
	
}
