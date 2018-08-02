package com.kh.spring.store.model.vo;

public class Menu {

	private int menu_pk;
	private String menu_name;
	private String menu_info;
	private int menu_price;
	private String menu_check;
	private int store_pk;
	
	
	public Menu() {
		
	}
	
	public Menu(int menu_pk, String menu_name, String menu_info, int menu_price, String menu_check, int store_pk) {
		super();
		this.menu_pk = menu_pk;
		this.menu_name = menu_name;
		this.menu_info = menu_info;
		this.menu_price = menu_price;
		this.menu_check = menu_check;
		this.store_pk = store_pk;
	}
	@Override
	public String toString() {
		return "Menu [menu_pk=" + menu_pk + ", menu_name=" + menu_name + ", menu_info=" + menu_info + ", menu_price="
				+ menu_price + ", menu_check=" + menu_check + ", store_pk=" + store_pk + "]";
	}
	public int getMenu_pk() {
		return menu_pk;
	}
	public void setMenu_pk(int menu_pk) {
		this.menu_pk = menu_pk;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getMenu_info() {
		return menu_info;
	}
	public void setMenu_info(String menu_info) {
		this.menu_info = menu_info;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	public String getMenu_check() {
		return menu_check;
	}
	public void setMenu_check(String menu_check) {
		this.menu_check = menu_check;
	}
	public int getStore_pk() {
		return store_pk;
	}
	public void setStore_pk(int store_pk) {
		this.store_pk = store_pk;
	}
	
	
}
