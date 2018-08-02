package com.kh.spring.bookmark.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface BookmarkDao {


	int insertBookmark(Map map, SqlSessionTemplate sqlSession);

	int deleteBookmark(Map map, SqlSessionTemplate sqlSession);


}
