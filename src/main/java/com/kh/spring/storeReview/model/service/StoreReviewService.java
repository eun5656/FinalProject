package com.kh.spring.storeReview.model.service;

import java.util.List;
import com.kh.spring.storeReview.model.vo.StoreReview;

public interface StoreReviewService {

	List<StoreReview> storeReviewList(int store_pk);

	int storeReviewInsert(StoreReview store_review);

	int storeReviewDelete(int review_pk);

	int storeReviewReplyInsert(StoreReview store_review);

	String selectReImg(int review_pk);

}
