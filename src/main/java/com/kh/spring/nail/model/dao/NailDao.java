
package com.kh.spring.nail.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.nail.model.vo.Nail;

public interface NailDao {

	List<Nail> nailList(SqlSessionTemplate sqlSession);


	//List<Nail> selectNailColor(SqlSessionTemplate sqlSession, String nailColor);




	List<Map<String, Object>> selectNailList(SqlSessionTemplate sqlSession, Map selectMenu);

}