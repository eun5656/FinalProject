package com.kh.spring.message.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.message.model.vo.Message;

public interface MessageService {
	
	int CheckId(String receive_user);
	
	int insertMsg(Map<String, Object> map);

	List<Message> selectList(String send_user);
	
	List<Message> selectList2(String receive_user);

}
