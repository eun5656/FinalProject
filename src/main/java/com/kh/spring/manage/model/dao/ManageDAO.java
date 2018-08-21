package com.kh.spring.manage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.reserve.model.vo.Payment;
import com.kh.spring.store.model.vo.Store;

public interface ManageDAO {
	List<Store> storeList(SqlSessionTemplate sqlSession,int cPage,int numPerPage);
	int selectCount(SqlSessionTemplate sqlSession);
	Store selectManage(SqlSessionTemplate sqlSession, int store_pk);
	
	List<Payment> paymentList(SqlSessionTemplate sqlSession,int cPage, int numPerPage);
	
	int paymentCount(SqlSessionTemplate sqlSession);
	
	int paymentUpdateCheck(SqlSessionTemplate sqlSession,int payment_pk);
	int reserveDelete(SqlSessionTemplate sqlSession,int reserve_pk);
	
}
