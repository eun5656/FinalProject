package com.kh.spring.store.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.nail.model.service.NailService;
import com.kh.spring.nail.model.vo.Nail;
import com.kh.spring.store.model.service.StoreService;
import com.kh.spring.store.model.vo.Menu;
import com.kh.spring.store.model.vo.Store;

@Controller
public class StoreController {

	private Logger logger = Logger.getLogger(StoreController.class);
	
	@Autowired 
	private StoreService service;
	
	@Autowired
	private NailService Nailservice;
	
	@RequestMapping("/store/store.do")
	public String store(
			HttpServletRequest req, Model model
			) {
		String view="store/store";
		String store_pk = req.getParameter("store_pk");
		logger.debug(store_pk + "끝");
		Store store = service.selectOne(1);
		List<Menu> menus = service.selectMenu(1);
		List<Nail> nails= Nailservice.nailListStore(1);
		System.out.println("메뉴 값 확인 : "+ menus);
		System.out.println("스토어 값 확인 : "+store);
		System.out.println("Nail 값 확인 : "+nails);
		model.addAttribute("store",store);
		model.addAttribute("menus",menus);
		model.addAttribute("nails",nails);
		return view;
	}
	
	@RequestMapping("/store/storeList.do")
	public String store(Model model){
		return null;
	}
	
	
}
