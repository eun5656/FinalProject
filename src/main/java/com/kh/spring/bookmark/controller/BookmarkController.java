package com.kh.spring.bookmark.controller;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.spring.bookmark.model.service.BookmarkService;
import com.kh.spring.bookmark.model.vo.Bookmark;
import com.kh.spring.nail.controller.NailController;
import com.kh.spring.nail.model.service.NailService;

import net.sf.json.JSONObject;

@Controller
public class BookmarkController {
	private Logger logger = LoggerFactory.getLogger(NailController.class);

	@Autowired
	private BookmarkService service;

	@RequestMapping(value = "/bookmark/insertBookmark.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String insertBookmark(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws JsonProcessingException {
		
		System.out.println("접근완료");
		String jsonStr = request.getParameter("bookmark_val");
		JSONObject jsonObject = JSONObject.fromObject(jsonStr);
		int nail_pk = Integer.parseInt(jsonObject.getString("nail_pk"));
		int member_pk = Integer.parseInt(jsonObject.getString("member_pk"));
		int store_pk = Integer.parseInt(jsonObject.getString("store_pk"));
		String bookmark_check = String.valueOf(jsonObject.get("bookmark_check"));

		Bookmark bookmark = new Bookmark();
		bookmark.setNail_pk(nail_pk);
		bookmark.setMember_pk(member_pk);
		bookmark.setBookmark_check(bookmark_check);
		bookmark.setStore_pk(store_pk);
		System.out.println(bookmark);

		int result = service.insertBookmark(bookmark);
		if (result > 0) {
			result = bookmark.getBookmark_pk();
		} else {
			result = 0;
		}
		System.out.println("결과 확인 " + result);

		List<Bookmark> bookmarks = service.selectBookMarkList(member_pk);
		System.out.println("bookmarks" + bookmarks);
		session.setAttribute("bookmarkList", bookmarks);
		ObjectMapper mapper = new ObjectMapper();
		String jsonstr = "";
		jsonstr = mapper.writeValueAsString(result);

		return jsonstr;
	}

	@RequestMapping(value = "/bookmark/deleteBookmark.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String deleteBookmark(String bookmark_pk, String member_pk, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws JsonProcessingException {

		System.out.println(bookmark_pk);
		System.out.println(member_pk);

		Map map = new HashMap();

		map.put("member_pk", member_pk);
		map.put("bookmark_pk", bookmark_pk);

		System.out.println(map);

		int result = service.deleteBookmark(map);
		String msg;
		if (result > 0) {
			msg = "북마크 삭제완료";
		} else {
			msg = "북마크 삭제실패";

		}
		List<Bookmark> bookmarks = service.selectBookMarkList(Integer.parseInt(member_pk));
		session.setAttribute("bookmarkList", bookmarks);

		ObjectMapper mapper = new ObjectMapper();
		String jsonstr = "";
		jsonstr = mapper.writeValueAsString(msg);

		return jsonstr;
	}

}
