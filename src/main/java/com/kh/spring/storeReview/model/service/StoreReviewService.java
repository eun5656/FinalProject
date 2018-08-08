package com.kh.spring.storeReview.model.service;

import java.util.List;

import com.kh.spring.storeReview.model.vo.StoreReview;

public interface StoreReviewService {

	List<StoreReview> storeReviewList(int store_pk);

	

}
