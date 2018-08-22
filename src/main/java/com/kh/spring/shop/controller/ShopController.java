package com.kh.spring.shop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.spring.shop.model.service.ShopService;
import com.kh.spring.shop.model.vo.Search;
import com.kh.spring.store.controller.StoreController;
import com.kh.spring.store.model.service.StoreService;
import com.kh.spring.store.model.vo.Store;

@Controller

public class ShopController {
	private Logger logger = Logger.getLogger(StoreController.class);

	@Autowired
	private ShopService service;
	
	@RequestMapping("/shop/shop.do")
	public String basicShopList(Model model){
		List<Store> shopList =service.basicShopList();
		List<Store> review_sum =service.shopBasicReviewCount();
		if(review_sum!=null) {
		for (int i = 0; i < shopList.size(); i++) {
			int count=shopList.get(i).getStore_review_count();
			int sum=review_sum.get(i).getStore_review_count();
			int avg=(int) Math.round((double)sum/count);//올림 처리..할수있음..
			System.out.println(avg);
			shopList.get(i).setStore_rank(avg);
			}
		}
		
		
		model.addAttribute("shopList", shopList);
		String view="shop/shop";
		return view;
	}
	
	@RequestMapping(value="/shop/shopSort.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String SortShopList(String sortValue)throws JsonProcessingException
	{

		List<Store> list;
		List<Store> review_sum;

		if (sortValue.equals("review")) {
			list=service.reviewSortShopList();
			review_sum =service.shopReviewCount();
		}
		else if (sortValue.equals("rank")) {
			list=service.rankSortShopList();
			review_sum =service.shopRankReviewCount();

		}
		else {
			list=service.basicShopList();
			review_sum =service.shopBasicReviewCount();
		}
		
		if(review_sum!=null) {
		for (int i = 0; i < list.size(); i++) {
			int count=list.get(i).getStore_review_count();
			int sum=review_sum.get(i).getStore_review_count();
			int avg=(int) Math.round((double)sum/count);//올림 처리..할수있음..
			System.out.println(avg);
			list.get(i).setStore_rank(avg);
			}
		}
		
		
		ObjectMapper mapper=new ObjectMapper();		
		String jsonstr="";
		
		Map shopList=new HashMap();
		shopList.put("shopList", list);
		System.out.println(list);


		jsonstr=mapper.writeValueAsString(shopList);
		return jsonstr;
	}
	

	@RequestMapping("/shop/searchLocation.do")
	public String searchLocation(String searchType,String searchLocation,Model model) {
		Search search=new Search(searchType, searchLocation);
		
		
		List<Store> shopList =service.searchShopList(search);
		
		model.addAttribute("shopList", shopList);
		String view="shop/shop";
		return view;
		
	}
	

}
