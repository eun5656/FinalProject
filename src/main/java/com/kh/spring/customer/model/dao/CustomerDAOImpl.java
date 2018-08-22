package com.kh.spring.customer.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.customer.model.vo.FAQ;
import com.kh.spring.customer.model.vo.Notice;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Override
	public List<FAQ> selectFaqList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("customer.selectFaqList",null,rb);
		
	}

	@Override
	public int faqSelectCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("customer.faqSelectCount");
	}

	@Override
	public List<Notice> selectNoticeList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("customer.selectNoticeList",null,rb);
	}

	@Override
	public int noticeSelectCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("customer.noticeSelectCount");
	}

	@Override
	public int insertFaq(SqlSessionTemplate sqlSession, FAQ faq) {
		
		return sqlSession.insert("customer.insertFaq", faq);
	}

	@Override
	public int insertNotice(SqlSessionTemplate sqlSession, Notice notice) {
		
		return sqlSession.insert("customer.insertNotice", notice);
	}

	@Override
	public int deleteFaq(SqlSessionTemplate sqlSession, int faqPk) {
		
		return sqlSession.delete("customer.deleteFaq", faqPk);
	}

	@Override
	public int deleteNotice(SqlSessionTemplate sqlSession, int noticePk) {
		
		return sqlSession.delete("customer.deleteNotice", noticePk);
	}

	@Override
	public int updateNotice(SqlSessionTemplate sqlSession, Notice notice) {
		return sqlSession.update("customer.updateNotice", notice);
	}

	@Override
	public int updateFaq(SqlSessionTemplate sqlSession, FAQ faq) {
		return sqlSession.update("customer.updateFaq", faq);
	}

	@Override
	public FAQ selectFAQOne(SqlSessionTemplate sqlSession, int faqPk) {
		
		return sqlSession.selectOne("customer.selectFAQOne", faqPk);
	}

	@Override
	public Notice selectNoticeOne(SqlSessionTemplate sqlSession, int noticePk) {
		
		return sqlSession.selectOne("customer.selectNoticeOne", noticePk);
	}

}
