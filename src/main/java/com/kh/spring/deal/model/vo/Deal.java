package com.kh.spring.deal.model.vo;

public class Deal {
	private int dealPk;
	private String dealTitle;
	private String dealContent;
	private String dealWriter;
	private String dealDate;
	private int dealHits;
	private int memberPk;
	
	
	public Deal() {}


	public Deal(int dealPk, String dealTitle, String dealContent, String dealWriter, String dealDate, int dealHits,
			int memberPk) {
		super();
		this.dealPk = dealPk;
		this.dealTitle = dealTitle;
		this.dealContent = dealContent;
		this.dealWriter = dealWriter;
		this.dealDate = dealDate;
		this.dealHits = dealHits;
		this.memberPk = memberPk;
	}


	@Override
	public String toString() {
		return "Deal [dealPk=" + dealPk + ", dealTitle=" + dealTitle + ", dealContent=" + dealContent + ", dealWriter="
				+ dealWriter + ", dealDate=" + dealDate + ", dealHits=" + dealHits + ", memberPk=" + memberPk + "]";
	}


	public int getDealPk() {
		return dealPk;
	}


	public void setDealPk(int dealPk) {
		this.dealPk = dealPk;
	}


	public String getDealTitle() {
		return dealTitle;
	}


	public void setDealTitle(String dealTitle) {
		this.dealTitle = dealTitle;
	}


	public String getDealContent() {
		return dealContent;
	}


	public void setDealContent(String dealContent) {
		this.dealContent = dealContent;
	}


	public String getDealWriter() {
		return dealWriter;
	}


	public void setDealWriter(String dealWriter) {
		this.dealWriter = dealWriter;
	}


	public String getDealDate() {
		return dealDate;
	}


	public void setDealDate(String dealDate) {
		this.dealDate = dealDate;
	}


	public int getDealHits() {
		return dealHits;
	}


	public void setDealHits(int dealHits) {
		this.dealHits = dealHits;
	}


	public int getMemberPk() {
		return memberPk;
	}


	public void setMemberPk(int memberPk) {
		this.memberPk = memberPk;
	}
	
	
	
	
	
	
}
