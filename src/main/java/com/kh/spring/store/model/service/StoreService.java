package com.kh.spring.store.model.service;

import java.util.List;


import com.kh.spring.store.model.vo.Menu;
import com.kh.spring.store.model.vo.Store;

public interface StoreService {

	Store selectOne(int store_pk);

	List<Menu> selectMenu(int i);

	int deleteMenu(String menu_pk);
	List<Store> storeList();

	List<Store> mainStoreList();
	
	

}
