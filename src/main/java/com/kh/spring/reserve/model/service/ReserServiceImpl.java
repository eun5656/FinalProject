package com.kh.spring.reserve.model.service;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.reserve.model.dao.ReserDao;
import com.kh.spring.store.controller.StoreController;

@Service
public class ReserServiceImpl {
	private Logger logger = Logger.getLogger(StoreController.class);

	//@Autowired
    //ReserDao reserDao;
	@Autowired
	SqlSessionTemplate sqlSession;
	

}
