package com.kh.spring.qna.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.qna.model.vo.Qna;

public interface QnaDAO {

	int insertQna(SqlSessionTemplate sqlSession, Qna qna);

}
