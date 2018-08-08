package com.kh.spring.qna.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.nail.controller.NailController;
import com.kh.spring.qna.model.service.QnaService;
import com.kh.spring.qna.model.vo.Qna;

@Controller
public class QnaController {

	private Logger logger=LoggerFactory.getLogger(QnaController.class);
	
	@Autowired
	QnaService service;
	
	@RequestMapping("/insertQna.do")
	public String InsertQna(String qna_title,String qna_content,String store_pk,String member_pk, String qna_writer) {
		//string-> int
		int store_pk2 = Integer.parseInt((String)store_pk);
		int member_pk2 = Integer.parseInt(member_pk);
	
		Qna qna = new Qna(qna_writer,store_pk2, member_pk2, qna_title, qna_content);
		int result = service.InsertQna(qna);
		logger.debug("맵핑완료");
		logger.debug(qna.toString());
		
		
		return "/";
	}
	
	
	
}
