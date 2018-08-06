package com.kh.spring.message.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.message.model.service.MessageService;
import com.kh.spring.message.model.vo.Message;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/message/sendMessage.do")
	public String SendMessage() {
		return "message/sendForm";
	}

	@RequestMapping("/message/receiveMessage.do")
	public String ReceiveMessage() {
		return "message/receiveForm";
	}
	
	@RequestMapping("/message/sendMessageEnd.do")
	public String sendMessageEnd(String receiveUser, String sendContent) {
	
		
		return "redirect:/";
	}

	
	@RequestMapping("/member/checkId.do")
	public ModelAndView CheckId(String receiveUser,ModelAndView mv) throws UnsupportedEncodingException {
		
		boolean check = messageService.CheckId(receiveUser)==0?true:false;
		
		Map map = new HashMap();
		
		map.put("check", check);
		
		mv.addAllObjects(map);
		
		mv.setViewName("jsonView");
		
		return mv;
	}
}
