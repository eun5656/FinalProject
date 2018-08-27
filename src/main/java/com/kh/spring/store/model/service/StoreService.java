package com.kh.spring.store.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.designer.model.vo.designer;
import com.kh.spring.reserve.model.vo.Reserve;
import com.kh.spring.store.model.vo.Menu;
import com.kh.spring.store.model.vo.Store;
import com.kh.spring.store.model.vo.Store_time;
import com.kh.spring.storeReview.model.vo.StoreReview;

public interface StoreService {

	Store selectOne(int store_pk);

	List<Menu> selectMenu(int i);

	List<Store> storeList();

	List<Store> mainStoreList();

	int deleteMenu(String menu_pk);
	
	int insertMenu(Menu menu);

	int menuUpdate(Menu menu);


	int updateStore(Store store);

	List<Menu> menuList(int store_pk);

	int storeStarUpdate(Map updateStar);

	int selectStoreStar(int store_pk);

	List<Store> storeReviewCount();






	int updateStore_time(Store_time store_time);

	Store_time selectTime(int store_pk);

	List<Reserve> manageReserveList(Reserve reserve,int cPage,int numPerPage);
	int reserveCount(int store_pk);


}
