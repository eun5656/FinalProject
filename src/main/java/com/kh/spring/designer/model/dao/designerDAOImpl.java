package com.kh.spring.designer.model.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.spring.designer.model.vo.designer;

@Repository
public class designerDAOImpl implements designerDAO {

	@Override
	public List<designer> selectdesigner(SqlSessionTemplate sqlSession, int store_pk) {
		return sqlSession.selectList("designer.selectdesigner", store_pk);
	}

	@Override
	public int designerUpdate(SqlSessionTemplate sqlSession, designer designer) {
		return sqlSession.update("designer.updatedesigner", designer);
	}

	@Override
	public int deletedesigner(SqlSessionTemplate sqlSession, String designer_pk) {
		return sqlSession.delete("designer.deletedesigner", designer_pk);
	}

	@Override
	public int insertdesigner(SqlSessionTemplate sqlSession, designer designer) {
		return sqlSession.insert("designer.insertdesigner", designer);
	}

}