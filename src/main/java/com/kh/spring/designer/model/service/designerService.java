package com.kh.spring.designer.model.service;

import java.util.List;

import com.kh.spring.designer.model.vo.designer;

public interface designerService {

	List<designer> selectdesigner(int store_pk);

	int designerUpdate(designer designer);

	int deletedesigner(String designer_pk);

	int insertdesigner(designer designer);


}
