package com.kh.spring.reserve.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.reserve.model.vo.Reserve;

public interface ReserDao {

	int storeReserveInsert(SqlSessionTemplate sqlSession, Reserve reserve);

}
