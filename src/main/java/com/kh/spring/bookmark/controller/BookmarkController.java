package com.kh.spring.bookmark.controller;

import static org.hamcrest.CoreMatchers.instanceOf;

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

		Map map=new HashMap();

		map.put("nail_pk", jsonObject.get("nail_pk"));
		map.put("member_pk", jsonObject.get("member_pk"));


		String nail_pk=(String) (jsonObject.get("nail_pk"));
		String member_pk=(String) (jsonObject.get("member_pk"));
		String bookmark_check=(String)(jsonObject.get("bookmark_check"));
		String store_pk=(String)(jsonObject.get("store_pk"));
		//그냥...해봤음....
		
		int result=service.insertBookmark(nail_pk,member_pk,bookmark_check,store_pk);
		
		ObjectMapper mapper=new ObjectMapper();
		String jsonstr="";
		jsonstr=mapper.writeValueAsString("hi");
		
		return jsonstr;
	}
}
