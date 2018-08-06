package com.kh.spring.message.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

public interface MessageDAO {
	
	int CheckId(SqlSessionTemplate sqlSession, String receiveUser);

}
