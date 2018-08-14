package com.kh.spring.reserve.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.spring.reserve.model.service.ReserService;
import com.kh.spring.store.controller.StoreController;

@Controller
public class ReserController {
	private Logger logger = Logger.getLogger(StoreController.class);
	
	@Autowired
	private ReserService service;

}
