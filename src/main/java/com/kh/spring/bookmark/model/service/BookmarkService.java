package com.kh.spring.bookmark.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.bookmark.model.vo.Bookmark;

public interface BookmarkService {



	int insertBookmark(Bookmark bookmark);

	int deleteBookmark(Map map);

	List<Bookmark> selectBookMarkList(int memberPk);



}
