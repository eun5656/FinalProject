package com.kh.spring.nail.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.nail.model.vo.Nail;

public interface NailDao {

	List<Nail> nailList(SqlSessionTemplate sqlSession);

}
