package com.kh.spring.member.model.service;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.store.model.vo.Store;

public interface MemberService {
	
	Member loginCheck(String member_id);

	int duplicateIdCheck(String member_id);

	int duplicateEmailCheck(String member_email);

	int insertMember(Member m);

	int duplicateMemberEmailCheck(String member_email);

	int insertStore(Store s);

	/*int updateMember(Member m);*/

}
