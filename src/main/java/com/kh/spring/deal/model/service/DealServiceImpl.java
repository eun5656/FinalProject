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
	public int insertDeal(String subject, String content, String deal_writer,List<String> imageList,int member_pk) {
		
		int result=0;
		
			Deal deal=new Deal();
			deal.setDeal_title(subject);
			deal.setDeal_content(content);
			deal.setDeal_writer(deal_writer);
			deal.setMember_pk(member_pk);
			
			result=dealDAO.insertDeal(sqlSession,deal);
			
			if(imageList!=null) {
				for(String a: imageList) {
					DealImage dealImage=new DealImage();
					dealImage.setDeal_pk(deal.getDeal_pk());
					dealImage.setDeal_ori_img(a);
					dealImage.setDeal_re_img(a);
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
	public Deal selectOne(int deal_pk) {
		
		return dealDAO.selectOne(sqlSession,deal_pk);
	}

	@Override
	public List<DealImage> dealImageList(int deal_pk) {
		
		return dealDAO.dealImageList(sqlSession, deal_pk);
	}

	@Override
	public int deleteImg(int deal_pk) {
		
		return dealDAO.deleteImg(sqlSession, deal_pk);
	}

	@Override
	public int deleteDeal(int deal_pk) {
		
		return dealDAO.deleteDeal(sqlSession, deal_pk);
	}

	@Override
	public List<DealImage> selectDealImageList(int deal_pk) {
		
		return dealDAO.selectDealImageList(sqlSession, deal_pk);
	}

	@Override
	public int updateDeal(int deal_pk,String subject, String content, String deal_writer, List<String> imageList) {
		int result=0;
		
		Deal deal=new Deal();
		deal.setDeal_pk(deal_pk);
		deal.setDeal_title(subject);
		deal.setDeal_content(content);
	
		result= dealDAO.updateDeal(sqlSession, deal);
		
		//�씠�쟾 �씠誘몄� �떎吏��슦湲�
		int result1=dealDAO.deleteImg(sqlSession, deal_pk);
		

		if(imageList!=null&&result1>0) {
			for(String a: imageList) {
				DealImage dealImage=new DealImage();
				dealImage.setDeal_pk(deal.getDeal_pk());
				dealImage.setDeal_ori_img(a);
				dealImage.setDeal_re_img(a);
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
