package com.kh.spring.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.qna.model.vo.Qna;

public interface MypageDAO {
	
	List<Qna> selectList(SqlSessionTemplate sqlSession,int member_pk,int cPage, int numPerPage);

	int selectCount(SqlSessionTemplate sqlSession,int member_pk);
}
