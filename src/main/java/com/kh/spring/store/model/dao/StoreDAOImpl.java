package com.kh.spring.store.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.store.model.vo.Menu;
import com.kh.spring.store.model.vo.Store;
/*import com.kh.spring.storeReview.model.vo.StoreReview;*/

@Repository
public class StoreDAOImpl implements StoreDAO {

	@Override
	public Store selectOne(SqlSessionTemplate sqlSession, int store_pk) {
			
		return sqlSession.selectOne("store.selectOne",store_pk);
	}

	@Override
	public List<Menu> selectMenus(SqlSessionTemplate sqlSession, int store_pk) {
		
		return sqlSession.selectList("store.selectMenus",store_pk);
	}

	@Override
	public int deleteMenu(SqlSessionTemplate sqlSession, String menu_pk) {
	
		return sqlSession.delete("store.deleteMenu",menu_pk);
	}
	@Override
	public List<Store> mainStoreList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("store.mainStoreList");
	}

	@Override
	public int menuInsert(SqlSessionTemplate sqlSession, Menu menu) {
		return sqlSession.insert("store.menuInsert", menu);
	}

	@Override
	public int menuUpdate(SqlSessionTemplate sqlSession, Menu menu) {
		
		return sqlSession.update("store.menuUpdate", menu);
	}





}
