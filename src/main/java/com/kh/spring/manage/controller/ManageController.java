package com.kh.spring.manage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.common.page.PageCreateDeal;
import com.kh.spring.deal.model.vo.Deal;
import com.kh.spring.manage.model.service.ManageService;
import com.kh.spring.nail.model.service.NailService;
import com.kh.spring.nail.model.vo.Nail;
import com.kh.spring.reserve.model.vo.Payment;
import com.kh.spring.store.model.service.StoreService;
import com.kh.spring.store.model.vo.Menu;
import com.kh.spring.store.model.vo.Store;
import com.kh.spring.storeReview.model.service.StoreReviewService;
import com.kh.spring.storeReview.model.vo.StoreReview;

@Controller
public class ManageController {
	
	@Autowired
	ManageService service;
	
	@Autowired
	StoreService storeService;
	
	@Autowired
	NailService nailService;
	
	@Autowired
	StoreReviewService reviewService;
	
	
	@RequestMapping("/manager/manageList.do")
	public  ModelAndView manageList(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage){

		ModelAndView mv=new ModelAndView();
		int numPerPage=10;
				
		List<Store> list=service.storeList(cPage,numPerPage);
		
		int totalCount=service.selectCount();

		
		String pageBar=new PageCreateDeal().getPageBar(cPage,numPerPage,totalCount,"manageList.do");
		
		
		mv.addObject("pageBar", pageBar);
		mv.addObject("list",list);
		mv.addObject("cPage", cPage);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("manager/manageList");
		
		return mv;	
		
	}
	
	@RequestMapping("/manage/storeManager.do")
	public ModelAndView storeManager(int store_pk) {
		ModelAndView mv=new ModelAndView();
		
		Store store=service.selectManage(store_pk);
		List<Nail> nails= nailService.nailListStore(store_pk);
		List<Menu> menus = storeService.selectMenu(store_pk);
		List<StoreReview>reviews=reviewService.storeReviewList(store_pk);
		
	
		mv.addObject("store",store);
		mv.addObject("menus",menus);
		mv.addObject("nails",nails);
		mv.addObject("reviews",reviews);
		mv.setViewName("store/storeManage");
		return mv;
	}
	
	@RequestMapping("/manager/managePayment.do")
	public ModelAndView paymentManager(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage) {
		ModelAndView mv= new ModelAndView();
		int numPerPage=10;
		
		List<Payment> paymentList=service.paymentList(cPage,numPerPage);
		
		int totalCount=service.paymentCount();
		
		String pageBar=new PageCreateDeal().getPageBar(cPage,numPerPage,totalCount,"managePayment.do");
		
		mv.addObject("pageBar", pageBar);
		mv.addObject("list",paymentList);
		mv.addObject("cPage", cPage);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("manager/managePaymentList");
		
		return mv;
	}
	
	@RequestMapping("/manager/managePaymentUpdate.do")
	public ModelAndView paymentUpdate(String payment_pk, String reserve_pk) {
		ModelAndView mv= new ModelAndView();
		
		int payment_pk1=Integer.parseInt(payment_pk);	
		int reserve_pk1=Integer.parseInt(reserve_pk);
		
		int result=service.paymentUpdateCheck(payment_pk1);
		String loc="/manager/managePayment.do";
		String msg="결제 내역 취소 실패";
		
		
		if(result>0) {
			result=service.reserveDelete(reserve_pk1);
			
			msg="예약 내용 삭제 성공";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("/common/msg");
		
		return mv;
	}
	
}
