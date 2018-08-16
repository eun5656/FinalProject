package com.kh.spring.reserve.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.reserve.model.vo.Reserve;

public interface ReserDao {

	int storeReserveInsert(SqlSessionTemplate sqlSession, Reserve reserve);

	Reserve selectStoreReserve(SqlSessionTemplate sqlSession, Map check);

	List<Reserve> selectReserList(SqlSessionTemplate sqlSession, int store_pk);


}
