package com.kh.spring.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.mypage.model.service.MypageService;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@RequestMapping("/mypage/mypage.do")
	public String mypage1() {
		return "mypage/mypageReserve";
	}
	
	@RequestMapping("/mypage/mypageBookmark.do")
	public String mypage2() {
		return "mypage/mypageBookmark";
	}

	@RequestMapping("/mypage/mypageQNAList.do")
	public String mypage4() {
		return "mypage/mypageQNAList";
	}
	
	@RequestMapping("/mypage/mypageMessage.do")
	public String mypage5() {
		return "mypage/mypageMessage";
	}
	
	@RequestMapping("/mypage/mypageChange.do")
	public String mypage6() {
		return "mypage/mypageChange";
	}
	
	@RequestMapping("/mypage/mypageDelete.do")
	public String mypage7() {
		return "mypage/mypageDelete";
	}

}
