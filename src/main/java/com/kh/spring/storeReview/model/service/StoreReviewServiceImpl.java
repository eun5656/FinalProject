package com.kh.spring.storeReview.model.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.store.controller.StoreController;
import com.kh.spring.storeReview.model.dao.StoreReviewDao;
import com.kh.spring.storeReview.model.vo.StoreReview;
@Service
public class StoreReviewServiceImpl  implements StoreReviewService {
	private Logger logger = Logger.getLogger(StoreController.class);

	@Autowired
	private StoreReviewDao storeReviewDao;

	@Autowired
	private SqlSessionTemplate sqlsession;
	@Override
	public List<StoreReview> storeReviewList(String store_pk) {
		List<StoreReview> list=storeReviewDao.storeReviewList(sqlsession,store_pk);	
		return list;
	}

}
