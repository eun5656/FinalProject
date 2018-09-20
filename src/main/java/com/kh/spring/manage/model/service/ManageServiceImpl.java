package com.kh.spring.manage.model.service;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.spring.manage.model.dao.ManageDAO;
import com.kh.spring.reserve.model.vo.Payment;
import com.kh.spring.store.model.vo.Store;

@Service
public class ManageServiceImpl implements ManageService {

	@Autowired
	ManageDAO manageDao;

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Store> storeList(int cPage, int numPerPage) {
		return manageDao.storeList(sqlSession, cPage, numPerPage);
	}

	@Override
	public int selectCount() {
		return manageDao.selectCount(sqlSession);
	}

	@Override
	public Store selectManage(int store_pk) {
		return manageDao.selectManage(sqlSession, store_pk);
	}

	@Override
	public List<Payment> paymentList(int cPage, int numPerPage) {
		return manageDao.paymentList(sqlSession, cPage, numPerPage);
	}

	@Override
	public int paymentCount() {
		return manageDao.paymentCount(sqlSession);
	}

	@Override
	public int paymentUpdateCheck(int payment_pk) {
		return manageDao.paymentUpdateCheck(sqlSession, payment_pk);
	}

	@Override
	public int reserveDelete(int reserve_pk) {
		return manageDao.reserveDelete(sqlSession, reserve_pk);
	}

}