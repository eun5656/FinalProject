package com.kh.spring.bookmark.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.bookmark.model.dao.BookmarkDao;
import com.kh.spring.bookmark.model.vo.Bookmark;

@Service
public class BookmarkServiceImpl implements BookmarkService {
   @Autowired
   private BookmarkDao dao;

   @Autowired
   SqlSessionTemplate sqlSession;

   @Override
   public int insertBookmark(Bookmark bookmark) {
      int result=dao.insertBookmark(bookmark,sqlSession);
      return result;
   }

   @Override
   public int deleteBookmark(Map map) {
      int result=dao.deleteBookmark(map,sqlSession);
      return result;
   }

   @Override
   public List<Bookmark> selectBookMarkList(int memberPk) {
      List<Bookmark> list=dao.selectBookMarkList(memberPk,sqlSession);
      return list;
   }

   
   
   
}