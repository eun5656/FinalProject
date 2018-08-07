package com.kh.spring.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.member.model.dao.MemberDAO;
import com.kh.spring.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	MemberDAO memberDAO;

	@Override
	public Member loginCheck(String member_id) {
		
		return memberDAO.loginCheck(sqlSession, member_id);
	}
	
	
	/*@Override
	public int insertMember(Member m) {
		
		return memberDAO.insertMember(sqlSession, m);
	}

	@Override
	public int updateMember(Member m) {
		
		return memberDAO.updateMember(sqlSession, m);
	}

	@Override
	public int duplicateIdCheck(String userId) {
		
		return memberDAO.duplicateIdCheck(sqlSession, userId);
	}*/
	
	
}
