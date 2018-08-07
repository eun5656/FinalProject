package com.kh.spring.message.model.vo;

import java.sql.Date;

public class Message {
	
	private int msg_pk;
	private int member_pk;
	private String send_user;
	private String receive_user;
	private String send_title;
	private String send_content;
	private Date send_date;
	private String send_read_check;
	
	public Message( ) {}

	public Message(int msg_pk, int member_pk, String send_user, String receive_user, String send_title,
			String send_content, Date send_date, String send_read_check) {
		super();
		this.msg_pk = msg_pk;
		this.member_pk = member_pk;
		this.send_user = send_user;
		this.receive_user = receive_user;
		this.send_title = send_title;
		this.send_content = send_content;
		this.send_date = send_date;
		this.send_read_check = send_read_check;
	}

	public int getMsg_pk() {
		return msg_pk;
	}

	public void setMsg_pk(int msg_pk) {
		this.msg_pk = msg_pk;
	}

	public int getMember_pk() {
		return member_pk;
	}

	public void setMember_pk(int member_pk) {
		this.member_pk = member_pk;
	}

	public String getSend_user() {
		return send_user;
	}

	public void setSend_user(String send_user) {
		this.send_user = send_user;
	}

	public String getReceive_user() {
		return receive_user;
	}

	public void setReceive_user(String receive_user) {
		this.receive_user = receive_user;
	}

	public String getSend_title() {
		return send_title;
	}

	public void setSend_title(String send_title) {
		this.send_title = send_title;
	}

	public String getSend_content() {
		return send_content;
	}

	public void setSend_content(String send_content) {
		this.send_content = send_content;
	}

	public Date getSend_date() {
		return send_date;
	}

	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}

	public String getSend_read_check() {
		return send_read_check;
	}

	public void setSend_read_check(String send_read_check) {
		this.send_read_check = send_read_check;
	}

	@Override
	public String toString() {
		return "Message [msg_pk=" + msg_pk + ", member_pk=" + member_pk + ", send_user=" + send_user + ", receive_user="
				+ receive_user + ", send_title=" + send_title + ", send_content=" + send_content + ", send_date="
				+ send_date + ", send_read_check=" + send_read_check + "]";
	}
	
}
