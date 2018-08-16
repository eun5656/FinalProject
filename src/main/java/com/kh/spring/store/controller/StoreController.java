package com.kh.spring.store.controller;

import java.io.File;
//import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

import net.sf.json.JSONObject;

@Controller
public class StoreController {

	private Logger logger = Logger.getLogger(StoreController.class);
	
	@Autowired 
	private StoreService service;
	
	@Autowired
	private NailService Nailservice;
	
	@Autowired
	private StoreReviewService reviewService;
	
	
	@RequestMapping("/store/store.do")
	public String store(
			HttpServletRequest req, Model model
			) {
		String view="store/store";
		int store_pk = Integer.parseInt((String)req.getParameter("store_pk"));
		logger.debug(store_pk + "끝");
		Store store = service.selectOne(store_pk);
		List<Menu> menus = service.selectMenu(store_pk);
		List<Nail> nails= Nailservice.nailListStore(store_pk);
		List<StoreReview>reviews=reviewService.storeReviewList(store_pk);
			
		System.out.println("메뉴 값 확인 : "+ menus);
		System.out.println("스토어 값 확인 : "+store);
		System.out.println("Nail 값 확인 : "+nails);
		//System.out.println(reviews.get(1));
		model.addAttribute("store",store);
		model.addAttribute("menus",menus);
		model.addAttribute("nails",nails);
		model.addAttribute("reviews",reviews);
		return view;
	}
	@RequestMapping("/store/storeMap.do")
	public String storeMap(
			HttpServletRequest req, Model model
			) {
		String view="store/storeMap";
		int store_pk = Integer.parseInt((String)req.getParameter("store_pk"));
		Store store = service.selectOne(store_pk);
		
			
		
		System.out.println("스토어 값 확인 : "+store);
		
		model.addAttribute("store",store);
		
		return view;
	}
	@RequestMapping("/store/storeReserve.do")
	public String storeReserve(
			HttpServletRequest req, Model model
			) {
		String view="store/storeReserve";
		int store_pk = Integer.parseInt((String)req.getParameter("store_pk"));
		Store store = service.selectOne(store_pk);
		List<Menu> menuList=service.menuList(store_pk);
		
		System.out.println("스토어 값 확인 : "+store);
		
		model.addAttribute("store",store);
		model.addAttribute("menuList",menuList);

		return view;
	}
	@RequestMapping("/store/storeContact.do")
	public String storeContact(
			HttpServletRequest req, Model model
			) {
		String view="store/storeContact";
		int store_pk = Integer.parseInt((String)req.getParameter("store_pk"));
		Store store = service.selectOne(store_pk);
		
		System.out.println("스토어 값 확인 : "+store);
		
		model.addAttribute("store",store);
		
		return view;
	}
	

		


	
	
	
	
}
