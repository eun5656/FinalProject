package com.kh.spring.store.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.store.model.service.StoreService;
import com.kh.spring.store.model.vo.Menu;
import com.kh.spring.store.model.vo.Store;

@Controller
public class StoreManageController {
private Logger logger = Logger.getLogger(StoreController.class);
	
	@Autowired 
	private StoreService service;
	
	@RequestMapping("/store/storeManage.do")
	public String store(
			HttpServletRequest req, Model model
			) {
		String view="store/storeManage";
		String store_pk = req.getParameter("store_pk");
		logger.debug(store_pk + "끝");
		Store store = service.selectOne(1);
		List<Menu> menus = service.selectMenu(1);
		System.out.println("메뉴 값 확인 : "+ menus);
		System.out.println("스토어 값 확인 : "+store);
		model.addAttribute("store",store);
		model.addAttribute("menus",menus);
		return view;
	}
	@RequestMapping("/store/storeManage/menuDelete.do")
	public String menuDelete(HttpServletRequest req,
			@RequestParam String menu_pk
			) {
		System.out.println("접근완료");
		System.out.println("menu_Pk = " + menu_pk);
		int result = service.deleteMenu(menu_pk);
		return "/";
	}
	
}
