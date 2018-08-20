package com.kh.spring.deal.model.service;


import java.util.List;
import java.util.Map;

import com.kh.spring.deal.model.vo.Deal;
import com.kh.spring.deal.model.vo.DealImage;


public interface DealService {
	int insertDeal(String subject, String content,String deal_writer,List<String> imageList,int member_pk);
    List<Deal> selectDealList(int cPage, int numPerPage);
    int selectCount();
    Deal selectOne(int deal_pk);
    List<DealImage> dealImageList(int deal_pk);
    int deleteImg(int deal_pk);
    int deleteDeal(int deal_pk);
    List<DealImage> selectDealImageList(int deal_pk);
    int updateDeal(int deal_pk,String subject, String content, String deal_writer,List<String> imageList);
    List<Deal> searchList(int cPage, int numPerPage,Map<String, String> search);
    int searchSelectCount(Map<String, String> search);

}
