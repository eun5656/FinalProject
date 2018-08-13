package com.kh.spring.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.store.model.vo.Store;

public interface MemberDAO {
	
	Member loginCheck(SqlSessionTemplate sqlSession, String member_id);

	int duplicateIdCheck(SqlSessionTemplate sqlSession, String member_id);

	int duplicateEmailCheck(SqlSessionTemplate sqlSession, String member_email);

	int insertMember(SqlSessionTemplate sqlSession, Member m);

	int duplicateMemberEmailCheck(SqlSessionTemplate sqlSession, String member_email);

	int insertStore(SqlSessionTemplate sqlSession, Store s);

}
