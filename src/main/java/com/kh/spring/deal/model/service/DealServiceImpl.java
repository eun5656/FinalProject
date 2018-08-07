package com.kh.spring.deal.model.service;

import java.util.List;

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
			System.out.println("확인요 : "+deal.getDealPk());
			if(imageList!=null) {
				for(String a: imageList) {
					DealImage dealImage=new DealImage();
					dealImage.setDealPk(deal.getDealPk());
					dealImage.setDealOriImg(a);
					dealImage.setDealReImg(a);
					result=dealDAO.insertDealImage(sqlSession,dealImage);
					System.out.println("이미지 파일 저장 완료 :"+result);
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

}
