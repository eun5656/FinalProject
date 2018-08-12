package com.kh.spring.qna.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface QnaDAO {

	int insertQna(SqlSessionTemplate sqlSession, Map<String, Object> map);
}
