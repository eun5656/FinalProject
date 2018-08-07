package com.kh.spring.message.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.message.model.vo.Message;

public interface MessageDAO {
	
	int CheckId(SqlSessionTemplate sqlSession, String receive_user);
	
	int insertMsg(SqlSessionTemplate sqlSession, Map<String, Object> map);
	
	List<Message> selectList(SqlSessionTemplate sqlSession,String send_user);

	List<Message> selectList2(SqlSessionTemplate sqlSession,String receive_user);
}
