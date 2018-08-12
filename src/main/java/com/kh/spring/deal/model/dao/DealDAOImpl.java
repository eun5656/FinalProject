package com.kh.spring.deal.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.deal.model.vo.Deal;
import com.kh.spring.deal.model.vo.DealImage;


@Repository
public class DealDAOImpl implements DealDAO{

	@Override
	public int insertDeal(SqlSessionTemplate sqlSession,Deal deal) {
		
		return sqlSession.insert("deal.insertDeal", deal);
	}

	@Override
	public List<Deal> selectDealList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("deal.selectDealList",null,rb);
		
	}

	@Override
	public int selectCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("deal.selectCount");
	}

	@Override
	public int insertDealImage(SqlSessionTemplate sqlSession, DealImage dealImage) {
				return sqlSession.insert("deal.insertDealImage", dealImage);
	}

	@Override
	public Deal selectOne(SqlSessionTemplate sqlSession, int dealPk) {
		
		return sqlSession.selectOne("deal.selectOne", dealPk);
	}

	@Override
	public List<DealImage> dealImageList(SqlSessionTemplate sqlSession, int dealPk) {
		
		return sqlSession.selectList("deal.dealImageList", dealPk);
	}

	@Override
	public int deleteImg(SqlSessionTemplate sqlSession, int dealPk) {
		
		return sqlSession.delete("deal.deleteImg", dealPk);
	}

	@Override
	public int deleteDeal(SqlSessionTemplate sqlSession, int dealPk) {
		
		return sqlSession.delete("deal.deleteDeal",dealPk);
	}

	@Override
	public List<DealImage> selectDealImageList(SqlSessionTemplate sqlSession, int dealPk) {
		
		return sqlSession.selectList("deal.selectDealImageList", dealPk);
	}

	@Override
	public int updateDeal(SqlSessionTemplate sqlSession, Deal deal) {
		
		return sqlSession.update("deal.updateDeal", deal);
	}

	
	@Override
	public List<Deal> searchList(SqlSessionTemplate sqlSession, Map<String, String> search, int cPage, int numPerPage) {
		
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
	
		return sqlSession.selectList("deal.searchList",search,rb);
	}

	@Override
	public int searchSelectCount(SqlSessionTemplate sqlSession, Map<String, String> search) {

		return sqlSession.selectOne("deal.searchSelectCount", search);
	}


	

}
