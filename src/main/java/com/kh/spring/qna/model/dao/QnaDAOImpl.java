package com.kh.spring.qna.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.qna.model.vo.Qna;

@Repository
public class QnaDAOImpl implements QnaDAO {

	@Override
	public int insertQna(SqlSessionTemplate sqlSession, Qna qna) {
		
		
		return sqlSession.insert("qna.insertQna", qna);
	}

}
