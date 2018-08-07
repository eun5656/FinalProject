package com.kh.spring.message.model.service;

import java.util.Map;

public interface MessageService {
	
	int CheckId(String receive_user);
	
	int insertMsg(Map<String, String> map);

}
