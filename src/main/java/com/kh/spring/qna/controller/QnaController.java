package com.kh.spring.qna.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.qna.model.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@RequestMapping("/qna/storeQna.do")
	public ModelAndView storeQna(String qna_writer, int store_pk, int member_pk, String qna_title, String qna_content)
	{
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map=new HashMap();
		
		map.put("qna_writer", qna_writer);
		map.put("store_pk", store_pk);
		map.put("member_pk", member_pk);
		map.put("qna_title", qna_title);
		map.put("qna_content", qna_content);
		
		int result=qnaService.insertQna(map);
		
		String msg="";
        String loc="";
        if(result>0) {
           msg="문의 성공";
        }else {
           msg="문의 실패";
        }
        
        mv.addObject("msg",msg);
        mv.addObject("loc", "/");
        mv.setViewName("common/msg");
	
		return mv; 
	}

}
