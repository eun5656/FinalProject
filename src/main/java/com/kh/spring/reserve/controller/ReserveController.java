package com.kh.spring.reserve.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.spring.reserve.model.service.ReserService;
import com.kh.spring.reserve.model.vo.Reserve;
import com.kh.spring.store.controller.StoreController;

import net.sf.json.JSONObject;

@Controller
public class ReserveController {
	private Logger logger = Logger.getLogger(StoreController.class);

	 @Autowired
	 ReserService service;
	@RequestMapping(value = "/reserve/storeReserveInsert.do", method = RequestMethod.POST, produces = {
			"application/text; charset=utf8" })
	@ResponseBody
	public String storeReserveInsert(HttpServletRequest request, HttpServletResponse response)
			throws JsonProcessingException {
		String jsonStr = request.getParameter("store_reserve");
		JSONObject jsonObject = JSONObject.fromObject(jsonStr);
		int member_pk = Integer.parseInt(jsonObject.getString("member_pk"));
		int menu_pk = Integer.parseInt(jsonObject.getString("menu_pk"));
		String member_name = String.valueOf(jsonObject.get("member_name"));
		int store_pk = Integer.parseInt(jsonObject.getString("store_pk"));
		String designer = String.valueOf(jsonObject.get("designer"));

		String reserve_start_time = String.valueOf(jsonObject.get("reserve_start_time"));
		String reserve_end_time = String.valueOf(jsonObject.get("reserve_end_time"));
		/* 1시간추가로직 */
		try {
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
			Date d1 = (Date) formatter.parse(reserve_start_time);
			// new Date=()
			Calendar cal = Calendar.getInstance();
			cal.setTime(d1);
			cal.set(Calendar.HOUR, cal.get(Calendar.HOUR) + 1);
			Date currentDatePlusOne = cal.getTime();
			logger.debug(reserve_start_time);
			reserve_end_time = formatter.format(currentDatePlusOne);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		Reserve reserve=new Reserve();
		reserve.setMember_pk(member_pk);
		reserve.setDesigner(designer);
		reserve.setMenu_pk(menu_pk);
		reserve.setReserve_start_time(reserve_start_time);
		reserve.setReserve_end_time(reserve_end_time);
		reserve.setReserve_status("대기");
		reserve.setStore_pk(store_pk);
		
		int reserv_pk=service.storeReserveInsert(reserve);
		System.out.println(reserve);
		ObjectMapper mapper = new ObjectMapper();
		String jsonstr = "";

		jsonstr = mapper.writeValueAsString("hi"); // javaScrpit객체로 쏴준다.

		return jsonstr;

	}

}
