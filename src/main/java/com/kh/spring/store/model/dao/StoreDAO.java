package com.kh.spring.store.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.store.model.vo.Menu;
import com.kh.spring.store.model.vo.Store;

public interface StoreDAO {

	Store selectOne(SqlSessionTemplate sqlSession, int store_pk);

	List<Menu> selectMenus(SqlSessionTemplate sqlSession, int i);

	int deleteMenu(SqlSessionTemplate sqlSession, String menu_pk);

}
