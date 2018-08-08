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
import com.kh.spring.storeReview.model.service.StoreReviewService;
import com.kh.spring.storeReview.model.vo.StoreReview;

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
		System.out.println(reviews.get(1));
		model.addAttribute("store",store);
		model.addAttribute("menus",menus);
		model.addAttribute("nails",nails);
		model.addAttribute("reviews",reviews);
		return view;
	}
	

	
	
	
	
}
