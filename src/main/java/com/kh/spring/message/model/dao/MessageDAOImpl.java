package com.kh.spring.message.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAOImpl implements MessageDAO {

	@Override
	public int CheckId(SqlSessionTemplate sqlSession, String receive_user) {
		System.out.println(receive_user);
		return sqlSession.selectOne("message.selectCheck",receive_user);
	}

	@Override
	public int insertMsg(SqlSessionTemplate sqlSession, Map<String, String> map) {
		
		return sqlSession.insert("message.insertMsg", map);
	}

}
