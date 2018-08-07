package com.kh.spring.deal.model.vo;

public class DealImage {
	private int dealPk;
	private String dealOriImg;
	private String dealReImg;
	
	public DealImage() {
		
	}

	public DealImage(int dealPk, String dealOriImg, String dealReImg) {
		super();
		this.dealPk = dealPk;
		this.dealOriImg = dealOriImg;
		this.dealReImg = dealReImg;
	}

	@Override
	public String toString() {
		return "DealImage [dealPk=" + dealPk + ", dealOriImg=" + dealOriImg + ", dealReImg=" + dealReImg + "]";
	}

	public int getDealPk() {
		return dealPk;
	}

	public void setDealPk(int dealPk) {
		this.dealPk = dealPk;
	}

	public String getDealOriImg() {
		return dealOriImg;
	}

	public void setDealOriImg(String dealOriImg) {
		this.dealOriImg = dealOriImg;
	}

	public String getDealReImg() {
		return dealReImg;
	}

	public void setDealReImg(String dealReImg) {
		this.dealReImg = dealReImg;
	}

	
	

}
