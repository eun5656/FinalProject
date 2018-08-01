package com.kh.spring.message.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.message.model.service.MessageService;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	@RequestMapping("/message/sendMessage.do")
	public String SendMessage() {
		return "message/sendForm";
	}

	@RequestMapping("/message/receiveMessage.do")
	public String ReceiveMessage() {
		return "message/receiveForm";
	}

}
