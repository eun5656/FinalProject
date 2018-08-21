package com.kh.spring.store.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.store.model.vo.Menu;
import com.kh.spring.store.model.vo.Store;
import com.kh.spring.store.model.vo.Store_time;
import com.kh.spring.storeReview.model.vo.StoreReview;

public interface StoreDAO {

	Store selectOne(SqlSessionTemplate sqlSession, int store_pk);

	List<Menu> selectMenus(SqlSessionTemplate sqlSession, int i);

	int deleteMenu(SqlSessionTemplate sqlSession, String menu_pk);
	List<Store> mainStoreList(SqlSessionTemplate sqlSession);

	int menuInsert(SqlSessionTemplate sqlSession, Menu menu);

	int menuUpdate(SqlSessionTemplate sqlSession, Menu menu);

	int updateStore(SqlSessionTemplate sqlSession, Store store);

	int updateStore_time(SqlSessionTemplate sqlSession, Store_time store_time);

	Store_time selectTime(SqlSessionTemplate sqlSession, int store_pk);
	List<Menu> menuList(SqlSessionTemplate sqlSession, int store_pk);

	int storeStarUpdate(SqlSessionTemplate sqlSession, Map updateStar);

	int selectStoreStar(SqlSessionTemplate sqlSession, int store_pk);

	List<Store> storeReviewCount(SqlSessionTemplate sqlSession);







}
