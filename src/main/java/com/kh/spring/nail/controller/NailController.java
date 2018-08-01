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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
	
	@RequestMapping("/nail/selectNailColor.do")
	@ResponseBody
	public ModelAndView selectNailList(String nail_color,String nail_check,String nail_style,  ModelAndView mv)throws JsonProcessingException
	{
		
	//	ObjectMapper mapper=new ObjectMapper();

		//String jsonstr="";
		
		
		logger.info("nail_color"+nail_color);
		logger.info("nail_check"+nail_check);
		logger.info("nail_style"+nail_style);
	
		/*json으로 들어오기 떄문에 null처리해줌*/
		if(nail_color.equals("")) {
			nail_color=null;
		}
		if(nail_style.equals("")) {
			nail_style=null;
		}
		
		if(nail_check.equals("네일")){	
			nail_check="1";
		}
		else if (nail_check.equals("페디")) {
			nail_check="2";

		}
		else {
			nail_check=null;
		}
		
		
		
		
		Map map=new HashMap();
		map.put("nail_color", nail_color);
		map.put("nail_check", nail_check);
		map.put("nail_style", nail_style);
		logger.info("map"+map);

		Map<String, Nail> selectlist=service.selectNailList(map);
		Map<String, Integer> col_i = new HashMap<String, Integer>();

		int [] col1 = { 4, 2, 6,3,4,3,2,2,6,4 };
		int[] col2=col1;
		for (int i = 0; i < selectlist.size(); i++) {
			col_i.put(String.valueOf(i), col1[i]);	
			if(col1.length==0){
				col1=col2;
			}
		}
		
		logger.info("selectlist"+selectlist);
		mv.addAllObjects(selectlist);
		mv.addAllObjects(col_i);


	//	List<Nail> list=service.selectNailColor(nail_color);

		/*map.put("check", check);
		//map.put("name",URLEncoder.encode("홍성진", "UTF-8"));
		map.put("name","홍성진");
		map.put("su", 20);
		map.put("list", list);
		mv.addAllObjects(map);
		mv.setViewName("jsonView");		//javaScrpit객체로 쏴준다.
		
*/		
		mv.setViewName("jsonView");
		return mv;
	}
	
	
}
