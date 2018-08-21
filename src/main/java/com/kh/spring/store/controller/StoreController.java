package com.kh.spring.store.controller;

//import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.spring.bookmark.model.service.BookmarkService;
import com.kh.spring.bookmark.model.vo.Bookmark;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.nail.model.service.NailService;
import com.kh.spring.nail.model.vo.Nail;
import com.kh.spring.reserve.model.service.ReserService;
import com.kh.spring.reserve.model.vo.Reserve;
import com.kh.spring.store.model.service.StoreService;
import com.kh.spring.store.model.vo.Menu;
import com.kh.spring.store.model.vo.Store;
import com.kh.spring.store.model.vo.Store_time;
import com.kh.spring.storeReview.model.service.StoreReviewService;
import com.kh.spring.storeReview.model.vo.StoreReview;
@SessionAttributes(value= {"memberLoggedIn"})
@Controller
public class StoreController {

	private Logger logger = Logger.getLogger(StoreController.class);
	
	@Autowired 
	private StoreService service;
	
	@Autowired 
	private BookmarkService bookmarkService;
	
	@Autowired
	private NailService Nailservice;
	
	@Autowired
	private StoreReviewService reviewService;
	
	@Autowired
	private ReserService reserService;
	
	
	@RequestMapping("/store/store.do")
	public String store(
			HttpServletRequest req, Model model, HttpSession session
			) {
		String view="store/store";
		int store_pk = Integer.parseInt((String)req.getParameter("store_pk"));
		logger.debug(store_pk + "끝");
		Store store = service.selectOne(store_pk);
		List<Menu> menus = service.selectMenu(store_pk);
		List<Nail> nails= Nailservice.nailListStore(store_pk);
		List<StoreReview>reviews=reviewService.storeReviewList(store_pk);
		int store_star=service.selectStoreStar(store_pk);			
		Store_time store_time = service.selectTime(store_pk);
		System.out.println("메뉴 값 확인 : "+ menus);
		System.out.println("스토어 값 확인 : "+store);
		System.out.println("Nail 값 확인 : "+nails);
		System.out.println("Nail 값 확인 : "+store_star);
		//System.out.println(reviews.get(1));
		model.addAttribute("store",store);
		model.addAttribute("menus",menus);
		model.addAttribute("nails",nails);
		model.addAttribute("reviews",reviews);
		store_time = store_time.deleteDate(store_time);
		System.out.println(store_time);
		model.addAttribute("store_time",store_time);
		List<Bookmark> bookmarkList = null;
		if(session.getAttribute("memberLoggedIn")!=null) {
			int member_pk = ((Member)session.getAttribute("memberLoggedIn")).getMemberPk();
			if(member_pk>0){
				bookmarkList=bookmarkService.selectBookMarkList(member_pk);
				System.out.println(bookmarkList);
				model.addAttribute("bookmarkList",bookmarkList);
				}
		}
		model.addAttribute("store_star",store_star);
		return view;
	}
	@RequestMapping("/store/storeMap.do")
	public String storeMap(
			HttpServletRequest req, Model model
			) {
		String view="store/storeMap";
		int store_pk = Integer.parseInt((String)req.getParameter("store_pk"));
		Store store = service.selectOne(store_pk);
		System.out.println("스토어 값 확인 : "+store);
		model.addAttribute("store",store);		
		return view;
	}
	@RequestMapping("/store/storeReserve.do")
	public String storeReserve(
			HttpServletRequest req, Model model
			) {
		String view="store/storeReserve";
		int store_pk = Integer.parseInt((String)req.getParameter("store_pk"));
		Store store = service.selectOne(store_pk);
		List<Menu> menuList=service.menuList(store_pk);
		List<Reserve> reserveList=reserService.selectreserveList(store_pk);
		//System.out.println(reserveList.get(0).getMenu_pk());
		System.out.println(reserveList);		
		System.out.println("스토어 값 확인 : "+store);		
		model.addAttribute("store",store);
		model.addAttribute("menuList",menuList);
		model.addAttribute("reserveList",reserveList);
		return view;
	}
	@RequestMapping("/store/storeContact.do")
	public String storeContact(
			HttpServletRequest req, Model model
			) {
		String view="store/storeContact";
		int store_pk = Integer.parseInt((String)req.getParameter("store_pk"));
		Store store = service.selectOne(store_pk);		
		System.out.println("스토어 값 확인 : "+store);		
		model.addAttribute("store",store);		
		return view;
	}
		
}
