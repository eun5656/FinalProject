package com.kh.spring.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Override
	public Member loginCheck(SqlSessionTemplate sqlSession, String memberId) {
		
		return sqlSession.selectOne("member.selectOne",memberId);
	}

	/*@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("member.insertMember",m);
	}

	@Override
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("member.updateMember",m);
	}
	
	@Override
	public int duplicateIdCheck(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("member.selectCheck",userId);
	}*/

}
