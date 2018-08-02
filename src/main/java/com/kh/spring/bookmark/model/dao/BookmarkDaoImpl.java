package com.kh.spring.bookmark.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BookmarkDaoImpl implements BookmarkDao{

	@Override
	public int insertBookmark(String nail_pk, String member_pk, String bookmark_check, String store_pk,
			SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
