package com.kh.spring.reserve.model.dao;

import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import com.kh.spring.reserve.model.vo.Payment;
import com.kh.spring.reserve.model.vo.Reserve;
import com.kh.spring.store.model.vo.Store_time;

public interface ReserDao {

	int storeReserveInsert(SqlSessionTemplate sqlSession, Reserve reserve);

	int selectStoreReserve(SqlSessionTemplate sqlSession, Map check);

	List<Reserve> selectReserList(SqlSessionTemplate sqlSession, int store_pk);

	int paymentInsert(SqlSessionTemplate sqlSession,Payment payment);

	Store_time selectStoreTime(SqlSessionTemplate sqlSession, int store_pk);
	
}