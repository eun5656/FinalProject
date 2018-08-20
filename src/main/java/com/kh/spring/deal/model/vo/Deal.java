package com.kh.spring.deal.model.vo;

import java.util.Date;

public class Deal {
	private int deal_pk;
	private String deal_title;
	private String deal_content;
	private String deal_writer;
	private Date deal_date;
	private int deal_hits;
	private int member_pk;
	
	
	public Deal() {}


	public Deal(int deal_pk, String deal_title, String deal_content, String deal_writer, Date deal_date,
			int deal_hits, int member_pk) {
		super();
		this.deal_pk = deal_pk;
		this.deal_title = deal_title;
		this.deal_content = deal_content;
		this.deal_writer = deal_writer;
		this.deal_date = deal_date;
		this.deal_hits = deal_hits;
		this.member_pk = member_pk;
	}


	@Override
	public String toString() {
		return "Deal [deal_pk=" + deal_pk + ", deal_title=" + deal_title + ", deal_content=" + deal_content
				+ ", deal_writer=" + deal_writer + ", deal_date=" + deal_date + ", deal_hits=" + deal_hits
				+ ", member_pk=" + member_pk + "]";
	}


	public int getDeal_pk() {
		return deal_pk;
	}


	public void setDeal_pk(int deal_pk) {
		this.deal_pk = deal_pk;
	}


	public String getDeal_title() {
		return deal_title;
	}


	public void setDeal_title(String deal_title) {
		this.deal_title = deal_title;
	}


	public String getDeal_content() {
		return deal_content;
	}


	public void setDeal_content(String deal_content) {
		this.deal_content = deal_content;
	}


	public String getDeal_writer() {
		return deal_writer;
	}


	public void setDeal_writer(String deal_writer) {
		this.deal_writer = deal_writer;
	}


	public Date getDeal_date() {
		return deal_date;
	}


	public void setDeal_date(Date deal_date) {
		this.deal_date = deal_date;
	}


	public int getDeal_hits() {
		return deal_hits;
	}


	public void setDeal_hits(int deal_hits) {
		this.deal_hits = deal_hits;
	}


	public int getMember_pk() {
		return member_pk;
	}


	public void setMember_pk(int member_pk) {
		this.member_pk = member_pk;
	}

	
	


	
	
	
	
	
	
}
