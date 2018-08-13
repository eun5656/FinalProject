package com.kh.spring.bookmark.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.spring.bookmark.model.service.BookmarkService;
import com.kh.spring.nail.controller.NailController;
import com.kh.spring.nail.model.service.NailService;

import net.sf.json.JSONObject;

@Controller
public class BookmarkController {
	private Logger logger=LoggerFactory.getLogger(NailController.class);
	
	@Autowired
	private BookmarkService service;

	
	@RequestMapping(value="/bookmark/insertBookmark.do", produces="application/text; charset=utf-8")
	@ResponseBody
	public String insertBookmark( HttpServletRequest request, HttpServletResponse response)throws JsonProcessingException
	{
		
		String jsonStr = request.getParameter("bookmark_val");
		JSONObject jsonObject = JSONObject.fromObject(jsonStr);
		int nail_pk = Integer.parseInt(jsonObject.getString("nail_pk"));
		int member_pk = Integer.parseInt(jsonObject.getString("member_pk"));
		int store_pk = Integer.parseInt(jsonObject.getString("store_pk"));
		String bookmark_check=String.valueOf(jsonObject.get("bookmark_check"));
		
		
		Map map=new HashMap();

		map.put("nail_pk", nail_pk);
		map.put("member_pk", jsonObject.get("member_pk"));
		map.put("bookmark_check", jsonObject.get("bookmark_check"));
		map.put("store_pk", jsonObject.get("store_pk"));

		//洹몃깷...�빐遊ㅼ쓬....
		
		int result=service.insertBookmark(map);
		String msg;
		if(result>0){
			msg="遺곷쭏�겕 �벑濡앹셿猷�";
		}
		else {
			msg="遺곷쭏�겕 �벑濡앹떎�뙣";

		}
		
		
		ObjectMapper mapper=new ObjectMapper();
		String jsonstr="";
		jsonstr=mapper.writeValueAsString(msg);
		
		return jsonstr;
	}
	
	@RequestMapping(value="/bookmark/deleteBookmark.do", produces="application/text; charset=utf-8")
	@ResponseBody
	public String deleteBookmark(String bookmark_pk,String member_pk, HttpServletRequest request, HttpServletResponse response)throws JsonProcessingException
	{
		
		System.out.println(bookmark_pk);
		System.out.println(member_pk);
		/*String jsonStr ="";
		JSONObject jsonObject = JSONObject.fromObject(jsonStr);*/
		
		
		Map map=new HashMap();

		map.put("member_pk", member_pk);
		map.put("bookmark_pk", bookmark_pk);
		
		System.out.println(map);
		
		int result=service.deleteBookmark(map);
		String msg;
		if(result>0){
			msg="遺곷쭏�겕 �궘�젣�셿猷�";
		}
		else {
			msg="遺곷쭏�겕 �궘�젣�떎�뙣";

		}
		
		ObjectMapper mapper=new ObjectMapper();
		String jsonstr="";
		jsonstr=mapper.writeValueAsString(msg);
		
		return jsonstr;
	}
	
	
	
}
