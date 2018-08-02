package com.kh.spring.bookmark.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BookmarkDaoImpl implements BookmarkDao{

	

	@Override
	public int insertBookmark(Map map, SqlSessionTemplate sqlSession) {
		int result=sqlSession.insert("bookmark.insertBookmark",map);
		return result;
	}

	@Override
	public int deleteBookmark(Map map, SqlSessionTemplate sqlSession) {
		int result=sqlSession.insert("bookmark.deleteBookmark",map);
		return result;
	}

	


	

}
