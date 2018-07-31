package com.kh.spring.store.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.store.model.service.StoreService;
import com.kh.spring.store.model.vo.Store;

@Controller
public class StoreController {

	@Autowired 
	private StoreService service;
	
	@RequestMapping("/store/store.do")
	public String store(
			HttpServletRequest req
			) {
		String view="";
		Store store = service.selectOne(req.getParameter("store_pk"));
		return view;
	}
	
	
}
