package com.kh.spring.customer.model.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import com.kh.spring.customer.model.vo.FAQ;
import com.kh.spring.customer.model.vo.Notice;

public interface CustomerDAO {
	
	List<FAQ> selectFaqList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);
	
	int faqSelectCount(SqlSessionTemplate sqlSession);
	
	List<Notice> selectNoticeList(SqlSessionTemplate sqlSession,int cPage, int numPerPage);
	
	int noticeSelectCount(SqlSessionTemplate sqlSession);
	
	int insertFaq(SqlSessionTemplate sqlSession,FAQ faq);
	
	int insertNotice(SqlSessionTemplate sqlSession,Notice notice);
	
	int deleteFaq(SqlSessionTemplate sqlSession,int faqPk);
	
	int deleteNotice(SqlSessionTemplate sqlSession,int noticePk);
	
	int updateNotice(SqlSessionTemplate sqlSession,Notice notice);
	
	int updateFaq(SqlSessionTemplate sqlSession,FAQ faq);
	
	FAQ selectFAQOne(SqlSessionTemplate sqlSession,int faqPk);
	
	Notice selectNoticeOne(SqlSessionTemplate sqlSession,int noticePk);
}
