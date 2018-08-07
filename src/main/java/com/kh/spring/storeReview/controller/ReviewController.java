package com.kh.spring.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.nail.model.vo.Nail;
import com.kh.spring.store.controller.StoreController;
import com.kh.spring.store.model.service.StoreService;
import com.kh.spring.store.model.vo.Menu;
import com.kh.spring.store.model.vo.Store;

@Controller
public class ReviewController {
	
	private Logger logger = Logger.getLogger(StoreController.class);
	
	@RequestMapping("review/reviewList.do")
	public String store(int store_pk, Model model) {
		//String view="store/store";
		System.out.println(store_pk);
		return null;
	}

}
