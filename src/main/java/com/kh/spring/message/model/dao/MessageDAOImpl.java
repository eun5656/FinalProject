package com.kh.spring.message.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.message.model.vo.Message;

@Repository
public class MessageDAOImpl implements MessageDAO {

	@Override
	public int CheckId(SqlSessionTemplate sqlSession, String receive_user) {
		System.out.println(receive_user);
		return sqlSession.selectOne("message.selectCheck",receive_user);
	}

	@Override
	public int insertMsg(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		
		return sqlSession.insert("message.insertMsg", map);
	}

	@Override
	public List<Message> selectList(SqlSessionTemplate sqlSession,String send_user) {
		
		return sqlSession.selectList("message.selectList", send_user);
	}

	@Override
	public List<Message> selectList2(SqlSessionTemplate sqlSession, String receive_user) {
		return sqlSession.selectList("message.selectList2", receive_user);
	}

	
	
}
