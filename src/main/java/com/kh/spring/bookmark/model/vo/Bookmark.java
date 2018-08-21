package com.kh.spring.bookmark.model.vo;

public class Bookmark {
	private int bookmark_pk;
	private int member_pk;
	private int store_pk;
	private int nail_pk;
	private String bookmark_check;
	private String nail_re_img;
	
	
	public Bookmark() {
		// TODO Auto-generated constructor stub
	}


	public Bookmark(int bookmark_pk, int member_pk, int store_pk, int nail_pk, String bookmark_check,
			String nail_re_img) {
		super();
		this.bookmark_pk = bookmark_pk;
		this.member_pk = member_pk;
		this.store_pk = store_pk;
		this.nail_pk = nail_pk;
		this.bookmark_check = bookmark_check;
		this.nail_re_img = nail_re_img;
	}


	public int getBookmark_pk() {
		return bookmark_pk;
	}


	public void setBookmark_pk(int bookmark_pk) {
		this.bookmark_pk = bookmark_pk;
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


	public int getNail_pk() {
		return nail_pk;
	}


	public void setNail_pk(int nail_pk) {
		this.nail_pk = nail_pk;
	}


	public String getBookmark_check() {
		return bookmark_check;
	}


	public void setBookmark_check(String bookmark_check) {
		this.bookmark_check = bookmark_check;
	}


	public String getNail_re_img() {
		return nail_re_img;
	}


	public void setNail_re_img(String nail_re_img) {
		this.nail_re_img = nail_re_img;
	}


	@Override
	public String toString() {
		return "Bookmark [bookmark_pk=" + bookmark_pk + ", member_pk=" + member_pk + ", store_pk=" + store_pk
				+ ", nail_pk=" + nail_pk + ", bookmark_check=" + bookmark_check + ", nail_re_img=" + nail_re_img + "]";
	}
	
	
	
}
