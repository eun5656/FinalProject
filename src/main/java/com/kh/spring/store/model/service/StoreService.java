package com.kh.spring.store.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.store.model.vo.Menu;
import com.kh.spring.store.model.vo.Store;
import com.kh.spring.storeReview.model.vo.StoreReview;

public interface StoreService {

	Store selectOne(int store_pk);

	List<Menu> selectMenu(int i);

	List<Store> storeList();

	List<Store> mainStoreList();

	int deleteMenu(String menu_pk);
	
	int insertMenu(Menu menu);

	int menuUpdate(Menu menu);

	List<Menu> menuList(int store_pk);

	int storeStarUpdate(Map updateStar);






}
