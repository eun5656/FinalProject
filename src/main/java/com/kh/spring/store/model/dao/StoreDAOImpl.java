package com.kh.spring.store.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.store.model.vo.Store;

@Repository
public class StoreDAOImpl implements StoreDAO {

	@Override
	public Store selectOne(SqlSessionTemplate sqlSession, int store_pk) {
			
		return sqlSession.selectOne("store.selectOne",store_pk);
	}

}