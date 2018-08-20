package com.kh.spring.bookmark.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.bookmark.model.vo.Bookmark;

@Repository
public class BookmarkDaoImpl implements BookmarkDao{

   

   @Override
   public int insertBookmark(Bookmark bookmark, SqlSessionTemplate sqlSession) {
      int result=sqlSession.insert("bookmark.insertBookmark",bookmark);
      return result;
   }

<<<<<<< HEAD
   @Override
   public int deleteBookmark(Map map, SqlSessionTemplate sqlSession) {
      int result=sqlSession.insert("bookmark.deleteBookmark",map);
      return result;
   }
=======
	@Override
	public int insertBookmark(Bookmark bookmark, SqlSessionTemplate sqlSession) {
		int result=sqlSession.insert("bookmark.insertBookmark",bookmark);
		return result;
	}
>>>>>>> 7d369371dcd8e3285d706615c4b1758e91f9860b

   @Override
   public List<Bookmark> selectBookMarkList(int memberPk, SqlSessionTemplate sqlSession) {
      // TODO Auto-generated method stub
      return sqlSession.selectList("bookmark.selectBookMarkList", memberPk);
   }

<<<<<<< HEAD
   
=======
	@Override
	public List<Bookmark> selectBookMarkList(int memberPk, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bookmark.selectBookMarkList", memberPk);
	}

	
>>>>>>> 7d369371dcd8e3285d706615c4b1758e91f9860b


   

}