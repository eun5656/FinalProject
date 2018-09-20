package com.kh.spring.message.model.service;

import java.util.List;
import java.util.Map;
import com.kh.spring.message.model.vo.Message;

public interface MessageService {
	
	int CheckId(String receive_user);
	
	int insertMsg(Map<String, Object> map);

	List<Message> selectList(String send_user,int cPage, int numPerPage);
	
	int selectCount(String send_user);
	
	List<Message> selectList2(String receive_user,int cPage, int numPerPage);
	
	int selectCount2(String receive_user);

	Message selectOne(int message_pk);
	
	int update(int message_pk);
	
	int delete(int message_pk);
	
}