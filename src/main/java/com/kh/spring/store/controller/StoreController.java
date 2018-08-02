package com.kh.spring.store.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.store.model.service.StoreService;
import com.kh.spring.store.model.vo.Store;

@Controller
public class StoreController {

	private Logger logger = Logger.getLogger(StoreController.class);
	
	@Autowired 
	private StoreService service;
	
	@RequestMapping("/store/store.do")
	public String store(
			HttpServletRequest req, Model model
			) {
		String view="store/store";
		String store_pk = req.getParameter("store_pk");
		logger.debug(store_pk + "끝");
		Store store = service.selectOne(1);
		System.out.println("스토어 값 확인 : "+store);
		model.addAttribute("store",store);
		return view;
	}
	
	@RequestMapping("/store/storeList.do")
	public String store(Model model){
		return null;
	}
	
	
}
