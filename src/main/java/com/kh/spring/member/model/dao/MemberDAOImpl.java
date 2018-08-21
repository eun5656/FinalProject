package com.kh.spring.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.store.model.vo.Store;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Override
	public Member loginCheck(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("member.selectOne",memberId);
	}
	
	@Override
	public int countMessage(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("message.countMessage");
	}
	
	@Override
	public int duplicateIdCheck(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("member.selectIdCheck",memberId);
	}

	@Override
	public int duplicateEmailCheck(SqlSessionTemplate sqlSession, String memberEmail) {
		return sqlSession.selectOne("member.selectEmailCheck", memberEmail);
	}
	
	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("member.insertMember",m);
	}

	@Override
	public int duplicateMemberEmailCheck(SqlSessionTemplate sqlSession, String memberEmail) {
		return sqlSession.selectOne("member.selectEmailCheck", memberEmail);
	}

	@Override
	public int insertStore(SqlSessionTemplate sqlSession, Store s) {
		return sqlSession.insert("store.insertStore", s);
	}
	
	@Override
	public int checkPw(SqlSessionTemplate sqlSession,String memberEmail) {
		
		return sqlSession.update("member.updatePw", memberEmail);
	}
}
