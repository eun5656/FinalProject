package com.kh.spring.customer.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.customer.model.dao.CustomerDAO;

@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	CustomerDAO customerDao;
	

}
