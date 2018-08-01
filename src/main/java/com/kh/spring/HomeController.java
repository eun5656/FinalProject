package com.kh.spring;


import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.nail.model.service.NailService;
import com.kh.spring.nail.model.vo.Nail;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private NailService service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);
		List<Nail> list = service.nailList();
		List<Integer> col_i = new ArrayList<Integer>();

		int [] col1 = { 4, 2,3, 3,3,4,3,2,2,6,4 };
		int[] col2=col1;
		for (int i = 0; i < list.size(); i++) {
			col_i.add(col1[i]);	
			if(col1.length==0){
				col1=col2;
			}
		}
		
		ModelAndView mv=new ModelAndView();
		mv.addObject("nailist", list);
		mv.addObject("col_i", col_i);

		System.out.println(list);
		System.out.println(col_i);	
		mv.setViewName("index");
		return mv;
	}
}
