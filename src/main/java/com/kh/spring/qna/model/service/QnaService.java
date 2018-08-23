package com.kh.spring.qna.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.qna.model.vo.Qna;

public interface QnaService {
	
	int insertQna(Map<String, Object> map);
	
	List<Qna> selectQnaList(int store_pk,int cPage,int numPerPage);
	
	int qnaSelectCount(int store_pk);
	
	int updateQna(Map<String, Object> map);
	
	int delete(Map<String, String> map);
}