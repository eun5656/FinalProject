package com.kh.spring.shop.model.service;

import java.util.List;

import com.kh.spring.store.model.vo.Store;

public interface ShopService {


	List<Store> basicShopList();

	List<Store> mainStoreList();

}
