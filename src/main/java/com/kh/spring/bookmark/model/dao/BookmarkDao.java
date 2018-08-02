package com.kh.spring.bookmark.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

public interface BookmarkDao {

	int insertBookmark(String nail_pk, String member_pk, String bookmark_check, String store_pk, SqlSessionTemplate sqlSession);

}
