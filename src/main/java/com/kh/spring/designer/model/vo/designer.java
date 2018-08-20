package com.kh.spring.designer.model.vo;

public class designer {
	
	private int designer_pk;
	private String designer_name;
	private String designer_id;
	private int store_pk;
	
	public designer() {
		
	}
	public int getDesigner_pk() {
		return designer_pk;
	}
	public void setDesigner_pk(int designer_pk) {
		this.designer_pk = designer_pk;
	}
	public String getDesigner_name() {
		return designer_name;
	}
	public void setDesigner_name(String designer_name) {
		this.designer_name = designer_name;
	}
	public String getDesigner_id() {
		return designer_id;
	}
	public void setDesigner_id(String designer_id) {
		this.designer_id = designer_id;
	}
	public int getStore_pk() {
		return store_pk;
	}
	public void setStore_pk(int store_pk) {
		this.store_pk = store_pk;
	}
	

}
