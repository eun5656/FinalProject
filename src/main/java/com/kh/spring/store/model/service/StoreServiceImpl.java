package com.kh.spring.store.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.spring.store.model.dao.StoreDAO;
import com.kh.spring.store.model.vo.Store;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreDAO dao;
	
	private Logger logger=LoggerFactory.getLogger(StoreServiceImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Store selectOne(String store_pk) {
		
		Store store = dao.selectOne(sqlSession,store_pk);
		return store;
	}

}
