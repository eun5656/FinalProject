package com.kh.spring.manage.model.service;

import java.util.List;
import com.kh.spring.reserve.model.vo.Payment;
import com.kh.spring.store.model.vo.Store;

public interface ManageService {

	List<Store> storeList(int cPage, int numPerPage);

	int selectCount();

	Store selectManage(int store_pk);

	List<Payment> paymentList(int cPage, int numPerPage);

	int paymentCount();

	int paymentUpdateCheck(int payment_pk);

	int reserveDelete(int reserve_pk);
}