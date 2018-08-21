package com.kh.spring.store.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.reserve.model.vo.Reserve;
import com.kh.spring.store.model.vo.Menu;
import com.kh.spring.store.model.vo.Store;
/*import com.kh.spring.storeReview.model.vo.StoreReview;*/
import com.kh.spring.store.model.vo.Store_time;

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

	@Override

	public int updateStore(SqlSessionTemplate sqlSession, Store store) {
		// TODO Auto-generated method stub
		return sqlSession.update("store.storeUpdate", store);
	}

	@Override
	public int updateStore_time(SqlSessionTemplate sqlSession, Store_time store_time) {
		// TODO Auto-generated method stub
		return sqlSession.update("store.store_timeUpdate", store_time);
	}

	@Override
	public Store_time selectTime(SqlSessionTemplate sqlSession, int store_pk) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("store.store_timeSelect", store_pk);
	}

	public List<Menu> menuList(SqlSessionTemplate sqlSession, int store_pk) {
		return sqlSession.selectList("store.selectMenus", store_pk);
	}

	@Override
	public int storeStarUpdate(SqlSessionTemplate sqlSession, Map updateStar) {
		// TODO Auto-generated method stub
		return sqlSession.update("store.storeStarUpdate", updateStar);
	}

	@Override
	public int selectStoreStar(SqlSessionTemplate sqlSession, int store_pk) {
		Integer result=sqlSession.selectOne("store.selectStoreStar", store_pk);
		if(result==null){
			result=0;
		}
		return result;
	}

	@Override
	public List<Store> storeReviewCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("store.storeReviewCount");
	}

	@Override
	public List<Reserve> manageReserveList(SqlSessionTemplate sqlSession, Reserve reserve, int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
	      
		return sqlSession.selectList("storeReserve.manageReserveList", reserve,rb);
		
	}

	@Override
	public int reserveCount(SqlSessionTemplate sqlSession, int store_pk) {
		
		return sqlSession.selectOne("storeReserve.reserveCount1", store_pk);
	}


	



}
