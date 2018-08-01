package com.kh.spring.nail.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
		//logger.debug("list"+list);
		return "/";
	}
	
	@RequestMapping("/nail/selectNailColor.do")
	public ModelAndView memberCheckIdDuplicate(String nailColor,ModelAndView mv) throws IOException
	{
		List<Nail> list=service.selectNailColor(nailColor);

		Map map=new HashMap();
		/*map.put("check", check);
		//map.put("name",URLEncoder.encode("홍성진", "UTF-8"));
		map.put("name","홍성진");
		map.put("su", 20);
		map.put("list", list);
		mv.addAllObjects(map);
		mv.setViewName("jsonView");		//javaScrpit객체로 쏴준다.
*/		return mv;
	}
	
	
}
