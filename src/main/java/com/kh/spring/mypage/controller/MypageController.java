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

import com.kh.spring.common.page.PageCreate;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.mypage.model.service.MypageService;
import com.kh.spring.qna.model.vo.Qna;
import com.kh.spring.reserve.model.vo.Payment;
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
	public String mypage2() {
		return "mypage/mypageBookmark";
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
	
	@RequestMapping("/mypage/mypagePayment.do")
	public ModelAndView mypagePayment(String reserve_pk) {
		int reserve_pk1=Integer.parseInt(reserve_pk);
		
		Payment payment=mypageService.mypagePayment(reserve_pk1);
		System.out.println(payment);
		ModelAndView mv= new ModelAndView();
		mv.addObject("payment", payment);
		mv.setViewName("/mypage/mypageModal");
		
	
				
		return mv;
	}
	
	@RequestMapping("/mypage/mypagePaymentUpdate.do")
	public String paymentUpdate(String payment_pk,Model model) {
		int payment_pk1=Integer.parseInt(payment_pk);
		
		int result=mypageService.paymentUpdate(payment_pk1);
		String msg="결제 취소가 실패했습니다. 다시 시도해주세요.";
		String loc="/";
		if(result>0) {
			msg="결제 취소를 요청했습니다. 결제취소 승인은 은행에 따라 3영업일 부터 7영업일 까지 걸리실 수 있습니다. ";
			
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "/common/msg";
	}
}