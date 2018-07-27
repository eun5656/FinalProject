package com.kh.spring.customer.cotroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.customer.model.service.CustomerService;


@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService service;
	
	@RequestMapping("/customer/notice.do")
	public String Notice()
	{
		return "customer/notice";
	}
	
	@RequestMapping("/customer/faq.do")
	public String Faq()
	{
		return "customer/faq";
	}

}
