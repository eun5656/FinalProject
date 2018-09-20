package com.kh.spring.customer.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.kh.spring.common.page.PageCreateDeal;
import com.kh.spring.customer.model.service.CustomerService;
import com.kh.spring.customer.model.vo.FAQ;
import com.kh.spring.customer.model.vo.Notice;
import com.kh.spring.deal.model.vo.Deal;

@Controller
public class CustomerController {

	@Autowired
	private CustomerService service;

	// 공지사항
	@RequestMapping("/customer/notice.do")
	public ModelAndView NoticeList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage) {
		ModelAndView mv = new ModelAndView();
		int numPerPage = 10;

		List<Notice> list = service.selectNoticeList(cPage, numPerPage);

		int totalCount = service.noticeSelectCount();

		String heading = "heading";
		String collapse = "collapse";

		String pageBar = new PageCreateDeal().getPageBar(cPage, numPerPage, totalCount, "notice.do");

		mv.addObject("collapse", collapse);
		mv.addObject("haeding", heading);
		mv.addObject("pageBar", pageBar);
		mv.addObject("list", list);
		mv.addObject("cPage", cPage);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("customer/notice");

		return mv;

	}

	@RequestMapping("/customer/faq.do")
	public ModelAndView Faq(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage) {

		ModelAndView mv = new ModelAndView();
		int numPerPage = 10;

		List<FAQ> list = service.selectFaqList(cPage, numPerPage);

		String heading = "heading";
		String collapse = "collapse";

		int totalCount = service.faqSelectCount();

		String pageBar = new PageCreateDeal().getPageBar(cPage, numPerPage, totalCount, "faq.do");

		mv.addObject("collapse", collapse);
		mv.addObject("haeding", heading);
		mv.addObject("pageBar", pageBar);
		mv.addObject("list", list);
		mv.addObject("cPage", cPage);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("customer/faq");

		return mv;
	}

	@RequestMapping("/customer/faqForm.do")
	public String faqForm() {
		return "customer/faqForm";
	}

	@RequestMapping("/customer/noticeForm.do")
	public String noticeForm() {
		return "customer/noticeForm";
	}

	@RequestMapping("/customer/faqFormEnd.do")
	public ModelAndView faqFormEnd(String faqTitle, String faqContent) {
		ModelAndView mv = new ModelAndView();

		FAQ faq = new FAQ();
		faq.setFaqTitle(faqTitle);
		faq.setFaqContent(faqContent);

		int result = service.insertFaq(faq);

		String msg = "";
		String loc = "";
		if (result > 0) {
			msg = "자주묻는질문 작성 성공";
		} else {
			msg = "자주묻는질문 작성 실패";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", "/customer/faq.do");
		mv.setViewName("common/msg");

		return mv;
	}

	@RequestMapping("/customer/noticeFormEnd.do")
	public ModelAndView noticeFormEnd(String noticeTitle, String noticeContent) {
		ModelAndView mv = new ModelAndView();

		Notice notice = new Notice();
		notice.setNoticeTitle(noticeTitle);
		notice.setNoticeContent(noticeContent);

		int result = service.insertNotice(notice);
		String msg = "";
		String loc = "";
		if (result > 0) {
			msg = "공지사항 작성 성공";
		} else {
			msg = "공지사항 작성 실패";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", "/customer/notice.do");
		mv.setViewName("common/msg");

		return mv;
	}

	@RequestMapping("/customer/noticeDelete.do")
	public ModelAndView deleteNotice(int noticePk) {
		ModelAndView mv = new ModelAndView();

		int result = service.deleteNotice(noticePk);

		String msg = "";
		String loc = "";
		if (result > 0) {
			msg = "공지사항 삭제 성공";
		} else {
			msg = "공지사항 삭제 실패";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", "/customer/notice.do");
		mv.setViewName("common/msg");

		return mv;
	}

	@RequestMapping("/customer/faqDelete.do")
	public ModelAndView deleteFaq(int faqPk) {
		ModelAndView mv = new ModelAndView();

		int result = service.deleteFaq(faqPk);

		String msg = "";
		String loc = "";
		if (result > 0) {
			msg = "자주묻는질문 삭제 성공";
		} else {
			msg = "자주묻는질문 삭제 실패";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", "/customer/faq.do");
		mv.setViewName("common/msg");

		return mv;
	}

	@RequestMapping("/customer/faqUpdate.do")
	public ModelAndView updateFaq(int faqPk) {
		ModelAndView mv = new ModelAndView();
		FAQ faq = service.selectFAQOne(faqPk);
		mv.addObject("faq", faq);
		mv.setViewName("customer/faqUpdate");
		return mv;
	}

	@RequestMapping("/customer/noticeUpdate.do")
	public ModelAndView updateNotice(int noticePk) {

		ModelAndView mv = new ModelAndView();
		Notice notice = service.selectNoticeOne(noticePk);
		mv.addObject("notice", notice);
		mv.setViewName("customer/noticeUpdate");

		return mv;
	}

	@RequestMapping("/customer/faqUpdateEnd.do")
	public ModelAndView updateFaqEnd(int faqPk, String faqTitle, String faqContent) {
		ModelAndView mv = new ModelAndView();
		FAQ faq = new FAQ();
		faq.setFaqTitle(faqTitle);
		faq.setFaqContent(faqContent);
		faq.setFaqPk(faqPk);
		int result = service.updateFaq(faq);

		String msg = "";
		String loc = "";
		if (result > 0) {
			msg = "자주묻는질문 수정 성공";
		} else {
			msg = "자주묻는질문 수정 실패";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", "/customer/faq.do");
		mv.setViewName("common/msg");

		return mv;
	}

	@RequestMapping("/customer/noticeUpdateEnd.do")
	public ModelAndView updateNoticeEnd(int noticePk, String noticeTitle, String noticeContent) {
		ModelAndView mv = new ModelAndView();

		Notice notice = new Notice();
		notice.setNoticeContent(noticeContent);
		notice.setNoticePk(noticePk);
		notice.setNoticeTitle(noticeTitle);

		int result = service.updateNotice(notice);

		String msg = "";
		String loc = "";
		if (result > 0) {
			msg = "공지사항 수정 성공";
		} else {
			msg = "공지사항 수정 실패";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", "/customer/notice.do");
		mv.setViewName("common/msg");

		return mv;
	}

}