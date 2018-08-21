package com.kh.spring.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.bookmark.model.vo.Bookmark;
import com.kh.spring.common.page.PageCreate;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.mypage.model.service.MypageService;
import com.kh.spring.qna.model.vo.Qna;
import com.kh.spring.reserve.model.vo.Reserve;

@SessionAttributes(value={"memberLoggedIn"})
@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@RequestMapping("/mypage/mypage.do")
	public ModelAndView mypage1(int memberPk,@RequestParam(value="cPage",required=false,defaultValue="1") int cPage,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int numPerPage=10;
		List<Reserve> list = mypageService.mypageReserveList(memberPk,cPage,numPerPage);
		
		int totalCount=mypageService.reserveCount(memberPk);
		
		String pageBar=new PageCreate().getPageBar(cPage,numPerPage,totalCount,"mypage.do?memberPk="+((Member)session.getAttribute("memberLoggedIn")).getMemberPk());
		
		mv.addObject("pageBar", pageBar);
		mv.addObject("list", list);
		mv.addObject("cPage", cPage);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("mypage/mypageReserve");
		
		return mv;
	}
	
	@RequestMapping("/mypage/mypageBookmark.do")
	public ModelAndView mypage2(int member_pk/*@RequestParam(value="cPage",required=false,defaultValue="1") int cPage,HttpSession session*/) {
		ModelAndView mv = new ModelAndView();
		//int numPerPage=4;
		List<Bookmark> list = mypageService.mypageBookmarkList(member_pk/*,cPage,numPerPage*/);
		//int totalCount=mypageService.bookmarkCount(member_pk);
		
		//String pageBar=new PageCreate().getPageBar(cPage,numPerPage,totalCount,"mypage.do?memberPk="+((Member)session.getAttribute("memberLoggedIn")).getMemberPk());
		
		//mv.addObject("pageBar", pageBar);
		mv.addObject("list", list);
		//mv.addObject("cPage", cPage);
		//mv.addObject("totalCount", totalCount);
		mv.setViewName("mypage/mypageBookmark");
	
		return mv;
	}

	@RequestMapping("/mypage/mypageQNAList.do")
	public ModelAndView mypage3(int member_pk,@RequestParam(value="cPage",required=false,defaultValue="1") int cPage,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
	
		int numPerPage=10;
		
		List<Qna> qnaList = mypageService.selectList(member_pk,cPage,numPerPage);
		
		int totalCount=mypageService.selectCount(member_pk);
		
		String pageBar=new PageCreate().getPageBar(cPage,numPerPage,totalCount,"mypageQNAList.do?member_pk="+((Member)session.getAttribute("memberLoggedIn")).getMemberPk());
	      
		mv.addObject("pageBar", pageBar);
		mv.addObject("qnaList", qnaList);
		mv.addObject("cPage", cPage);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("mypage/mypageQNAList");
		
		return mv;
	}
	
	@RequestMapping("/mypage/mypageQNAListContent.do")
	public String mypageQNAListContent(String qna_pk,Model model) {
		
		
		model.addAttribute("qna", mypageService.selectOne(Integer.parseInt(qna_pk)));
		
		
		return "mypage/mypageQNAListContent";
	}
	
	@RequestMapping("/mypage/mypageMessage.do")
	public String mypage4() {
		return "mypage/mypageMessage";
	}
	
	@RequestMapping("/mypage/mypageChange.do")
	public String mypage5() {
		return "mypage/mypageChange";
	}
	
	@RequestMapping("/mypage/mypageDelete.do")
	public String mypage6() {
		return "mypage/mypageDelete";
	}

}