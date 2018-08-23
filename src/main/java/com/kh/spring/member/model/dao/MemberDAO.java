package com.kh.spring.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.store.model.vo.Store;

public interface MemberDAO {
	
	Member loginCheck(SqlSessionTemplate sqlSession, String memberId);
	
	int countMessage(SqlSessionTemplate sqlSession,String memberId);

	int duplicateIdCheck(SqlSessionTemplate sqlSession, String memberId);

	int duplicateEmailCheck(SqlSessionTemplate sqlSession, String memberEmail);

	int insertMember(SqlSessionTemplate sqlSession, Member m);

	int duplicateMemberEmailCheck(SqlSessionTemplate sqlSession, String memberEmail);

	int insertStore(SqlSessionTemplate sqlSession, Store s);

	String findId(SqlSessionTemplate sqlSession, String memberEmail);
	
	int checkId(SqlSessionTemplate sqlSession,String memberEmail);

	int checkPw(SqlSessionTemplate sqlSession, String memberEmail);
}
