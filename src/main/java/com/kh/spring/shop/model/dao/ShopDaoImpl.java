package com.kh.spring.shop.model.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.store.controller.StoreController;
import com.kh.spring.store.model.vo.Store;

@Repository
public class ShopDaoImpl implements ShopDao {
	private Logger logger = Logger.getLogger(StoreController.class);

	


	@Override
	public List<Store> basicShopList(SqlSessionTemplate sqlSession) {
		List<Store> list=sqlSession.selectList("shop.basicShopList");
		return list;
	}




	@Override
	public List<Store> mainStoreList(SqlSessionTemplate sqlSession) {
		List<Store> list=sqlSession.selectList("shop.mainStoreList");
		return list;
	}




	@Override
	public List<Store> reviewSortShopList(SqlSessionTemplate sqlSession) {
		List<Store> list=sqlSession.selectList("shop.reviewSortShopList");
		return list;
	}




	@Override
	public List<Store> rankSortShopList(SqlSessionTemplate sqlSession) {
		List<Store> list=sqlSession.selectList("shop.rankSortShopList");
		return list;
	}




	@Override
	public List<Store> bookmarkSortShopList(SqlSessionTemplate sqlSession) {
		List<Store> list=sqlSession.selectList("shop.bookmarkSortShopList");
		//수정하기
		return list;
	}

}