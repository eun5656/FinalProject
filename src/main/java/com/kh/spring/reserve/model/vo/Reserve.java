package com.kh.spring.reserve.model.vo;

import java.io.Serializable;

public class Reserve implements Serializable{

   private static final long serialVersionUID = 3449014036699805063L;
   
   private int reserve_pk;
   private int member_pk;
   private String member_name;
   private int store_pk;
   private String designer_name;
   private String designer_id;
   private int menu_pk;
   private String reserve_status;
   private String reserve_start_time;
   private String reserve_end_time;
   private String reserve_apply_date;
   
   private String store_name;
   private String store_phone;
   private String store_re_img;
   
   public Reserve() {
      // TODO Auto-generated constructor stub
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

   public String getMember_name() {
      return member_name;
   }

   public void setMember_name(String member_name) {
      this.member_name = member_name;
   }

   public int getStore_pk() {
      return store_pk;
   }

   public void setStore_pk(int store_pk) {
      this.store_pk = store_pk;
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

   public int getMenu_pk() {
      return menu_pk;
   }

   public void setMenu_pk(int menu_pk) {
      this.menu_pk = menu_pk;
   }

   public String getReserve_status() {
      return reserve_status;
   }

   public void setReserve_status(String reserve_status) {
      this.reserve_status = reserve_status;
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

   public String getStore_name() {
      return store_name;
   }

   public void setStore_name(String store_name) {
      this.store_name = store_name;
   }

   public String getStore_phone() {
      return store_phone;
   }

   public void setStore_phone(String store_phone) {
      this.store_phone = store_phone;
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
      return "Reserve [reserve_pk=" + reserve_pk + ", member_pk=" + member_pk + ", member_name=" + member_name
            + ", store_pk=" + store_pk + ", designer_name=" + designer_name + ", designer_id=" + designer_id
            + ", menu_pk=" + menu_pk + ", reserve_status=" + reserve_status + ", reserve_start_time="
            + reserve_start_time + ", reserve_end_time=" + reserve_end_time + ", reserve_apply_date="
            + reserve_apply_date + ", store_name=" + store_name + ", store_phone=" + store_phone + ", store_re_img="
            + store_re_img + "]";
   }

   
   
}