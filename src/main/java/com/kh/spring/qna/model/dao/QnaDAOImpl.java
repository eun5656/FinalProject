package com.kh.spring.qna.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.qna.model.vo.Qna;

@Repository
public class QnaDAOImpl implements QnaDAO {

	@Override
	public int insertQna(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.insert("qna.insertQna", map);
	}

	@Override
	public List<Qna> selectQnaList(SqlSessionTemplate sqlSession, int store_pk,int cPage,int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("qna.selectQnaList", store_pk,rb);
	}

	@Override
	public int qnaSelectCount(SqlSessionTemplate sqlSession, int store_pk) {
		
		return sqlSession.selectOne("qna.qnaSelectCount", store_pk);
	}

	@Override
	public int updateQna(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.update("qna.updateQna", map);
	}

	
}