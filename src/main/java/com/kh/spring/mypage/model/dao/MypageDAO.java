package com.kh.spring.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.qna.model.vo.Qna;
import com.kh.spring.reserve.model.vo.Reserve;

public interface MypageDAO {
	
	List<Qna> selectList(SqlSessionTemplate sqlSession,int member_pk,int cPage, int numPerPage);

	int selectCount(SqlSessionTemplate sqlSession,int member_pk);
	
	List<Reserve> mypageReserveList(SqlSessionTemplate sqlSession, int memberPk,int cPage, int numPerPage);
	
	int reserveCount(SqlSessionTemplate sqlSession, int memberPk);
}
