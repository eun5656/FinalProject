package com.kh.spring.store.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.spring.nail.model.service.NailService;
import com.kh.spring.nail.model.vo.Nail;
import com.kh.spring.store.model.service.StoreService;
import com.kh.spring.store.model.vo.Menu;
import com.kh.spring.store.model.vo.Store;
import com.kh.spring.storeReview.model.service.StoreReviewService;
import com.kh.spring.storeReview.model.vo.StoreReview;

@Controller
public class StoreManageController {
private Logger logger = Logger.getLogger(StoreController.class);
	

	@Autowired
	private NailService Nailservice;

	@Autowired 
	private StoreService service;
	
	@Autowired
	private StoreReviewService reviewService;
	
	@RequestMapping("/store/storeManage.do")
	public String store(
			HttpServletRequest req, Model model
			) {
		String view="store/storeManage";
		int store_pk = Integer.parseInt(req.getParameter("store_pk"));
		Store store = service.selectOne(store_pk);
		List<Nail> nails= Nailservice.nailListStore(store_pk);
		List<Menu> menus = service.selectMenu(store_pk);
		List<StoreReview>reviews=reviewService.storeReviewList(store_pk);
		
		System.out.println("메뉴 값 확인 : "+ menus);
		System.out.println("스토어 값 확인 : "+store);
		System.out.println("Nail 값 확인 : "+nails);
		System.out.println(reviews.get(1));
		model.addAttribute("store",store);
		model.addAttribute("menus",menus);
		model.addAttribute("nails",nails);
		model.addAttribute("reviews",reviews);
		return view;
	}
	@RequestMapping("/store/storeManage/menuDelete.do")
	@ResponseBody
	public String menuDelete(HttpServletRequest req,
			@RequestParam String menu_pk
			) throws JsonProcessingException {
		System.out.println("접근완료");
		System.out.println("menu_Pk = " + menu_pk);
		Map map=new HashMap();//걍 귀찮아서 map으로함 
		
		ObjectMapper mapper=new ObjectMapper();		
		String jsonstr=mapper.writeValueAsString(map);
		
		int result = service.deleteMenu(menu_pk);
		return jsonstr;
	}
	
}
