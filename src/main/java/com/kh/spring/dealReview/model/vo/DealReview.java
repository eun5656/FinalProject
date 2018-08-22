package com.kh.spring.dealReview.model.vo;

import java.io.Serializable;

public class DealReview implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7871911121707586386L;

	
	private int deal_review_pk;
	private int deal_review_level;
	private String deal_review_writer;
	private String deal_review_content;
	private int deal_review_ref;
	private String deal_review_date;
	private String deal_review_ori_img;
	private String deal_review_re_img;
	private int member_pk;
	private int deal_pk;
	private String member_re_img;
	
	public DealReview() {}

	public DealReview(int deal_review_pk, int deal_review_level, String deal_review_writer, String deal_review_content,
			int deal_review_ref, String deal_review_date, String deal_review_ori_img, String deal_review_re_img,
			int member_pk, int deal_pk, String member_re_img) {
		super();
		this.deal_review_pk = deal_review_pk;
		this.deal_review_level = deal_review_level;
		this.deal_review_writer = deal_review_writer;
		this.deal_review_content = deal_review_content;
		this.deal_review_ref = deal_review_ref;
		this.deal_review_date = deal_review_date;
		this.deal_review_ori_img = deal_review_ori_img;
		this.deal_review_re_img = deal_review_re_img;
		this.member_pk = member_pk;
		this.deal_pk = deal_pk;
		this.member_re_img = member_re_img;
	}

	@Override
	public String toString() {
		return "DealReview [deal_review_pk=" + deal_review_pk + ", deal_review_level=" + deal_review_level
				+ ", deal_review_writer=" + deal_review_writer + ", deal_review_content=" + deal_review_content
				+ ", deal_review_ref=" + deal_review_ref + ", deal_review_date=" + deal_review_date
				+ ", deal_review_ori_img=" + deal_review_ori_img + ", deal_review_re_img=" + deal_review_re_img
				+ ", member_pk=" + member_pk + ", deal_pk=" + deal_pk + ", member_re_img=" + member_re_img + "]";
	}

	public int getDeal_review_pk() {
		return deal_review_pk;
	}

	public void setDeal_review_pk(int deal_review_pk) {
		this.deal_review_pk = deal_review_pk;
	}

	public int getDeal_review_level() {
		return deal_review_level;
	}

	public void setDeal_review_level(int deal_review_level) {
		this.deal_review_level = deal_review_level;
	}

	public String getDeal_review_writer() {
		return deal_review_writer;
	}

	public void setDeal_review_writer(String deal_review_writer) {
		this.deal_review_writer = deal_review_writer;
	}

	public String getDeal_review_content() {
		return deal_review_content;
	}

	public void setDeal_review_content(String deal_review_content) {
		this.deal_review_content = deal_review_content;
	}

	public int getDeal_review_ref() {
		return deal_review_ref;
	}

	public void setDeal_review_ref(int deal_review_ref) {
		this.deal_review_ref = deal_review_ref;
	}

	public String getDeal_review_date() {
		return deal_review_date;
	}

	public void setDeal_review_date(String deal_review_date) {
		this.deal_review_date = deal_review_date;
	}

	public String getDeal_review_ori_img() {
		return deal_review_ori_img;
	}

	public void setDeal_review_ori_img(String deal_review_ori_img) {
		this.deal_review_ori_img = deal_review_ori_img;
	}

	public String getDeal_review_re_img() {
		return deal_review_re_img;
	}

	public void setDeal_review_re_img(String deal_review_re_img) {
		this.deal_review_re_img = deal_review_re_img;
	}

	public int getMember_pk() {
		return member_pk;
	}

	public void setMember_pk(int member_pk) {
		this.member_pk = member_pk;
	}

	public int getDeal_pk() {
		return deal_pk;
	}

	public void setDeal_pk(int deal_pk) {
		this.deal_pk = deal_pk;
	}

	public String getMember_re_img() {
		return member_re_img;
	}

	public void setMember_re_img(String member_re_img) {
		this.member_re_img = member_re_img;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
	
	
	
}
