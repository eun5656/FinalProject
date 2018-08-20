package com.kh.spring.deal.model.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.deal.model.vo.Deal;
import com.kh.spring.deal.model.vo.DealImage;


public interface DealDAO {
	int insertDeal(SqlSessionTemplate sqlSession,Deal deal);
	List<Deal> selectDealList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);
	int selectCount(SqlSessionTemplate sqlSession);
	int insertDealImage(SqlSessionTemplate sqlSession, DealImage dealImage);
	Deal selectOne(SqlSessionTemplate sqlSession, int deal_pk);
	List<DealImage> dealImageList(SqlSessionTemplate sqlSession, int deal_pk);
	int deleteImg(SqlSessionTemplate sqlSession, int deal_pk);
	int deleteDeal(SqlSessionTemplate sqlSession, int deal_pk);
	List<DealImage> selectDealImageList(SqlSessionTemplate sqlSession, int deal_pk);
	int updateDeal(SqlSessionTemplate sqlSession,Deal deal);
	List<Deal> searchList(SqlSessionTemplate sqlSession,Map<String, String> search, int cPage, int numPerPage);
	int searchSelectCount(SqlSessionTemplate sqlSession,Map<String, String> search);
	
	
}
