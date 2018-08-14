package com.kh.spring.reserve.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.kh.spring.reserve.model.service.ReserService;
import com.kh.spring.store.controller.StoreController;

@Controller
public class ReserController {
	private Logger logger = Logger.getLogger(StoreController.class);
	
	//@Autowired
//	ReserService service;
	

	@RequestMapping( value="/",produces = "application/text; charset=utf8")
	@ResponseBody
	public String insertReser()throws JsonProcessingException
	{
		return null;
	}

}
