package com.kh.spring.member.model.service;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.store.model.vo.Store;

public interface MemberService {
	
	Member loginCheck(String memberId);
	
	int countMessage(String memberId);

	int duplicateIdCheck(String memberId);

	int duplicateEmailCheck(String memberEmail);

	int insertMember(Member m);

	int duplicateMemberEmailCheck(String memberEmail);

	int insertStore(Store s);

	String findId(String memberEmail);

	int checkId(String memberEmail);
	
	int checkPw(String memberEmail);
}