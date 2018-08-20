package com.kh.spring.reserve.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.reserve.model.vo.Payment;
import com.kh.spring.reserve.model.vo.Reserve;

public interface ReserDao {

	int storeReserveInsert(SqlSessionTemplate sqlSession, Reserve reserve);

	int selectStoreReserve(SqlSessionTemplate sqlSession, Map check);

	List<Reserve> selectReserList(SqlSessionTemplate sqlSession, int store_pk);

	int paymentInsert(SqlSessionTemplate sqlSession,Payment payment);
}
