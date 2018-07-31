package com.kh.spring.store.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.store.model.vo.Store;

public interface StoreDAO {

	Store selectOne(SqlSessionTemplate sqlSession, String store_pk);

}
