package com.kh.spring.designer.model.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import com.kh.spring.designer.model.vo.designer;

public interface designerDAO {

	List<designer> selectdesigner(SqlSessionTemplate sqlSession, int store_pk);

	int designerUpdate(SqlSessionTemplate sqlSession, designer designer);

	int deletedesigner(SqlSessionTemplate sqlSession, String designer_pk);

	int insertdesigner(SqlSessionTemplate sqlSession, designer designer);

}
