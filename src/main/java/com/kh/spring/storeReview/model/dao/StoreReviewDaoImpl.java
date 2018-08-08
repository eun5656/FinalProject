package com.kh.spring.storeReview.model.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.store.controller.StoreController;
import com.kh.spring.storeReview.model.vo.StoreReview;

@Repository
public class StoreReviewDaoImpl implements StoreReviewDao {
	
	private Logger logger = Logger.getLogger(StoreController.class);

	

	@Override
	public List<StoreReview> storeReviewList(SqlSessionTemplate sqlsession, int store_pk) {
		return sqlsession.selectList("storeReview.storeReviewList",store_pk);
	}

}
