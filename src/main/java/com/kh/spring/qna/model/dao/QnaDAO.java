package com.kh.spring.qna.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.qna.model.vo.Qna;

public interface QnaDAO {

	int insertQna(SqlSessionTemplate sqlSession, Map<String, Object> map);
	
	List<Qna> selectQnaList(SqlSessionTemplate sqlSession, int store_pk,int cPage,int numPerPage);
	
	int qnaSelectCount(SqlSessionTemplate sqlSession, int store_pk);
	
	int updateQna(SqlSessionTemplate sqlSession, Map<String, Object> map);
	
}
