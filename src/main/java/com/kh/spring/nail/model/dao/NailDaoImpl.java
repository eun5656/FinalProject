
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
		 List<Map<String, Object>> selectNailMap=sqlSession.selectList("nail.selectNailMap",selectMenu);

		return selectNailMap;
	}

	@Override
	public List<Nail> listNailStore(SqlSessionTemplate sqlSession, int store_pk) {
		
		return sqlSession.selectList("nail.listNailStore", store_pk);
	}

	@Override
	public int insertNail(SqlSessionTemplate sqlSession, Nail nail) {
		// TODO Auto-generated method stub
		return sqlSession.insert("nail.insertNail", nail);
	}

	@Override
	public int updateNail(SqlSessionTemplate sqlSession, Nail nail) {
		// TODO Auto-generated method stub
		return sqlSession.update("nail.updateNail", nail);
	}

	@Override
	public int deleteNail(SqlSessionTemplate sqlSession, String nail_pk) {
		// TODO Auto-generated method stub
		return sqlSession.delete("nail.deleteNail", nail_pk);
	}






}