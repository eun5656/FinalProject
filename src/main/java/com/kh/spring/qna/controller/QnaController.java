package com.kh.spring.qna.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.common.page.PageCreateDeal;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.qna.model.service.QnaService;
import com.kh.spring.qna.model.vo.Qna;
import com.kh.spring.store.model.service.StoreService;
import com.kh.spring.store.model.vo.Store;

@SessionAttributes(value= {"memberLoggedIn"})

@Controller
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private StoreService service;
	
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
	
	
	@RequestMapping("/store/storeManageQna.do")
	public ModelAndView storeManageQna(int store_pk,@RequestParam(value="cPage",required=false,defaultValue="1") int cPage,
			HttpSession session) 
	{
		
		ModelAndView mv=new ModelAndView();
		int numPerPage=10;
		List<Qna> list=qnaService.selectQnaList(store_pk,cPage,numPerPage);
		
		int totalCount=qnaService.qnaSelectCount(store_pk);
		
		String heading="heading";
		String collapse="collapse";
		
		int member_pk = ((Member)session.getAttribute("memberLoggedIn")).getMemberPk();
		String pageBar=new PageCreateDeal().getPageBar(cPage,numPerPage,totalCount,"storeManageQna.do");
		Store store = service.selectOne(member_pk);
		System.out.println();
		System.out.println("스토어 값 확인 : "+store);
		mv.addObject("store",store);
		mv.addObject("collapse", collapse);
		mv.addObject("haeding", heading);
		mv.addObject("pageBar", pageBar);
		mv.addObject("list",list);
		mv.addObject("cPage", cPage);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("store/storeManageQna");
		
		return mv;
	}
	
	@RequestMapping("/qna/answer.do")
	public ModelAndView qnaAnswer(String qna_pk, String answer_content)
	{
		
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map=new HashMap();
		
		map.put("qna_pk", Integer.parseInt(qna_pk));
		map.put("answer_content", answer_content);
		
		int result=qnaService.updateQna(map);
		
		String msg="";
        String loc="";
        if(result>0) {
           msg="답변 성공";
        }else {
           msg="답변 실패";
        }
        
        mv.addObject("msg",msg);
        mv.addObject("loc", "/");
        mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/qna/deleteQna.do")
	public ModelAndView sendMessageDelete(int qna_pk, int memberPk,ModelAndView mv,HttpSession session) {
		
		Map map = new HashMap();
		map.put("qna_pk", qna_pk);
		map.put("memberPk", memberPk);
		
		int result = qnaService.delete(map);
		
		System.out.println("reusltrkqtqt"+result);
		mv.addObject("result",result);
		mv.setViewName("jsonView");
	
		return mv;
	}
	
	
}