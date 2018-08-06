package com.kh.spring.message.model.vo;

import java.sql.Date;

public class Message {
	
	private int msgPk;
	private int memberPk;
	private String sendUser;
	private String receiveUser;
	private String sendTitle;
	private String sendContent;
	private Date sendDate;
	private String sendReadCheck;
	public Message(int msgPk, int memberPk, String sendUser, String receiveUser, String sendTitle, String sendContent,
			Date sendDate, String sendReadCheck) {
		super();
		this.msgPk = msgPk;
		this.memberPk = memberPk;
		this.sendUser = sendUser;
		this.receiveUser = receiveUser;
		this.sendTitle = sendTitle;
		this.sendContent = sendContent;
		this.sendDate = sendDate;
		this.sendReadCheck = sendReadCheck;
	}
	public int getMsgPk() {
		return msgPk;
	}
	public void setMsgPk(int msgPk) {
		this.msgPk = msgPk;
	}
	public int getMemberPk() {
		return memberPk;
	}
	public void setMemberPk(int memberPk) {
		this.memberPk = memberPk;
	}
	public String getSendUser() {
		return sendUser;
	}
	public void setSendUser(String sendUser) {
		this.sendUser = sendUser;
	}
	public String getReceiveUser() {
		return receiveUser;
	}
	public void setReceiveUser(String receiveUser) {
		this.receiveUser = receiveUser;
	}
	public String getSendTitle() {
		return sendTitle;
	}
	public void setSendTitle(String sendTitle) {
		this.sendTitle = sendTitle;
	}
	public String getSendContent() {
		return sendContent;
	}
	public void setSendContent(String sendContent) {
		this.sendContent = sendContent;
	}
	public Date getSendDate() {
		return sendDate;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	public String getSendReadCheck() {
		return sendReadCheck;
	}
	public void setSendReadCheck(String sendReadCheck) {
		this.sendReadCheck = sendReadCheck;
	}
	@Override
	public String toString() {
		return "Message [msgPk=" + msgPk + ", memberPk=" + memberPk + ", sendUser=" + sendUser + ", receiveUser="
				+ receiveUser + ", sendTitle=" + sendTitle + ", sendContent=" + sendContent + ", sendDate=" + sendDate
				+ ", sendReadCheck=" + sendReadCheck + "]";
	}
	
	
	

}
