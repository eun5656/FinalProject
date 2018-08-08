package com.kh.spring.storeReview.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.storeReview.model.vo.StoreReview;

public interface StoreReviewDao {

	List<StoreReview> storeReviewList(SqlSessionTemplate sqlsession, int store_pk);


}
