package com.kh.spring.deal.model.vo;

public class DealImage {
	private int deal_pk;
	private String deal_ori_img;
	private String deal_re_img;
	
	public DealImage() {
		
	}

	public DealImage(int deal_pk, String deal_ori_img, String deal_re_img) {
		super();
		this.deal_pk = deal_pk;
		this.deal_ori_img = deal_ori_img;
		this.deal_re_img = deal_re_img;
	}

	@Override
	public String toString() {
		return "DealImage [deal_pk=" + deal_pk + ", deal_ori_img=" + deal_ori_img + ", deal_re_img=" + deal_re_img
				+ "]";
	}

	public int getDeal_pk() {
		return deal_pk;
	}

	public void setDeal_pk(int deal_pk) {
		this.deal_pk = deal_pk;
	}

	public String getDeal_ori_img() {
		return deal_ori_img;
	}

	public void setDeal_ori_img(String deal_ori_img) {
		this.deal_ori_img = deal_ori_img;
	}

	public String getDeal_re_img() {
		return deal_re_img;
	}

	public void setDeal_re_img(String deal_re_img) {
		this.deal_re_img = deal_re_img;
	}

	
	
	

}
