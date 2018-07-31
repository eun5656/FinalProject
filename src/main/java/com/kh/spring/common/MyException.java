package com.kh.spring.common;

import oracle.net.aso.f;

public class MyException extends Exception {

	public MyException(){
		super();
	}
	public MyException(String msg){
		super("[MediPot]"+msg);
	}
}
