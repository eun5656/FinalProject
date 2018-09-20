package com.kh.spring.common;

public class MemberException extends RuntimeException {
	
	public MemberException() {
		super();
	}
	public MemberException(String msg){
		super(msg);
	}
}