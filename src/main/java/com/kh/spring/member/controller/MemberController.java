package com.kh.spring.member.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.spring.member.model.service.MemberService;

//@SessionAttributes(value={"memberLoggedIn"})
@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
//	@Autowired
//	private BCryptPasswordEncoder bcryptpasswordEncoder;
	
	
	
	@RequestMapping("/member/memberLogin.do")
	public String MemberLogin() {
		return "member/loginForm";
	}
	
	@RequestMapping("/intro/intro.do")
	public String Intro() {
		return "intro/intro";
	}
	
	
}
