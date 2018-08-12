package com.kh.spring.customer.model.vo;

import java.util.Date;

public class FAQ {
	
	private int faqPk;
	private String faqTitle;
	private String faqContent;
	private Date faqDate;
	
	public FAQ() {}

	public FAQ(int faqPk, String faqTitle, String faqContent, Date faqDate) {
		super();
		this.faqPk = faqPk;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqDate = faqDate;
	}

	@Override
	public String toString() {
		return "FAQ [faqPk=" + faqPk + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", faqDate=" + faqDate
				+ "]";
	}

	public int getFaqPk() {
		return faqPk;
	}

	public void setFaqPk(int faqPk) {
		this.faqPk = faqPk;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public Date getFaqDate() {
		return faqDate;
	}

	public void setFaqDate(Date faqDate) {
		this.faqDate = faqDate;
	}
	
	
	
	
	
}
