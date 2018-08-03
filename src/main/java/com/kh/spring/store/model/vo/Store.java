package com.kh.spring.store.model.vo;

import java.io.Serializable;

public class Store implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5180233677245625610L;
			
	
	private int store_pk;
	private int member_pk;
	private String store_num;
	private String store_name;
	private String store_address;
	private String store_phone;
	private String store_holiday;
	private String store_latitude;
	private String store_longitude;
	private String store_designer;
	private int store_rank;
	private String store_ori_img;
	private String store_re_img;
	private int store_review_count;
	
	
	public Store() {
		// TODO Auto-generated constructor stub
	}


	public Store(int store_pk, int member_pk, String store_num, String store_name, String store_address,
			String store_phone, String store_holiday, String store_latitude, String store_longitude,
			String store_designer, int store_rank, String store_ori_img, String store_re_img, int store_review_count) {
		super();
		this.store_pk = store_pk;
		this.member_pk = member_pk;
		this.store_num = store_num;
		this.store_name = store_name;
		this.store_address = store_address;
		this.store_phone = store_phone;
		this.store_holiday = store_holiday;
		this.store_latitude = store_latitude;
		this.store_longitude = store_longitude;
		this.store_designer = store_designer;
		this.store_rank = store_rank;
		this.store_ori_img = store_ori_img;
		this.store_re_img = store_re_img;
		this.store_review_count = store_review_count;
	}


	public int getStore_pk() {
		return store_pk;
	}


	public void setStore_pk(int store_pk) {
		this.store_pk = store_pk;
	}


	public int getMember_pk() {
		return member_pk;
	}


	public void setMember_pk(int member_pk) {
		this.member_pk = member_pk;
	}


	public String getStore_num() {
		return store_num;
	}


	public void setStore_num(String store_num) {
		this.store_num = store_num;
	}


	public String getStore_name() {
		return store_name;
	}


	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}


	public String getStore_address() {
		return store_address;
	}


	public void setStore_address(String store_address) {
		this.store_address = store_address;
	}


	public String getStore_phone() {
		return store_phone;
	}


	public void setStore_phone(String store_phone) {
		this.store_phone = store_phone;
	}


	public String getStore_holiday() {
		return store_holiday;
	}


	public void setStore_holiday(String store_holiday) {
		this.store_holiday = store_holiday;
	}


	public String getStore_latitude() {
		return store_latitude;
	}


	public void setStore_latitude(String store_latitude) {
		this.store_latitude = store_latitude;
	}


	public String getStore_longitude() {
		return store_longitude;
	}


	public void setStore_longitude(String store_longitude) {
		this.store_longitude = store_longitude;
	}


	public String getStore_designer() {
		return store_designer;
	}


	public void setStore_designer(String store_designer) {
		this.store_designer = store_designer;
	}


	public int getStore_rank() {
		return store_rank;
	}


	public void setStore_rank(int store_rank) {
		this.store_rank = store_rank;
	}


	public String getStore_ori_img() {
		return store_ori_img;
	}


	public void setStore_ori_img(String store_ori_img) {
		this.store_ori_img = store_ori_img;
	}


	public String getStore_re_img() {
		return store_re_img;
	}


	public void setStore_re_img(String store_re_img) {
		this.store_re_img = store_re_img;
	}


	public int getStore_review_count() {
		return store_review_count;
	}


	public void setStore_review_count(int store_review_count) {
		this.store_review_count = store_review_count;
	}


	@Override
	public String toString() {
		return "Store [store_pk=" + store_pk + ", member_pk=" + member_pk + ", store_num=" + store_num + ", store_name="
				+ store_name + ", store_address=" + store_address + ", store_phone=" + store_phone + ", store_holiday="
				+ store_holiday + ", store_latitude=" + store_latitude + ", store_longitude=" + store_longitude
				+ ", store_designer=" + store_designer + ", store_rank=" + store_rank + ", store_ori_img="
				+ store_ori_img + ", store_re_img=" + store_re_img + ", store_review_count=" + store_review_count + "]";
	}
	
}
