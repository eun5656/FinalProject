package com.kh.spring.dealReview.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.dealReview.model.vo.DealReview;

@Repository
public class DealReviewDAOImpl implements DealReviewDAO{

	@Override
	public List<DealReview> dealReviewList(SqlSessionTemplate sqlSession, int deal_pk) {
	
		return sqlSession.selectList("dealReview.dealReviewList",deal_pk);
	}

	@Override
	public int dealReviewInsert(SqlSessionTemplate sqlSession, DealReview deal_review) {
		
		return sqlSession.insert("dealReview.dealReviewInsert",deal_review);
	}

	@Override
	public String selectReImg(SqlSessionTemplate sqlSession, int deal_review_pk) {
		return sqlSession.selectOne("dealReview.selectReImg", deal_review_pk);
	
	}

	@Override
	public int dealReviewDelete(SqlSessionTemplate sqlSession, int deal_review_pk) {
		
		return sqlSession.delete("dealReview.dealReviewDelete", deal_review_pk);
	}

	@Override
	public int dealReviewReplyInsert(SqlSessionTemplate sqlSession, DealReview deal_review) {
		return sqlSession.insert("dealReview.dealReviewReplyInsert", deal_review);
		
	}

}
