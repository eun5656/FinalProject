package com.kh.spring.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.member.model.dao.MemberDAO;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.store.model.vo.Store;

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
	
	@Override
	public int duplicateIdCheck(String member_id) {		
		return memberDAO.duplicateIdCheck(sqlSession, member_id);
	}

	@Override
	public int duplicateEmailCheck(String member_email) {
		return memberDAO.duplicateEmailCheck(sqlSession, member_email);
	}
	
	@Override
	public int insertMember(Member m) {		
		return memberDAO.insertMember(sqlSession, m);
	}

	@Override
	public int duplicateMemberEmailCheck(String member_email) {
		return memberDAO.duplicateMemberEmailCheck(sqlSession, member_email);
	}

	@Override
	public int insertStore(Store s) {
		return memberDAO.insertStore(sqlSession, s);
	}
	
}
