package com.kh.spring.reserve.model.vo;

import java.io.Serializable;

public class Reserve implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3449014036699805063L;
	
	private int reserve_pk;
	private int member_pk;
	private int store_pk;
	private String designer;
	private int menu_pk;
	private String reserve_atatus;
	private String reserve_start_time;
	private String reserve_end_time;
	private String reserve_apply_date;
	
	
	public Reserve() {
		// TODO Auto-generated constructor stub
	}
	 
	
	public Reserve(int reserve_pk, int member_pk, int store_pk, String designer, int menu_pk, String reserve_atatus,
			String reserve_start_time, String reserve_end_time, String reserve_apply_date) {
		this.reserve_pk = reserve_pk;
		this.member_pk = member_pk;
		this.store_pk = store_pk;
		this.designer = designer;
		this.menu_pk = menu_pk;
		this.reserve_atatus = reserve_atatus;
		this.reserve_start_time = reserve_start_time;
		this.reserve_end_time = reserve_end_time;
		this.reserve_apply_date = reserve_apply_date;
	}


	public int getReserve_pk() {
		return reserve_pk;
	}
	public void setReserve_pk(int reserve_pk) {
		this.reserve_pk = reserve_pk;
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
	public String getDesigner() {
		return designer;
	}
	public void setDesigner(String designer) {
		this.designer = designer;
	}
	public int getMenu_pk() {
		return menu_pk;
	}
	public void setMenu_pk(int menu_pk) {
		this.menu_pk = menu_pk;
	}
	public String getReserve_atatus() {
		return reserve_atatus;
	}
	public void setReserve_atatus(String reserve_atatus) {
		this.reserve_atatus = reserve_atatus;
	}
	public String getReserve_start_time() {
		return reserve_start_time;
	}
	public void setReserve_start_time(String reserve_start_time) {
		this.reserve_start_time = reserve_start_time;
	}
	public String getReserve_end_time() {
		return reserve_end_time;
	}
	public void setReserve_end_time(String reserve_end_time) {
		this.reserve_end_time = reserve_end_time;
	}
	public String getReserve_apply_date() {
		return reserve_apply_date;
	}
	public void setReserve_apply_date(String reserve_apply_date) {
		this.reserve_apply_date = reserve_apply_date;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Reserve [reserve_pk=" + reserve_pk + ", member_pk=" + member_pk + ", store_pk=" + store_pk
				+ ", designer=" + designer + ", menu_pk=" + menu_pk + ", reserve_atatus=" + reserve_atatus
				+ ", reserve_start_time=" + reserve_start_time + ", reserve_end_time=" + reserve_end_time
				+ ", reserve_apply_date=" + reserve_apply_date + "]";
	}
	
	
	
}
