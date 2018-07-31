package com.kh.spring.nail.model.vo;

import java.io.Serializable;

public class Nail implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3992803112779027654L;
	
	private int nail_pk;
	private String nail_name;
	private String nail_color;
	private String nail_style;
	private int shop_pk;
	private String nail_ori_img;
	private String re_img;
	
	public Nail() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Nail(int nail_pk, String nail_name, String nail_color, String nail_style, int shop_pk, String nail_ori_img,
			String re_img) {
		super();
		this.nail_pk = nail_pk;
		this.nail_name = nail_name;
		this.nail_color = nail_color;
		this.nail_style = nail_style;
		this.shop_pk = shop_pk;
		this.nail_ori_img = nail_ori_img;
		this.re_img = re_img;
	}



	public int getNail_pk() {
		return nail_pk;
	}
	public void setNail_pk(int nail_pk) {
		this.nail_pk = nail_pk;
	}
	public String getNail_name() {
		return nail_name;
	}
	public void setNail_name(String nail_name) {
		this.nail_name = nail_name;
	}
	public String getNail_color() {
		return nail_color;
	}
	public void setNail_color(String nail_color) {
		this.nail_color = nail_color;
	}
	public String getNail_style() {
		return nail_style;
	}
	public void setNail_style(String nail_style) {
		this.nail_style = nail_style;
	}
	public int getShop_pk() {
		return shop_pk;
	}
	public void setShop_pk(int shop_pk) {
		this.shop_pk = shop_pk;
	}
	public String getNail_ori_img() {
		return nail_ori_img;
	}
	public void setNail_ori_img(String nail_ori_img) {
		this.nail_ori_img = nail_ori_img;
	}
	public String getRe_img() {
		return re_img;
	}
	public void setRe_img(String re_img) {
		this.re_img = re_img;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	@Override
	public String toString() {
		return "Nail [nail_pk=" + nail_pk + ", nail_name=" + nail_name + ", nail_color=" + nail_color + ", nail_style="
				+ nail_style + ", shop_pk=" + shop_pk + ", nail_ori_img=" + nail_ori_img + ", re_img=" + re_img + "]";
	}

	
	
	

}
