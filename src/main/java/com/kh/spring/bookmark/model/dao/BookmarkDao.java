package com.kh.spring.bookmark.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.bookmark.model.vo.Bookmark;

public interface BookmarkDao {


<<<<<<< HEAD
   int insertBookmark(Bookmark bookmark, SqlSessionTemplate sqlSession);

   int deleteBookmark(Map map, SqlSessionTemplate sqlSession);
=======
	int insertBookmark(Bookmark bookmark, SqlSessionTemplate sqlSession);
>>>>>>> 7d369371dcd8e3285d706615c4b1758e91f9860b

   List<Bookmark> selectBookMarkList(int memberPk, SqlSessionTemplate sqlSession);

	List<Bookmark> selectBookMarkList(int memberPk, SqlSessionTemplate sqlSession);


}