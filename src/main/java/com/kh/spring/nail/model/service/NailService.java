package com.kh.spring.nail.model.service;

import java.util.List;
import java.util.Map;
import com.kh.spring.nail.model.vo.Nail;
import com.kh.spring.store.model.vo.Store;

public interface NailService {

	List<Nail> nailList();

	List<Map<String, Object>> selectNailList(Map selectMenu);

	List<Nail> nailListStore(int i);

	int insertNail(Nail nail);
	
	int updateNail(Nail nail);

	int nailDelete(String nail_pk);

	Nail selectNailOne(int nail_pk);

}