package com.kh.spring.deal.model.service;

import java.util.List;

import com.kh.spring.deal.model.vo.Deal;
import com.kh.spring.deal.model.vo.DealImage;

public interface DealService {
	int insertDeal(String subject, String content,String dealWriter,List<String> imageList);
    List<Deal> selectDealList(int cPage, int numPerPage);
    int selectCount();
    Deal selectOne(int dealPk);
    List<DealImage> dealImageList(int dealPk);
    int deleteImg(int dealPk);
    int deleteDeal(int dealPk);
}
