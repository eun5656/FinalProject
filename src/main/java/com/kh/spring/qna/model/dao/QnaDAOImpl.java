package com.kh.spring.qna.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDAOImpl implements QnaDAO {

	@Override
	public int insertQna(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.insert("qna.insertQna", map);
	}

}
