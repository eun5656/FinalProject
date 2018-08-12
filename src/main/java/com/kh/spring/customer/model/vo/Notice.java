package com.kh.spring.customer.model.vo;

import java.util.Date;

public class Notice {
	private int noticePk;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	
	public Notice() {}

	public Notice(int noticePk, String noticeTitle, String noticeContent, Date noticeDate) {
		super();
		this.noticePk = noticePk;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
	}

	@Override
	public String toString() {
		return "Notice [noticePk=" + noticePk + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeDate=" + noticeDate + "]";
	}

	public int getNoticePk() {
		return noticePk;
	}

	public void setNoticePk(int noticePk) {
		this.noticePk = noticePk;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	
	
	
}
