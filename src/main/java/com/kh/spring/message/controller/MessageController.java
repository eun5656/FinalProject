package com.kh.spring.message.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
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
	public String ReceiveMessage(String send_user, HttpServletRequest req) {
	
		List<Message> messageList = messageService.selectList(send_user);
		req.setAttribute("messageList", messageList);
		
		return "message/receiveForm1";
	}
	
	@RequestMapping("/message/receiveMessage2.do")
	public String ReceiveMessage2(String receive_user, HttpServletRequest req) {
		
		List<Message> messageList2 = messageService.selectList2(receive_user);
		req.setAttribute("messageList2", messageList2);
		
		return "message/receiveForm2";
	}
	
	@RequestMapping("/message/sendMessageEnd.do")
	public String sendMessageEnd(int member_pk,String send_user,String receive_user, String send_content,HttpServletRequest req) {
	
		Map<String, Object> map=new HashMap();
		map.put("member_pk", member_pk);
		map.put("send_user", send_user);
		map.put("receive_user", receive_user);
		map.put("send_content", send_content);
		
		messageService.insertMsg(map);
		
		System.out.println(map);
		
		return "redirect:/";
	}
	
	

	
	@RequestMapping("/member/checkId.do")
	public ModelAndView CheckId(String receive_user,ModelAndView mv) throws UnsupportedEncodingException {
		
		boolean check = messageService.CheckId(receive_user)==0?true:false;
		
		System.out.println(check);
		
		Map map = new HashMap();
		
		map.put("check", check);
		
		mv.addAllObjects(map);
		
		mv.setViewName("jsonView");
		
		return mv;
	}
}
