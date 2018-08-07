package com.kh.spring.message.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface MessageDAO {
	
	int CheckId(SqlSessionTemplate sqlSession, String receive_user);
	
	int insertMsg(SqlSessionTemplate sqlSession, Map<String, String> map);

}
