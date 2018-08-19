package com.kh.spring.message.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.message.model.vo.Message;

public interface MessageDAO {
	
	int CheckId(SqlSessionTemplate sqlSession, String receive_user);
	
	int insertMsg(SqlSessionTemplate sqlSession, Map<String, Object> map);
	
	List<Message> selectList(SqlSessionTemplate sqlSession,String send_user,int cPage, int numPerPage);
	
	int selectCount(SqlSessionTemplate sqlSession,String send_user);

	List<Message> selectList2(SqlSessionTemplate sqlSession,String receive_user,int cPage, int numPerPage);
	
	int selectCount2(SqlSessionTemplate sqlSession,String receive_user);
	
	Message selectOne(SqlSessionTemplate sqlSession, int message_pk);
	
	int update(SqlSessionTemplate sqlSession, int message_pk);
	
	int delete(SqlSessionTemplate sqlSession, int message_pk);
}
