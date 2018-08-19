package com.kh.spring.qna.model.service;

import java.util.List;
import java.util.Map;

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
	private QnaDAO qnaDao;

	@Override
	public int insertQna(Map<String, Object> map) {
		
		return qnaDao.insertQna(sqlSession, map);
	}

	@Override
	public List<Qna> selectQnaList(int store_pk, int cPage,int numPerPage) {
		
		return qnaDao.selectQnaList(sqlSession, store_pk,cPage,numPerPage);
	}

	@Override
	public int qnaSelectCount(int store_pk) {
		return qnaDao.qnaSelectCount(sqlSession, store_pk);
	}

	@Override
	public int updateQna(Map<String, Object> map) {
		
		return qnaDao.updateQna(sqlSession, map);
	}

	
}
