package com.kh.spring.dealReview.model.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import com.kh.spring.dealReview.model.vo.DealReview;

public interface DealReviewDAO {
	List<DealReview> dealReviewList(SqlSessionTemplate sqlSession, int deal_pk);

	int dealReviewInsert(SqlSessionTemplate sqlSession, DealReview deal_review);

	String selectReImg(SqlSessionTemplate sqlSession, int deal_review_pk);

	int dealReviewDelete(SqlSessionTemplate sqlSession, int deal_review_pk);

	int dealReviewReplyInsert(SqlSessionTemplate sqlSession, DealReview deal_review);
}
