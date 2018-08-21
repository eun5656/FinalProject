package com.kh.spring.reserve.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.reserve.model.vo.Payment;
import com.kh.spring.reserve.model.vo.Reserve;

public interface ReserService {

	int storeReserveInsert(Reserve reserve);

	int selectStoreReserve(Map check);

	List<Reserve> selectreserveList(int store_pk);

	int paymentInsert(Payment payment);
}
