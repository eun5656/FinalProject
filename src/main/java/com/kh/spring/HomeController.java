package com.kh.spring;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import org.aspectj.weaver.ast.Var;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		List<Nail> list = service.nailList();

		// nail화면 엊갈리게하는 인덱스
		
		List<Integer> col_i = new ArrayList<Integer>();

		int [] col_o = { 4, 2, 4,2,3,4,3,2,2,6,4 };
		for (int i = 0; i < list.size(); i++) {
			int [] col_r = { 4, 2, 4,2, 3,4,3,2,2,6,4 };
			col_i.add(col_r[i]);	
			if(col_r.length==0){
				col_r=col_o;
			}
		}
		
		model.addAttribute("nailist", list);
		model.addAttribute("col_i", col_i);

		System.out.println(list);
		System.out.println(col_i);

		return "index";
	}

}
