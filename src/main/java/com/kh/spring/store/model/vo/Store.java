package com.kh.spring.store.model.vo;

import java.io.Serializable;

public class Store implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5180233677245625610L;
			
	
	private int store_pk;
	private int member_pke;
	private String store_num;
	private String store_name;
	private String store_address;
	private String store_phone;
	private String store_holiday;
	private String store_latitude;
	private String store_longitude;
	private String store_designer;
	private String store_ori_img;
	private String store_re_img;
	
	public Store() {
		// TODO Auto-generated constructor stub
	}
	
	
	public Store(int store_pk, int member_pke, String store_num, String store_name, String store_address,
			String store_phone, String store_holiday, String store_latitude, String store_longitude,
			String store_designer, String store_ori_img, String store_re_img) {
		super();
		this.store_pk = store_pk;
		this.member_pke = member_pke;
		this.store_num = store_num;
		this.store_name = store_name;
		this.store_address = store_address;
		this.store_phone = store_phone;
		this.store_holiday = store_holiday;
		this.store_latitude = store_latitude;
		this.store_longitude = store_longitude;
		this.store_designer = store_designer;
		this.store_ori_img = store_ori_img;
		this.store_re_img = store_re_img;
	}


	public int getStore_pk() {
		return store_pk;
	}
	public void setStore_pk(int store_pk) {
		this.store_pk = store_pk;
	}
	public int getMember_pke() {
		return member_pke;
	}
	public void setMember_pke(int member_pke) {
		this.member_pke = member_pke;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "Store [store_pk=" + store_pk + ", member_pke=" + member_pke + ", store_num=" + store_num
				+ ", store_name=" + store_name + ", store_address=" + store_address + ", store_phone=" + store_phone
				+ ", store_holiday=" + store_holiday + ", store_latitude=" + store_latitude + ", store_longitude="
				+ store_longitude + ", store_designer=" + store_designer + ", store_ori_img=" + store_ori_img
				+ ", store_re_img=" + store_re_img + "]";
	}
	
	
	
}
