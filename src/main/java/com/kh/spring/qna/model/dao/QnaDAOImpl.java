package com.kh.spring.qna.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.qna.model.vo.Qna;

public class QnaDAOImpl implements QnaDAO {

	@Override
	public int insertQna(SqlSessionTemplate sqlSession, Qna qna) {
		
		
		return sqlSession.insert("qna.insertQna", qna);
	}

}
