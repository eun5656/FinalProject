package com.kh.spring.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.bookmark.model.vo.Bookmark;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.qna.model.vo.Qna;
import com.kh.spring.reserve.model.vo.Payment;
import com.kh.spring.reserve.model.vo.Reserve;

public interface MypageDAO {
	
	List<Qna> selectList(SqlSessionTemplate sqlSession,int member_pk,int cPage, int numPerPage);

	int selectCount(SqlSessionTemplate sqlSession,int member_pk);
	
	Qna selectOne(SqlSessionTemplate sqlSession,int qna_pk);
	
	List<Reserve> mypageReserveList(SqlSessionTemplate sqlSession, int memberPk,int cPage, int numPerPage);
	
	int reserveCount(SqlSessionTemplate sqlSession, int memberPk);
	
	Payment mypagePayment(SqlSessionTemplate sqlSession,int reserve_pk);
	
	int paymentUpdate(SqlSessionTemplate sqlSession, int payment_pk);

	Member loginCheck(SqlSessionTemplate sqlSession, String memberId);

	int delete(SqlSessionTemplate sqlSession, int memberPk);

	String findCheck(SqlSessionTemplate sqlSession, int memberPk);

	String duplicatePwCheck(SqlSessionTemplate sqlSession, int parseInt);

	int mypagePwUpdate(SqlSessionTemplate sqlSession, Member member);

	int mypageUpdate(SqlSessionTemplate sqlSession, Member m);
	
	List<Bookmark> mypageBookmarkList(SqlSessionTemplate sqlSession, int member_pk);

	String findReimg(SqlSessionTemplate sqlSession, Map map);
	
}