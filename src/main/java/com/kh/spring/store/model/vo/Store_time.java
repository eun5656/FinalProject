package com.kh.spring.store.model.vo;

import java.text.SimpleDateFormat;

public class Store_time {

	private int store_pk;
	private String store_open_time;
	private String store_close_time;
	private String store_reserve_time;
	private String store_reserve_end_time;
	private String store_weekend_open;
	private String store_weekend_close;
	
	public Store_time addDate(Store_time st) {
		String add= "00/01/01";
		
		st.setStore_close_time(add + st.getStore_close_time());
		st.setStore_open_time(add + st.getStore_open_time());
		st.setStore_reserve_end_time(add + st.getStore_reserve_end_time());
		st.setStore_reserve_time(add + st.getStore_reserve_time());
		st.setStore_weekend_open(add + st.getStore_weekend_open());
		st.setStore_weekend_close(add + st.getStore_weekend_close());
		
		return st;
		
	}
	public Store_time deleteDate(Store_time st) {
		String add= "2000-01-01 ";
		
		st.setStore_close_time(st.getStore_close_time().replaceAll(add, ""));
		st.setStore_open_time(st.getStore_open_time().replaceAll(add, ""));
		st.setStore_reserve_end_time(st.getStore_reserve_end_time().replaceAll(add, ""));
		st.setStore_reserve_time(st.getStore_reserve_time().replaceAll(add, ""));
		st.setStore_weekend_open(st.getStore_weekend_open().replaceAll(add, ""));
		st.setStore_weekend_close(st.getStore_weekend_close().replaceAll(add, ""));
		return st;
		
	}
	
	public Store_time()
	{
		
	}
	@Override
	public String toString() {
		return "Store_time [store_pk=" + store_pk + ", store_open_time=" + store_open_time + ", store_close_time="
				+ store_close_time + ", store_reserve_time=" + store_reserve_time + ", store_reserve_end_time="
				+ store_reserve_end_time + ", store_weekend_open=" + store_weekend_open + ", store_weekend_close="
				+ store_weekend_close + "]";
	}
	public int getStore_pk() {
		return store_pk;
	}
	public void setStore_pk(int store_pk) {
		this.store_pk = store_pk;
	}
	public String getStore_open_time() {
		return store_open_time;
	}
	public void setStore_open_time(String store_open_time) {
		this.store_open_time = store_open_time;
	}
	public String getStore_close_time() {
		return store_close_time;
	}
	public void setStore_close_time(String store_close_time) {
		this.store_close_time = store_close_time;
	}
	public String getStore_reserve_time() {
		return store_reserve_time;
	}
	public void setStore_reserve_time(String store_reserve_time) {
		this.store_reserve_time = store_reserve_time;
	}
	public String getStore_reserve_end_time() {
		return store_reserve_end_time;
	}
	public void setStore_reserve_end_time(String store_reserve_end_time) {
		this.store_reserve_end_time = store_reserve_end_time;
	}
	public String getStore_weekend_open() {
		return store_weekend_open;
	}
	public void setStore_weekend_open(String store_weekend_open) {
		this.store_weekend_open = store_weekend_open;
	}
	public String getStore_weekend_close() {
		return store_weekend_close;
	}
	public void setStore_weekend_close(String store_weekend_close) {
		this.store_weekend_close = store_weekend_close;
	}

	
	
}
