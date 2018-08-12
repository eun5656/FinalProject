package com.kh.spring.customer.model.service;

import java.util.List;

import com.kh.spring.customer.model.vo.FAQ;
import com.kh.spring.customer.model.vo.Notice;

public interface CustomerService {
	List<FAQ> selectFaqList(int cPage, int numPerPage);
	int faqSelectCount();
	List<Notice> selectNoticeList(int cPage, int numPerPage);
	int noticeSelectCount();
	int insertFaq(FAQ faq);
	int insertNotice(Notice notice);
	int deleteFaq(int faqPk);
	int deleteNotice(int noticePk);
	int updateNotice(Notice notice);
	int updateFaq(FAQ faq);
}
