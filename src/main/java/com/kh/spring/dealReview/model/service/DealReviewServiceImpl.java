package com.kh.spring.dealReview.model.service;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.spring.dealReview.model.dao.DealReviewDAO;
import com.kh.spring.dealReview.model.vo.DealReview;

@Service
public class DealReviewServiceImpl implements DealReviewService {
	
	@Autowired
	private DealReviewDAO dealReviewDao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<DealReview> dealReviewList(int deal_pk) {
		List<DealReview> list = dealReviewDao.dealReviewList(sqlSession, deal_pk);
		return list;
	}

	@Override
	public int dealReviewInsert(DealReview deal_review) {
		int result = dealReviewDao.dealReviewInsert(sqlSession, deal_review);
		return result;
	}

	@Override
	public String selectReImg(int deal_review_pk) {
		String fileName = dealReviewDao.selectReImg(sqlSession, deal_review_pk);
		return fileName;
	}

	@Override
	public int dealReviewDelete(int deal_review_pk) {
		int result = dealReviewDao.dealReviewDelete(sqlSession, deal_review_pk);
		return result;
	}

	@Override
	public int dealReviewReplyInsert(DealReview deal_review) {
		int result = dealReviewDao.dealReviewReplyInsert(sqlSession, deal_review);
		return result;
	}

}