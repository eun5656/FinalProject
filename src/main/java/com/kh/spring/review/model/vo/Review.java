package com.kh.spring.review.model.vo;

import java.io.Serializable;

public class Review implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1390870067931401937L;
	
	private int review_pk;
	private String review_title;
	private String review_content;
	private String review_comment;
	private String review_date;
	private String member_pk;
	private String review_star;
	private int store_pk;
	private String review_ori_img;
	private String reivew_re_img;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}
	
	public Review(int review_pk, String review_title, String review_content, String review_comment, String review_date,
			String member_pk, String review_star, int store_pk, String review_ori_img, String reivew_re_img) {
		super();
		this.review_pk = review_pk;
		this.review_title = review_title;
		this.review_content = review_content;
		this.review_comment = review_comment;
		this.review_date = review_date;
		this.member_pk = member_pk;
		this.review_star = review_star;
		this.store_pk = store_pk;
		this.review_ori_img = review_ori_img;
		this.reivew_re_img = reivew_re_img;
	}


	public int getReview_pk() {
		return review_pk;
	}
	public void setReview_pk(int review_pk) {
		this.review_pk = review_pk;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_comment() {
		return review_comment;
	}
	public void setReview_comment(String review_comment) {
		this.review_comment = review_comment;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public String getMember_pk() {
		return member_pk;
	}
	public void setMember_pk(String member_pk) {
		this.member_pk = member_pk;
	}
	public String getReview_star() {
		return review_star;
	}
	public void setReview_star(String review_star) {
		this.review_star = review_star;
	}
	public int getStore_pk() {
		return store_pk;
	}
	public void setStore_pk(int store_pk) {
		this.store_pk = store_pk;
	}
	public String getReview_ori_img() {
		return review_ori_img;
	}
	public void setReview_ori_img(String review_ori_img) {
		this.review_ori_img = review_ori_img;
	}
	public String getReivew_re_img() {
		return reivew_re_img;
	}
	public void setReivew_re_img(String reivew_re_img) {
		this.reivew_re_img = reivew_re_img;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "Review [review_pk=" + review_pk + ", review_title=" + review_title + ", review_content="
				+ review_content + ", review_comment=" + review_comment + ", review_date=" + review_date
				+ ", member_pk=" + member_pk + ", review_star=" + review_star + ", store_pk=" + store_pk
				+ ", review_ori_img=" + review_ori_img + ", reivew_re_img=" + reivew_re_img + "]";
	}
	
	
}
