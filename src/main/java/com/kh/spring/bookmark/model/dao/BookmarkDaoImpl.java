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

   @Override
   public int deleteBookmark(Map map, SqlSessionTemplate sqlSession) {
      int result=sqlSession.insert("bookmark.deleteBookmark",map);
      return result;
   }

   @Override
   public List<Bookmark> selectBookMarkList(int memberPk, SqlSessionTemplate sqlSession) {
      // TODO Auto-generated method stub
      return sqlSession.selectList("bookmark.selectBookMarkList", memberPk);
   }

   


   

}