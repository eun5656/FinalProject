package com.kh.spring.store.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.reserve.model.vo.Reserve;
import com.kh.spring.store.model.dao.StoreDAO;
import com.kh.spring.store.model.vo.Menu;
import com.kh.spring.store.model.vo.Store;
import com.kh.spring.store.model.vo.Store_time;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreDAO dao;
	
	private Logger logger=LoggerFactory.getLogger(StoreServiceImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Store selectOne(int store_pk) {
		
		Store store = dao.selectOne(sqlSession,store_pk);
		return store;
	}

	@Override
	public List<Menu> selectMenu(int i) {
		
		return dao.selectMenus(sqlSession,i);
	}

	@Override
	public int deleteMenu(String menu_pk) {
		
		return dao.deleteMenu(sqlSession,menu_pk);
	}
	@Override

	public List<Store> storeList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Store> mainStoreList() {
		List<Store> naillist=dao.mainStoreList(sqlSession);
		return naillist;
	}

	@Override
	public int insertMenu(Menu menu) {
		
		return dao.menuInsert(sqlSession,menu);
	}

	@Override
	public int menuUpdate(Menu menu) {
		
		return dao.menuUpdate(sqlSession, menu);
	}

	@Override

	public int updateStore(Store store) {
		// TODO Auto-generated method stub
		return dao.updateStore(sqlSession, store);
	}

	@Override
	public int updateStore_time(Store_time store_time) {
		// TODO Auto-generated method stub
		return dao.updateStore_time(sqlSession, store_time);
	}

	@Override
	public Store_time selectTime(int store_pk) {
		// TODO Auto-generated method stub
		return dao.selectTime(sqlSession, store_pk);}

	public List<Menu> menuList(int store_pk) {
		// TODO Auto-generated method stub
		return  dao.menuList(sqlSession, store_pk);

	}

	@Override
	public int storeStarUpdate(Map updateStar) {
		// TODO Auto-generated method stub
		return  dao.storeStarUpdate(sqlSession, updateStar);
	}

	@Override
	public int selectStoreStar(int store_pk) {
		// TODO Auto-generated method stub
		return dao.selectStoreStar(sqlSession, store_pk);
	}

	@Override
	public List<Store> storeReviewCount() {
		// TODO Auto-generated method stub
		return dao.storeReviewCount(sqlSession);
	}

	@Override
	public List<Reserve> manageReserveList(Reserve reserve, int cPage, int numPerPage) {
		
		return dao.manageReserveList(sqlSession, reserve, cPage, numPerPage);
	}

	@Override
	public int reserveCount(int store_pk) {
		
		return dao.reserveCount(sqlSession, store_pk);
	}


	

}
