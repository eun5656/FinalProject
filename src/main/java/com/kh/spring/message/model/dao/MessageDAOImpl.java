package com.kh.spring.message.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAOImpl implements MessageDAO {

	@Override
	public int CheckId(SqlSessionTemplate sqlSession, String receiveUser) {
		
		return sqlSession.selectOne("message.selectCheck",receiveUser);
	}

}
