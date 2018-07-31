package com.kh.spring.deal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.deal.model.service.DealService;

@Controller
public class DealController {
	
	@Autowired
	private DealService service;
	
	
	@RequestMapping("/deal/dealList.do")
	public String dealList(){
		
		return "deal/dealList";
	}
	
	@RequestMapping("/deal/dealForm.do")
	public String dealForm() {
		return "deal/dealForm";
	}

	
	@RequestMapping("/deal/dealWriter.do")
	public String dealWriter() {
		return "deal/dealWriter";
	}
}
