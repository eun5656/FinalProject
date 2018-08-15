package com.kh.spring.mypage.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.member.model.dao.MemberDAO;
import com.kh.spring.mypage.model.dao.MypageDAO;
import com.kh.spring.qna.model.vo.Qna;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	MypageDAO mypageDAO;

	@Override
	public List<Qna> selectList(int member_pk,int cPage, int numPerPage) {
		
		return mypageDAO.selectList(sqlSession,member_pk,cPage, numPerPage);
	}

	@Override
	public int selectCount(int member_pk) {
		return mypageDAO.selectCount(sqlSession,member_pk);
	}
	
}
