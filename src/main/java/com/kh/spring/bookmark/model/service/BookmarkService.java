package com.kh.spring.bookmark.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.bookmark.model.vo.Bookmark;

public interface BookmarkService {



<<<<<<< HEAD
   int insertBookmark(Bookmark bookmark);

   int deleteBookmark(Map map);
=======
	int insertBookmark(Bookmark bookmark);
>>>>>>> 7d369371dcd8e3285d706615c4b1758e91f9860b

   List<Bookmark> selectBookMarkList(int memberPk);

	List<Bookmark> selectBookMarkList(int memberPk);



}