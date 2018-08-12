package com.kh.spring.customer.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.customer.model.dao.CustomerDAO;
import com.kh.spring.customer.model.vo.FAQ;
import com.kh.spring.customer.model.vo.Notice;

@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	CustomerDAO customerDao;

	@Override
	public List<FAQ> selectFaqList(int cPage, int numPerPage) {
		
		return customerDao.selectFaqList(sqlSession, cPage, numPerPage);
	}

	@Override
	public int faqSelectCount() {
		
		return customerDao.faqSelectCount(sqlSession);
	}

	@Override
	public List<Notice> selectNoticeList(int cPage, int numPerPage) {
		
		return customerDao.selectNoticeList(sqlSession,cPage, numPerPage);
	}

	@Override
	public int noticeSelectCount() {
		
		return customerDao.noticeSelectCount(sqlSession);
	}

	@Override
	public int insertFaq(FAQ faq) {
		
		return customerDao.insertFaq(sqlSession, faq);
	}

	@Override
	public int insertNotice(Notice notice) {
		
		return customerDao.insertNotice(sqlSession, notice);
	}

	@Override
	public int deleteFaq(int faqPk) {
		
		return customerDao.deleteFaq(sqlSession, faqPk);
	}

	@Override
	public int deleteNotice(int noticePk) {
		
		return customerDao.deleteNotice(sqlSession, noticePk);
	}

	@Override
	public int updateNotice(Notice notice) {
		return customerDao.updateNotice(sqlSession, notice);
	}

	@Override
	public int updateFaq(FAQ faq) {
		return customerDao.updateFaq(sqlSession, faq);
	}
	

}
