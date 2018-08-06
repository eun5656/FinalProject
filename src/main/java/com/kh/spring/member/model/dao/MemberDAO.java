package com.kh.spring.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.member.model.vo.Member;

public interface MemberDAO {
	
	Member loginCheck(SqlSessionTemplate sqlSession, String memberId);
	
	/*int insertMember(SqlSessionTemplate sqlSession,Member m);

	int updateMember(SqlSessionTemplate sqlSession, Member m);
	
	int duplicateIdCheck(SqlSessionTemplate sqlSession, String userId);*/

}
