package com.kh.spring.nail.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.nail.model.vo.Nail;

public interface NailService {

	List<Nail> nailList();

	//List<Nail> selectNailColor(String nailColor);


	List<Map<String, Object>> selectNailList(Map selectMenu);

	List<Nail> nailListStore(int i);

}
