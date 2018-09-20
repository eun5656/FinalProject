package com.kh.spring.reserve.model.dao;

import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.spring.reserve.model.vo.Payment;
import com.kh.spring.reserve.model.vo.Reserve;
import com.kh.spring.store.controller.StoreController;
import com.kh.spring.store.model.vo.Store_time;

@Repository
public class ReserDaoImpl implements ReserDao {
	
	private Logger logger = Logger.getLogger(StoreController.class);

	@Override
	public int storeReserveInsert(SqlSessionTemplate sqlSession, Reserve reserve) {
		return sqlSession.insert("storeReserve.storeReserveInsert",reserve);
	}

	@Override
	public int selectStoreReserve(SqlSessionTemplate sqlSession, Map check) {
		return sqlSession.selectOne("storeReserve.selectStoreReserve",check);
	}

	@Override
	public List<Reserve> selectReserList(SqlSessionTemplate sqlSession, int store_pk) {
		return sqlSession.selectList("storeReserve.selectReserList",store_pk);
	}

	@Override
	public int paymentInsert(SqlSessionTemplate sqlSession, Payment payment) {
		return sqlSession.insert("storeReserve.paymentInsert", payment);
	}

	@Override
	public Store_time selectStoreTime(SqlSessionTemplate sqlSession, int store_pk) {
		return sqlSession.selectOne("storeReserve.selectStoreTime", store_pk);
	}

}