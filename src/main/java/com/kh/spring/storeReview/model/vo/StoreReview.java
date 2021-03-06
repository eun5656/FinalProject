package com.kh.spring.storeReview.model.vo;

import java.io.Serializable;

public class StoreReview implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1390870067931401937L;	
	
	private int review_pk;
	private int review_level;
	private String review_writer;
	private String review_content;
	private int review_ref;
	private String review_date;
	private String review_ori_img;
	private String review_re_img;
	private int review_star;
	private int member_pk;
	private int store_pk;
	private String member_re_img;
	
	
	public StoreReview() {
		// TODO Auto-generated constructor stub
	}
	
	
	public StoreReview(int review_pk, int review_level, String review_writer, String review_content, int review_ref,
			String review_date, String review_ori_img, String review_re_img, int review_star, int member_pk,
			int store_pk, String member_re_img) {
		this.review_pk = review_pk;
		this.review_level = review_level;
		this.review_writer = review_writer;
		this.review_content = review_content;
		this.review_ref = review_ref;
		this.review_date = review_date;
		this.review_ori_img = review_ori_img;
		this.review_re_img = review_re_img;
		this.review_star = review_star;
		this.member_pk = member_pk;
		this.store_pk = store_pk;
		this.member_re_img = member_re_img;
	}


	public int getReview_pk() {
		return review_pk;
	}
	public void setReview_pk(int review_pk) {
		this.review_pk = review_pk;
	}
	public int getReview_level() {
		return review_level;
	}
	public void setReview_level(int review_level) {
		this.review_level = review_level;
	}
	public String getReview_writer() {
		return review_writer;
	}
	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_ref() {
		return review_ref;
	}
	public void setReview_ref(int review_ref) {
		this.review_ref = review_ref;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public String getReview_ori_img() {
		return review_ori_img;
	}
	public void setReview_ori_img(String review_ori_img) {
		this.review_ori_img = review_ori_img;
	}
	public String getReview_re_img() {
		return review_re_img;
	}
	public void setReview_re_img(String review_re_img) {
		this.review_re_img = review_re_img;
	}
	public int getReview_star() {
		return review_star;
	}
	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}
	public int getMember_pk() {
		return member_pk;
	}
	public void setMember_pk(int member_pk) {
		this.member_pk = member_pk;
	}
	public int getStore_pk() {
		return store_pk;
	}
	public void setStore_pk(int store_pk) {
		this.store_pk = store_pk;
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
	@Override
	public String toString() {
		return "StoreReview [review_pk=" + review_pk + ", review_level=" + review_level + ", review_writer="
				+ review_writer + ", review_content=" + review_content + ", review_ref=" + review_ref + ", review_date="
				+ review_date + ", review_ori_img=" + review_ori_img + ", review_re_img=" + review_re_img
				+ ", review_star=" + review_star + ", member_pk=" + member_pk + ", store_pk=" + store_pk
				+ ", member_re_img=" + member_re_img + "]";
	}
	
		
}
