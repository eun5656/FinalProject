package com.kh.spring.nail.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.nail.model.service.NailService;
import com.kh.spring.nail.model.vo.Nail;

@Controller
public class NailController {
	private Logger logger=LoggerFactory.getLogger(NailController.class);

	@Autowired
	private NailService service;

	@RequestMapping("/nail/nailList.do")
	public String  nailList(){
		List<Nail> list=service.nailList();
		logger.debug("list"+list);
		return "/";
	}
}
