package com.kh.spring.bookmark.model.service;

import java.util.Map;

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
	public int insertBookmark(Map map) {
		int result=dao.insertBookmark(map,sqlSession);
		return result;
	}
	
	
	
}
