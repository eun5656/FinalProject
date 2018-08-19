package com.kh.spring.nail.controller;

import java.awt.print.Book;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.spring.bookmark.model.service.BookmarkService;
import com.kh.spring.bookmark.model.vo.Bookmark;
import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.nail.model.service.NailService;
import com.kh.spring.nail.model.vo.Nail;

@Controller
public class NailController {
	private Logger logger=LoggerFactory.getLogger(NailController.class);

	@Autowired
	private NailService service;
	
	@Autowired
	private BookmarkService bookmarkService;
	

	@RequestMapping("/nail/nailList.do")
	public String  nailList(){
		List<Nail> list=service.nailList();
		//logger.debug("list"+list);
		return "/";
	}
	
	@RequestMapping( value="/nail/selectNailColor.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String selectNailList(String nail_color,String nail_check,String nail_style,String memberPk, HttpServletRequest request, HttpServletResponse response)throws JsonProcessingException
	{
		
		logger.info("nail_color"+nail_color);
		logger.info("nail_check"+nail_check);
		logger.info("nail_style"+nail_style);
	
		ObjectMapper mapper=new ObjectMapper();
		String jsonstr="";
		
		
		/*json으로 들어오기 떄문에 null처리해줌*/
		if(nail_color.equals("")) {
			nail_color=null;
		}
		if(nail_style.equals("")) {
			nail_style=null;
		}
		
		if(nail_check.equals("네일")){	
			nail_check="1";
		}
		else if (nail_check.equals("페디")) {
			nail_check="2";

		}
		else {
			nail_check=null;
		}
		
		Map map=new HashMap();
		map.put("nail_color", nail_color);
		map.put("nail_check", nail_check);
		map.put("nail_style", nail_style);
		logger.info("map"+map);
		
		
		/*nailList*/
		List<Map<String, Object>> list=service.selectNailList(map);
		System.out.println(list);
		
		/*화면보이게하는 규격*/
		List<Integer> col_i = new ArrayList<Integer>();
		
		
		
		
		Map selectlist=new HashMap();	
		selectlist.put("list", list);
		
		/*bookmark 쏴주기*/
		System.out.println(memberPk);
		if(memberPk!=null &&memberPk.length()>0){
			int member_pk=Integer.parseInt(memberPk);
			List<Bookmark> bookmarkList;
			bookmarkList=bookmarkService.selectBookMarkList(member_pk);
			selectlist.put("bookmarkList", bookmarkList);
		}
		
		
		int [] col1 = { 4, 2,3, 3,3,4,3,2,2,6,4,5,3,4 };
		int k=0;
		for (int i = 0; i < list.size(); i++) {
			col_i.add(col1[k]);	
			if(i%9==0){
				k=0;
			}
			k++;
		}
		
		
		
	
		
		
		System.out.println("col_i"+col_i);
		selectlist.put("col_i",col_i);
		
		logger.info("selectlist"+selectlist);

		response.setCharacterEncoding("UTF-8"); //한글꺠짐방지
		jsonstr=mapper.writeValueAsString(selectlist);
		return jsonstr;		//String으로 보내고 jsp단에서 dkfa

	}
	
	@RequestMapping( value="/nail/selectNailreset.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String selectNailreset(String reset,String memberPk)throws JsonProcessingException
	{
		Map map=new HashMap();//걍 귀찮아서 map으로함 
		Map selectlist=new HashMap();	
		List<Map<String, Object>> list=service.selectNailList(map);		
		List<Integer> col_i = new ArrayList<Integer>();
		
		ObjectMapper mapper=new ObjectMapper();		
		String jsonstr="";

		

		int [] col1 = { 4,2,3,3,3,4,3,2,2,6,4,5,3,4 };
		int k=0;
		for (int i = 0; i < list.size(); i++) {
			col_i.add(col1[k]);	
			if(i%9==0){
				k=0;
			}
			k++;
		}
		
		if(memberPk!=null &&memberPk.length()>0){
			int member_pk=Integer.parseInt(memberPk);
			List<Bookmark> bookmarkList;
			bookmarkList=bookmarkService.selectBookMarkList(member_pk);
			selectlist.put("bookmarkList", bookmarkList);
		}

		
		
		selectlist.put("list", list);
		selectlist.put("col_i", col_i);
		logger.info("selectlist"+selectlist);

		jsonstr=mapper.writeValueAsString(selectlist);
		return jsonstr;		//String으로 보내고 jsp단에서 dkfa

	}	
}