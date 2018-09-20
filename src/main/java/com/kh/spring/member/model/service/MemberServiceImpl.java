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
	public Member loginCheck(String memberId) {		
		return memberDAO.loginCheck(sqlSession, memberId);
	}
	
	@Override
	public int countMessage(String memberId) {
		return memberDAO.countMessage(sqlSession,memberId);
	}
	
	@Override
	public int duplicateIdCheck(String memberId) {		
		return memberDAO.duplicateIdCheck(sqlSession, memberId);
	}

	@Override
	public int duplicateEmailCheck(String memberEmail) {
		return memberDAO.duplicateEmailCheck(sqlSession, memberEmail);
	}
	
	@Override
	public int insertMember(Member m) {		
		return memberDAO.insertMember(sqlSession, m);
	}

	@Override
	public int duplicateMemberEmailCheck(String memberEmail) {
		return memberDAO.duplicateMemberEmailCheck(sqlSession, memberEmail);
	}

	@Override
	public int insertStore(Store s) {
		return memberDAO.insertStore(sqlSession, s);
	}
	
	@Override
	public int checkPw(String memberEmail) {
		return memberDAO.checkPw(sqlSession,memberEmail);
	}

	@Override
	public String findId(String memberEmail) {
		return memberDAO.findId(sqlSession,memberEmail);
	}

	@Override
	public int checkId(String memberEmail) {
		return memberDAO.checkId(sqlSession, memberEmail);
	}
	
}