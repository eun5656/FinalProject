package com.kh.spring.dealReview.model.service;

import java.util.List;

import com.kh.spring.dealReview.model.vo.DealReview;

public interface DealReviewService {
	List<DealReview> dealReviewList(int deal_pk);
	int dealReviewInsert(DealReview deal_review);
	String selectReImg(int deal_review_pk);
	int dealReviewDelete(int deal_review_pk);
	int dealReviewReplyInsert(DealReview deal_review);
}
