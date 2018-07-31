package com.kh.spring.nail.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.nail.controller.NailController;
import com.kh.spring.nail.model.dao.NailDao;
import com.kh.spring.nail.model.vo.Nail;

@Service
public class NailServiceImpl implements NailService{
	
	private Logger logger=LoggerFactory.getLogger(NailController.class);
	

	@Autowired
	private NailDao dao;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	

	@Override
	public List<Nail> nailList() {
		List<Nail> list=dao.nailList(sqlSession);
		return list;
	}



	@Override
	public List<Nail> selectNailColor(String nailColor) {
		List<Nail> list=dao.selectNailColor(sqlSession,nailColor);
		return list;
	}



	
}
