package com.kh.spring.bookmark.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.bookmark.model.dao.BookmarkDao;

@Service
public class BookmarkServiceImpl implements BookmarkService {
	@Autowired
	private BookmarkDao dao;

	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	@Override
	public int insertBookmark(String nail_pk, String member_pk, String bookmark_check, String store_pk) {
		int result=dao.insertBookmark(nail_pk,member_pk,bookmark_check,store_pk,sqlSession);
		return result;
	}

}
