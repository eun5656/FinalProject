package com.kh.spring.bookmark.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.bookmark.model.vo.Bookmark;

public interface BookmarkDao {


	int insertBookmark(Bookmark bookmark, SqlSessionTemplate sqlSession);

	int deleteBookmark(Map map, SqlSessionTemplate sqlSession);

	List<Bookmark> selectBookMarkList(int memberPk, SqlSessionTemplate sqlSession);


}
