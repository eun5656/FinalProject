package com.kh.spring.reserve.model.service;

import java.util.List;
import java.util.Map;
import com.kh.spring.reserve.model.vo.Payment;
import com.kh.spring.reserve.model.vo.Reserve;
import com.kh.spring.store.model.vo.Store_time;

public interface ReserService {

	int storeReserveInsert(Reserve reserve);

	int selectStoreReserve(Map check);

	List<Reserve> selectreserveList(int store_pk);

	int paymentInsert(Payment payment);

	Store_time selectStoreTime(int store_pk);
	
}