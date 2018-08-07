package com.kh.spring.message.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.message.model.dao.MessageDAO;

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
	public int insertMsg(Map<String, String> map) {
		
		return messageDAO.insertMsg(sqlSession, map);
	}

}
