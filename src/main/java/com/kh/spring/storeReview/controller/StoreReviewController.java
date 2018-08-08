package com.kh.spring.storeReview.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.nail.model.service.NailService;
import com.kh.spring.nail.model.vo.Nail;
import com.kh.spring.store.controller.StoreController;
import com.kh.spring.store.model.service.StoreService;
import com.kh.spring.store.model.vo.Menu;
import com.kh.spring.store.model.vo.Store;
import com.kh.spring.storeReview.model.service.StoreReviewService;
import com.kh.spring.storeReview.model.vo.StoreReview;

@Controller
public class StoreReviewController {

	@Autowired
	private StoreReviewService reviewService;
	
	@Autowired
	private StoreService storeService;

	@Autowired
	private NailService nailService;
	private Logger logger = Logger.getLogger(StoreController.class);


	@RequestMapping("/storeReview/storeReviewList.do")
	public String storeReviewList(int store_pk, Model model) {
		List<StoreReview>reviews=reviewService.storeReviewList(store_pk);
		/*int store_pk1 = Integer.parseInt((String)store_pk);
		Store store = storeService.selectOne(store_pk1);
		List<Menu> menus = storeService.selectMenu(store_pk1);
		List<Nail> nails= nailService.nailListStore(store_pk1);
		

		model.addAttribute("store",store);
		model.addAttribute("reviews",reviews);
		model.addAttribute("menus",menus);
		model.addAttribute("nails",nails);
		
		
		
		String view = "store/store";*/

		return null;
	}

}
