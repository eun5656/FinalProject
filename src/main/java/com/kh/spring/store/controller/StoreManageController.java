package com.kh.spring.store.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.spring.customer.model.vo.Notice;
import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.nail.model.service.NailService;
import com.kh.spring.nail.model.vo.Nail;
import com.kh.spring.qna.model.vo.Qna;
import com.kh.spring.store.model.service.StoreService;
import com.kh.spring.store.model.vo.Menu;
import com.kh.spring.store.model.vo.Store;
import com.kh.spring.storeReview.model.service.StoreReviewService;
import com.kh.spring.storeReview.model.vo.StoreReview;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;



@SessionAttributes(value= {"memberLoggedIn"})
@Controller
public class StoreManageController {
private Logger logger = Logger.getLogger(StoreController.class);
	
	@Autowired
	private NailService Nailservice;

	@Autowired 
	private StoreService service;
	
	@Autowired
	private StoreReviewService reviewService;
	
	@RequestMapping("/store/storeManage.do")
	public String store(
			HttpServletRequest req, Model model,HttpSession session
			) {
		String view="store/storeManage";
		int member_pk = ((Member)session.getAttribute("memberLoggedIn")).getMemberPk();
	
		Store store = service.selectOne(member_pk);
		
		List<Nail> nails= Nailservice.nailListStore(store.getStore_pk());
		List<Menu> menus = service.selectMenu(store.getStore_pk());
		List<StoreReview>reviews=reviewService.storeReviewList(store.getStore_pk());
		
		System.out.println("메뉴 값 확인 : "+ menus);
		System.out.println("스토어 값 확인 : "+store);
		System.out.println("Nail 값 확인 : "+nails);
		System.out.println(reviews.get(1));
		model.addAttribute("store",store);
		model.addAttribute("menus",menus);
		model.addAttribute("nails",nails);
		model.addAttribute("reviews",reviews);
		return view;
	}
	
	@RequestMapping("/store/storeManageSales.do")
	public String storeManageSale(
			HttpServletRequest req, Model model, HttpSession session
			) {
		String view="store/storeManageSales";	
		int member_pk = ((Member)session.getAttribute("memberLoggedIn")).getMemberPk();
	
		Store store = service.selectOne(member_pk);
		

		System.out.println();
		System.out.println("스토어 값 확인 : "+store);
	
		
		model.addAttribute("store",store);
		return view;
	}
	@RequestMapping("/store/storeManageReserve.do")
	public String storeManageReserve(
			HttpServletRequest req, Model model,HttpSession session
			) {
		String view="store/storeManageReserve";
		int member_pk = ((Member)session.getAttribute("memberLoggedIn")).getMemberPk();
		
		Store store = service.selectOne(member_pk);
		
//		List<Nail> nails= Nailservice.nailListStore(store.getStore_pk());
		List<Menu> menus = service.selectMenu(store.getStore_pk());

		
		
	
		System.out.println("스토어 값 확인 : "+store);
		
		model.addAttribute("store",store);
		
		return view;
	}
	
	
	@RequestMapping("/store/storeManage/menuInsert.do")
	public String menuInsert(Menu menu, HttpServletRequest req,Model model) {
		System.out.println("메뉴 삽입 접근완료" + menu);
		int result = service.insertMenu(menu);
		if(result>0) {
			System.out.println("삽입 완료");
		}else {
			System.out.println("인서트 실패");
		}
		logger.debug(menu);//입력값 확인
		
		Store store = service.selectOne(menu.getStore_pk());
		List<Nail> nails= Nailservice.nailListStore(store.getStore_pk());
		List<Menu> menus = service.selectMenu(store.getStore_pk());
		model.addAttribute("store", store);
		model.addAttribute("menus",menus);
		model.addAttribute("nails",nails);
		return "/store/storeManage";
	}
	
	@RequestMapping("/store/storeManage/menuDelete.do")
	@ResponseBody
	public String menuDelete(HttpServletRequest req,
			@RequestParam String menu_pk
			) throws JsonProcessingException {
		System.out.println("메뉴 삭제 접근완료");
		System.out.println("menu_Pk = " + menu_pk);
		HashMap<String, String> map=new HashMap<String, String>(); 
		map.put("menu_pk", menu_pk);
		ObjectMapper mapper=new ObjectMapper();		
		String jsonstr=mapper.writeValueAsString(map);
		
		int result = service.deleteMenu(menu_pk);
		System.out.println("삭제된 메뉴pk" + menu_pk);
		return jsonstr;
	}

	@RequestMapping(value =  "/store/storeManage/menuUpdate.do",  produces = { "application/text; charset=utf8" })
	@ResponseBody
	public String menuUpdate(HttpServletRequest req,
			Menu menu
			) throws JsonProcessingException {
		System.out.println("메뉴 수정 접근완료");
		System.out.println(menu);
		int result = service.menuUpdate(menu);
		logger.debug("menuUpdate 확인~ : "+result);
		JSONObject json=JSONObject.fromObject(JSONSerializer.toJSON(menu));
		String jsonstr= json.toString();
		logger.debug("jsonstr 확인~ : "+jsonstr);


		return jsonstr;
	}
	
	
}
