package com.kh.spring.member.model.service;

import com.kh.spring.member.model.vo.Member;

public interface MemberService {
	
	Member loginCheck(String member_id);
	
	/*int insertMember(Member m);
	
	int updateMember(Member m);
	
	int duplicateIdCheck(String userId);*/

}
