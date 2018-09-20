package com.kh.spring.message.model.service;

import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.spring.message.model.dao.MessageDAO;
import com.kh.spring.message.model.vo.Message;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	MessageDAO messageDAO;

	@Override
	public int CheckId(String receive_user) {
		return messageDAO.CheckId(sqlSession,receive_user);
	}

	@Override
	public int insertMsg(Map<String, Object> map) {
		return messageDAO.insertMsg(sqlSession, map);
	}

	@Override
	public List<Message> selectList(String send_user,int cPage, int numPerPage) {
		return messageDAO.selectList(sqlSession,send_user,cPage, numPerPage);
	}

	@Override
	public List<Message> selectList2(String receive_user,int cPage, int numPerPage) {
		return messageDAO.selectList2(sqlSession,receive_user,cPage, numPerPage);
	}

	@Override
	public Message selectOne(int message_pk) {
		return messageDAO.selectOne(sqlSession, message_pk);
	}

	@Override
	public int update(int message_pk) {
		return messageDAO.update(sqlSession, message_pk);
	}

	@Override
	public int delete(int message_pk) {
		return messageDAO.delete(sqlSession, message_pk);
	}

	@Override
	public int selectCount(String send_user) {
		return  messageDAO.selectCount(sqlSession,send_user);
	}

	@Override
	public int selectCount2(String receive_user) {
		return  messageDAO.selectCount2(sqlSession,receive_user);
	}

}