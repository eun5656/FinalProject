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



	@Override
	public int storeReviewInsert(SqlSessionTemplate sqlsession, StoreReview store_review) {
		// TODO Auto-generated method stub
		return sqlsession.insert("storeReview.storeReviewInsert", store_review);
	}

	@Override
	public int storeReviewReplyInsert(SqlSessionTemplate sqlsession, StoreReview store_review) {
		// TODO Auto-generated method stub
		return sqlsession.insert("storeReview.storeReviewReplyInsert", store_review);
	}


	@Override
	public int storeReviewDelete(SqlSessionTemplate sqlsession, int review_pk) {
		int reviewPk=sqlsession.insert("storeReview.storeReviewDelete", review_pk);
		System.out.println(reviewPk);
		return reviewPk;
	}



	@Override
	public String selectReImg(SqlSessionTemplate sqlsession, int review_pk) {
		return sqlsession.selectOne("storeReview.selectReImg", review_pk);
	}






	
}
