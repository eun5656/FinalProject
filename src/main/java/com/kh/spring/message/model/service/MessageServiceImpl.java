package com.kh.spring.message.model.service;

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

}
