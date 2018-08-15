package com.kh.spring.qna.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.qna.model.dao.QnaDAO;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	private QnaDAO qnaDao;

	@Override
	public int insertQna(Map<String, Object> map) {
		
		return qnaDao.insertQna(sqlSession, map);
	}

}
