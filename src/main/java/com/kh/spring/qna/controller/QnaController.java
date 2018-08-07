package com.kh.spring.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.qna.model.service.QnaService;
import com.kh.spring.qna.model.vo.Qna;

@Controller
public class QnaController {

	@Autowired
	QnaService service;
	
	@RequestMapping("/inertQna.do")
	public String InsertQna(String qna_title,String qna_content,int store_pk,int member_pk, String qna_writer) {
		
		Qna qna = new Qna(qna_writer,store_pk, member_pk, qna_title, qna_content);
		int result = service.InsertQna(qna);
		
		
		
		return "/";
	}
	
	
	
}
