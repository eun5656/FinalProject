package com.kh.spring.shop.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.store.model.vo.Store;

public interface ShopDao {

	List<Store> basicShopList(SqlSessionTemplate sqlSession);

	List<Store> mainStoreList(SqlSessionTemplate sqlSession);

	List<Store> reviewSortShopList(SqlSessionTemplate sqlSession);

	List<Store> rankSortShopList(SqlSessionTemplate sqlSession);

	List<Store> bookmarkSortShopList(SqlSessionTemplate sqlSession);

}
