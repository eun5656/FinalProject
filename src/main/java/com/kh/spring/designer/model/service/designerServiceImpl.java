package com.kh.spring.designer.model.service;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.spring.designer.model.dao.designerDAO;
import com.kh.spring.designer.model.vo.designer;

@Service
public class designerServiceImpl implements designerService {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Autowired
	designerDAO dao;

	@Override
	public List<designer> selectdesigner(int store_pk) {
		return dao.selectdesigner(sqlSession, store_pk);
	}

	@Override
	public int designerUpdate(designer designer) {
		return dao.designerUpdate(sqlSession, designer);
	}

	@Override
	public int deletedesigner(String designer_pk) {
		return dao.deletedesigner(sqlSession, designer_pk);
	}

	@Override
	public int insertdesigner(designer designer) {
		return dao.insertdesigner(sqlSession, designer);
	}

}