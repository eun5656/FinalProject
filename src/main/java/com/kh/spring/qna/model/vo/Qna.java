package com.kh.spring.qna.model.vo;

import java.sql.Date;

public class Qna {
	
	private int qna_pk;
	private String qna_writer;
	private String answer_check;
	private int store_pk;
	private int member_pk;
	private String qna_title;
	private String qna_content;
	private Date qna_date;
	private String answer_title;
	private String answer_content;
	private Date answer_date;
	
	public Qna() {}

	public Qna(int qna_pk, String qna_writer, String answer_check, int store_pk, int member_pk, String qna_title,
			String qna_content, Date qna_date, String answer_title, String answer_content, Date answer_date) {
		super();
		this.qna_pk = qna_pk;
		this.qna_writer = qna_writer;
		this.answer_check = answer_check;
		this.store_pk = store_pk;
		this.member_pk = member_pk;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_date = qna_date;
		this.answer_title = answer_title;
		this.answer_content = answer_content;
		this.answer_date = answer_date;
	}

	public int getQna_pk() {
		return qna_pk;
	}

	public void setQna_pk(int qna_pk) {
		this.qna_pk = qna_pk;
	}

	public String getQna_writer() {
		return qna_writer;
	}

	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}

	public String getAnswer_check() {
		return answer_check;
	}

	public void setAnswer_check(String answer_check) {
		this.answer_check = answer_check;
	}

	public int getStore_pk() {
		return store_pk;
	}

	public void setStore_pk(int store_pk) {
		this.store_pk = store_pk;
	}

	public int getMember_pk() {
		return member_pk;
	}

	public void setMember_pk(int member_pk) {
		this.member_pk = member_pk;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public Date getQna_date() {
		return qna_date;
	}

	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}

	public String getAnswer_title() {
		return answer_title;
	}

	public void setAnswer_title(String answer_title) {
		this.answer_title = answer_title;
	}

	public String getAnswer_content() {
		return answer_content;
	}

	public void setAnswer_content(String answer_content) {
		this.answer_content = answer_content;
	}

	public Date getAnswer_date() {
		return answer_date;
	}

	public void setAnswer_date(Date answer_date) {
		this.answer_date = answer_date;
	}

	@Override
	public String toString() {
		return "Qna [qna_pk=" + qna_pk + ", qna_writer=" + qna_writer + ", answer_check=" + answer_check + ", store_pk="
				+ store_pk + ", member_pk=" + member_pk + ", qna_title=" + qna_title + ", qna_content=" + qna_content
				+ ", qna_date=" + qna_date + ", answer_title=" + answer_title + ", answer_content=" + answer_content
				+ ", answer_date=" + answer_date + "]";
	}
	
	
}