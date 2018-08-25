package com.kh.spring.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.bookmark.model.vo.Bookmark;
import com.kh.spring.member.model.dao.MemberDAO;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.mypage.model.dao.MypageDAO;
import com.kh.spring.qna.model.vo.Qna;
import com.kh.spring.reserve.model.vo.Payment;
import com.kh.spring.reserve.model.vo.Reserve;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	MypageDAO mypageDAO;

	@Override
	public List<Qna> selectList(int member_pk,int cPage, int numPerPage) {
		
		return mypageDAO.selectList(sqlSession,member_pk,cPage, numPerPage);
	}

	@Override
	public int selectCount(int member_pk) {
		return mypageDAO.selectCount(sqlSession,member_pk);
	}

	@Override
	public Qna selectOne(int qna_pk) {
		return mypageDAO.selectOne(sqlSession,qna_pk);
	}

	@Override
	public List<Reserve> mypageReserveList(int memberPk,int cPage, int numPerPage) {
		
		return mypageDAO.mypageReserveList(sqlSession, memberPk,cPage,numPerPage);
	}

	@Override
	public int reserveCount(int memberPk) {
		
		return mypageDAO.reserveCount(sqlSession,memberPk);
	}

	@Override
	public Payment mypagePayment(int reserve_pk) {
		
		return mypageDAO.mypagePayment(sqlSession, reserve_pk);
	}

	@Override
	public int paymentUpdate(int payment_pk) {
		
		return mypageDAO.paymentUpdate(sqlSession, payment_pk);
	}

	@Override
	public Member loginCheck(String memberId) {
		return mypageDAO.loginCheck(sqlSession, memberId);
	}

	@Override
	public String findCheck(int memberPk) {
		return mypageDAO.findCheck(sqlSession, memberPk);
	}

	@Override
	public int delete(int memberPk) {
		return mypageDAO.delete(sqlSession, memberPk);
	}

	@Override
	public String duplicatePwCheck(int parseInt) {
		return mypageDAO.duplicatePwCheck(sqlSession, parseInt);
	}

	@Override
	public int mypagePwUpdate(Member member) {
		return mypageDAO.mypagePwUpdate(sqlSession, member);
	}

	@Override
	public int mypageUpdate(Member m) {
		return mypageDAO.mypageUpdate(sqlSession, m);
	}
	
	@Override
	public List<Bookmark> mypageBookmarkList(int member_pk) {
		return mypageDAO.mypageBookmarkList(sqlSession,member_pk);
	}

	@Override
	public String findReimg(Map map) {
		// TODO Auto-generated method stub
		return mypageDAO.findReimg(sqlSession, map);
	}

}