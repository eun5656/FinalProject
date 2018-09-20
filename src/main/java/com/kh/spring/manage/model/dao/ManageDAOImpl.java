package com.kh.spring.manage.model.dao;

import java.util.List;
import org.apache.ibatis.session.RowBounds;
import org.aspectj.lang.annotation.DeclareAnnotation;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.spring.reserve.model.vo.Payment;
import com.kh.spring.store.model.vo.Store;

@Repository
public class ManageDAOImpl implements ManageDAO {

	@Override
	public List<Store> storeList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) {
		RowBounds rb = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return sqlSession.selectList("store.manageStoreList", null, rb);
	}

	@Override
	public int selectCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("store.manageSelectCount");
	}

	@Override
	public Store selectManage(SqlSessionTemplate sqlSession, int store_pk) {
		return sqlSession.selectOne("store.selectManage", store_pk);
	}

	@Override
	public List<Payment> paymentList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) {
		RowBounds rb = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return sqlSession.selectList("storeReserve.paymentList", null, rb);
	}

	@Override
	public int paymentCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("storeReserve.paymentCount");
	}

	@Override
	public int paymentUpdateCheck(SqlSessionTemplate sqlSession, int payment_pk) {
		return sqlSession.update("storeReserve.paymentUpdateCheck", payment_pk);
	}

	@Override
	public int reserveDelete(SqlSessionTemplate sqlSession, int reserve_pk) {
		return sqlSession.delete("storeReserve.reserveDelete", reserve_pk);
	}

}