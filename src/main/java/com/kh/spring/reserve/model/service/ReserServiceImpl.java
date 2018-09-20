package com.kh.spring.reserve.model.service;

import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.spring.reserve.model.dao.ReserDao;
import com.kh.spring.reserve.model.vo.Payment;
import com.kh.spring.reserve.model.vo.Reserve;
import com.kh.spring.store.controller.StoreController;
import com.kh.spring.store.model.vo.Store_time;

@Service
public class ReserServiceImpl implements ReserService {
	private Logger logger = Logger.getLogger(StoreController.class);

	@Autowired
    ReserDao reserDao;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int storeReserveInsert(Reserve reserve) {
		int reservce_pk=reserDao.storeReserveInsert(sqlSession,reserve);
		return reservce_pk;
	}

	@Override
	public int selectStoreReserve(Map check) {
		return reserDao.selectStoreReserve(sqlSession,check);
	}

	@Override
	public List<Reserve> selectreserveList(int store_pk) {
		List<Reserve> reserveList=reserDao.selectReserList(sqlSession,store_pk);
		return reserveList;
	}

	@Override
	public int paymentInsert(Payment payment) {
		return reserDao.paymentInsert(sqlSession, payment);
	}

	@Override
	public Store_time selectStoreTime(int store_pk) {
		return reserDao.selectStoreTime(sqlSession, store_pk);
	}

}