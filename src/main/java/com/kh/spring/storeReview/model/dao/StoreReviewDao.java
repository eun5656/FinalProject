package com.kh.spring.storeReview.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.storeReview.model.vo.StoreReview;

public interface StoreReviewDao {

	List<StoreReview> storeReviewList(SqlSessionTemplate sqlsession, int store_pk);

	int storeReviewInsert(SqlSessionTemplate sqlsession, StoreReview store_review);

	int storeReviewDelete(SqlSessionTemplate sqlsession, int review_pk);

	int storeReviewReplyInsert(SqlSessionTemplate sqlsession, StoreReview store_review);


}
