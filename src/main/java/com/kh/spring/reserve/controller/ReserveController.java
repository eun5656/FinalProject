package com.kh.spring.reserve.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
	
		//ajax 받기
		String jsonStr = request.getParameter("store_reserve");
		
		//json객체로변환
		JSONObject jsonObject = JSONObject.fromObject(jsonStr);
		
		
		int member_pk = Integer.parseInt(jsonObject.getString("member_pk"));
		int menu_pk = Integer.parseInt(jsonObject.getString("menu_pk"));
		//String member_name = String.valueOf(jsonObject.get("member_name"));
		int store_pk = Integer.parseInt(jsonObject.getString("store_pk"));
		String designer = String.valueOf(jsonObject.get("designer"));
		String reserve_start_time = String.valueOf(jsonObject.get("reserve_start_time"));
		
		//T 제거
		reserve_start_time = reserve_start_time.replaceAll("T", " ");
		System.out.println(reserve_start_time);
		String reserve_end_time = String.valueOf(jsonObject.get("reserve_end_time"));
		
		/*예약 들어있는지 확인*/
		Map check=new HashMap();
		check.put("store_pk",store_pk);
		check.put("designer", designer);
		check.put("reserve_start_time", reserve_start_time);
		Reserve reserve = service.selectStoreReserve(check);
		
		
		//예약 실제 로직~
		String msg="예약이 이미 차있습니다.";
		Map map=new HashMap();
		System.out.println(reserve);
		if (reserve == null) {
			reserve=new Reserve();
			try {
				// 시간 추가로직~
				DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date d1 = (Date) formatter.parse(reserve_start_time);
				// new Date=()
				Calendar cal = Calendar.getInstance();
				cal.setTime(d1);
				cal.set(Calendar.HOUR, cal.get(Calendar.HOUR) + 1);
				Date currentDatePlusOne = cal.getTime();
				reserve_start_time = formatter.format(d1);
				reserve_end_time = formatter.format(currentDatePlusOne);
				logger.debug(reserve_start_time);
				logger.debug(reserve_end_time);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			//객체에 값넣기
			reserve.setMember_pk(member_pk);
			reserve.setDesigner(designer);
			reserve.setMenu_pk(menu_pk);
			reserve.setReserve_start_time(reserve_start_time);
			reserve.setReserve_end_time(reserve_end_time);
			reserve.setReserve_status("대기");
			reserve.setStore_pk(store_pk);
			
			//보내고 예약 pk받아오기~ 객체 자체를 쏴줄꺼임
			int result = service.storeReserveInsert(reserve);
			
			System.out.println("result"+result);
			if(result>0) {
				map.put("reserve", reserve);
				msg="예약완료";
			}
		}
		map.put("msg",msg);
		System.out.println(map);
		ObjectMapper mapper = new ObjectMapper();
		String jsonstr = "";
		jsonstr=mapper.writeValueAsString(map);
		return jsonstr;

	}

}
