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
import com.kh.spring.store.model.service.StoreService;
import com.kh.spring.store.model.vo.Store;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private NailService nailService;
	@Autowired 
	private StoreService storeService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		
		List<Store> storelist =storeService.mainStoreList();
		List<Nail> naillist = nailService.nailList();
		List<Integer> col_i = new ArrayList<Integer>();

		int [] col1 = { 4,2,3,3,3,4,3,2,2,6,4,5,3,4 };
		int k=0;
		for (int i = 0; i < naillist.size(); i++) {
			col_i.add(col1[k]);	
			if(i%9==0){
				k=0;
			}
			k++;
		}
		
		ModelAndView mv=new ModelAndView();
		mv.addObject("storelist", storelist);
		logger.info("storelist"+storelist);
		mv.addObject("nailist", naillist);
		mv.addObject("col_i", col_i);

		mv.setViewName("index");
		return mv;
	}
}
