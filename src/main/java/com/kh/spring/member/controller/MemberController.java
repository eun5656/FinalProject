package com.kh.spring.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.util.KakaoLogin;

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
	
	@RequestMapping(value = "/oauth" , produces = "application/json", method = {RequestMethod.GET, RequestMethod.POST})
	public void kakaoLogin(@RequestParam("code") String code , HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
			System.out.println("hi");
		JsonNode token = KakaoLogin.getAccessToken(code);

		  JsonNode profile = KakaoLogin.getKakaoUserInfo(token.path("access_token").toString());
		  System.out.println(profile);
		  //UserVO vo = KakaoLogin.changeData(profile);
		 // vo.setUser_snsId("k"+vo.getUser_snsId());

		  //System.out.println(session);
		 // session.setAttribute("login", vo);
		 // System.out.println(vo.toString());

		 // vo = service.kakaoLogin(vo);  
		//  return "login/kakaoLogin";
		
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
