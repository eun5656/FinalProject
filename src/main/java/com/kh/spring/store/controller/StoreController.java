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
		String view="store/store";
		String store_pk = req.getParameter("store_pk");
		Store store = service.selectOne(1);
		System.out.println("스토어 값 확인 : "+store);
		return view;
	}
	
	
}
