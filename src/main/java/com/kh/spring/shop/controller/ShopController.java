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
import com.kh.spring.store.controller.StoreController;
import com.kh.spring.store.model.vo.Store;

@Controller

public class ShopController {
	private Logger logger = Logger.getLogger(StoreController.class);

	@Autowired
	private ShopService service;
	
	@RequestMapping("/shop/shop.do")
	public String basicShopList(Model model){
		List<Store> shopList =service.basicShopList();
		model.addAttribute("shopList", shopList);
		String view="shop/shop";
		return view;
	}
	
	@RequestMapping(value="/shop/shopSort.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String ReviewShopList(String sortValue)throws JsonProcessingException{
		
		ObjectMapper mapper=new ObjectMapper();		
		String jsonstr="";
		jsonstr=mapper.writeValueAsString("hi");
		return jsonstr;
	}
	

	
	
	@RequestMapping("/store/storeList.do")
	public String store(Model model){
		List<Store> storelist =service.mainStoreList();
		model.addAttribute("storelist", storelist);
		String view="shop/shop";
		return view;
	}
	
	

}
