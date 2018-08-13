package com.kh.spring.member.model.vo;

public class Member {
	
	private int member_pk;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_phone;
	private String member_email;
	private String member_address;
	private String member_ori_img;
	private String member_re_img;
	private String member_level;
	
	public Member() {
		super();
	}

	public Member(int member_pk, String member_id, String member_pw, String member_name, String member_phone,
			String member_email, String member_address, String member_ori_img, String member_re_img,
			String member_level) {
		super();
		this.member_pk = member_pk;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_phone = member_phone;
		this.member_email = member_email;
		this.member_address = member_address;
		this.member_ori_img = member_ori_img;
		this.member_re_img = member_re_img;
		this.member_level = member_level;
	}

	@Override
	public String toString() {
		return "Member [member_pk=" + member_pk + ", member_id=" + member_id + ", member_pw=" + member_pw
				+ ", member_name=" + member_name + ", member_phone=" + member_phone + ", member_email=" + member_email
				+ ", member_address=" + member_address + ", member_ori_img=" + member_ori_img + ", member_re_img="
				+ member_re_img + ", member_level=" + member_level + "]";
	}

	public int getMember_pk() {
		return member_pk;
	}

	public void setMember_pk(int member_pk) {
		this.member_pk = member_pk;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}

	public String getMember_ori_img() {
		return member_ori_img;
	}

	public void setMember_ori_img(String member_ori_img) {
		this.member_ori_img = member_ori_img;
	}

	public String getMember_re_img() {
		return member_re_img;
	}

	public void setMember_re_img(String member_re_img) {
		this.member_re_img = member_re_img;
	}

	public String getMember_level() {
		return member_level;
	}

	public void setMember_level(String member_level) {
		this.member_level = member_level;
	}
	
}
