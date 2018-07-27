package com.kh.spring.mypage.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.member.model.dao.MemberDAO;
import com.kh.spring.mypage.model.dao.MypageDAO;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	MypageDAO mypageDAO;
	
}
