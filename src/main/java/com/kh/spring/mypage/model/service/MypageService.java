package com.kh.spring.mypage.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.spring.qna.model.vo.Qna;


public interface MypageService {

	List<Qna> selectList(int member_pk,int cPage, int numPerPage);
	
	int selectCount(int member_pk);
	
	Qna selectOne(int qna_pk);
}
