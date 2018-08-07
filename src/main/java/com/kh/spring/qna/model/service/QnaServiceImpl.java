package com.kh.spring.qna.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.qna.model.dao.QnaDAO;
import com.kh.spring.qna.model.vo.Qna;

@Service
public class QnaServiceImpl implements QnaService {

	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	QnaDAO dao;
	
	@Override
	public int InsertQna(Qna qna) {
		
		return dao.insertQna(sqlSession,qna);
	}

}
