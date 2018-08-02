package com.kh.spring.nail.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.spring.nail.controller.NailController;
import com.kh.spring.nail.model.vo.Nail;

@Repository
public class NailDaoImpl implements NailDao {
	
	private Logger logger=LoggerFactory.getLogger(NailController.class);

	@Override
	public List<Nail> nailList(SqlSessionTemplate sqlSession) {
		List<Nail> list=sqlSession.selectList("nail.nailList");	
		return list;
	}


	@Override
	public List<Map<String, Object>> selectNailList(SqlSessionTemplate sqlSession, Map selectMenu) {
		//Map<String, Nail> selectNailMap=sqlSession.selectOne("nail.selectNailMap",selectMenu);
		 List<Map<String, Object>> check=sqlSession.selectList("nail.selectNailMap",selectMenu);
		
	return check;
	}




}
