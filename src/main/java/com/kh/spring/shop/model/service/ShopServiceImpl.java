package com.kh.spring.shop.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.shop.model.dao.ShopDao;
import com.kh.spring.store.model.vo.Store;

@Service
public class ShopServiceImpl implements ShopService {
	@Autowired 
	ShopDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Store> basicShopList() {
		List<Store> list = dao.basicShopList(sqlSession);
		return list;
	}

	@Override
	public List<Store> mainStoreList() {
		List<Store> list = dao.mainStoreList(sqlSession);
		return list;
	}

	@Override
	public List<Store> reviewSortShopList() {
		List<Store> list = dao.reviewSortShopList(sqlSession);
		return list;
	}

	@Override
	public List<Store> rankSortShopList() {
		List<Store> list = dao.rankSortShopList(sqlSession);
		return list;
	}

	@Override
	public List<Store> bookmarkSortShopList() {
		List<Store> list = dao.bookmarkSortShopList(sqlSession);
		return list;
	}

	

}
