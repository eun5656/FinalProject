package com.kh.spring.deal.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.kh.spring.deal.model.dao.DealDAO;
import com.kh.spring.deal.model.vo.Deal;
import com.kh.spring.deal.model.vo.DealImage;


@Service
public class DealServiceImpl implements DealService{
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	@Autowired
	DealDAO dealDAO;
	
	@Override
	public int insertDeal(String subject, String content, String dealWriter,List<String> imageList) {
		
		int result=0;
		
			Deal deal=new Deal();
			deal.setDealTitle(subject);
			deal.setDealContent(content);
			deal.setDealWriter(dealWriter);
			
			
			result=dealDAO.insertDeal(sqlSession,deal);
			
			if(imageList!=null) {
				for(String a: imageList) {
					DealImage dealImage=new DealImage();
					dealImage.setDealPk(deal.getDealPk());
					dealImage.setDealOriImg(a);
					dealImage.setDealReImg(a);
					result=dealDAO.insertDealImage(sqlSession,dealImage);
					
				}
			}
			
			
	
		
		
		return result;
	}

	@Override
	public List<Deal> selectDealList(int cPage, int numPerPage) {
		
		return dealDAO.selectDealList(sqlSession,cPage,numPerPage);
	}

	@Override
	public int selectCount() {
		return dealDAO.selectCount(sqlSession);
		
	}

	@Override
	public Deal selectOne(int dealPk) {
		
		return dealDAO.selectOne(sqlSession,dealPk);
	}

	@Override
	public List<DealImage> dealImageList(int dealPk) {
		
		return dealDAO.dealImageList(sqlSession, dealPk);
	}

	@Override
	public int deleteImg(int dealPk) {
		
		return dealDAO.deleteImg(sqlSession, dealPk);
	}

	@Override
	public int deleteDeal(int dealPk) {
		
		return dealDAO.deleteDeal(sqlSession, dealPk);
	}

	@Override
	public List<DealImage> selectDealImageList(int dealPk) {
		
		return dealDAO.selectDealImageList(sqlSession, dealPk);
	}

	@Override
	public int updateDeal(int dealPk,String subject, String content, String dealWriter, List<String> imageList) {
		int result=0;
		
		Deal deal=new Deal();
		deal.setDealPk(dealPk);
		deal.setDealTitle(subject);
		deal.setDealContent(content);
	
		result= dealDAO.updateDeal(sqlSession, deal);
		
		
		int result1=dealDAO.deleteImg(sqlSession, dealPk);
		

		if(imageList!=null&&result1>0) {
			for(String a: imageList) {
				DealImage dealImage=new DealImage();
				dealImage.setDealPk(deal.getDealPk());
				dealImage.setDealOriImg(a);
				dealImage.setDealReImg(a);
				result=dealDAO.insertDealImage(sqlSession,dealImage);
				
			}
		}
		return result;
	}

	@Override
	public List<Deal> searchList(int cPage, int numPerPage,Map<String, String> search) {
		
		return dealDAO.searchList(sqlSession, search, cPage, numPerPage);
	}

	@Override
	public int searchSelectCount(Map<String, String> search) {
		
		return dealDAO.searchSelectCount(sqlSession, search);
	}

	

	
	
}
