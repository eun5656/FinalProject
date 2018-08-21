package com.kh.spring.mypage.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.bookmark.model.vo.Bookmark;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.qna.model.vo.Qna;
import com.kh.spring.reserve.model.vo.Payment;
import com.kh.spring.reserve.model.vo.Reserve;

@Repository
public class MypageDAOImpl implements MypageDAO {

	@Override
	public List<Qna> selectList(SqlSessionTemplate sqlSession,int member_pk,int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
	      
		return sqlSession.selectList("qna.selectList", member_pk,rb);
	}

	@Override
	public int selectCount(SqlSessionTemplate sqlSession, int member_pk) {
		return sqlSession.selectOne("qna.selectCount",member_pk);
	}

	@Override
	public Qna selectOne(SqlSessionTemplate sqlSession, int qna_pk) {
		return sqlSession.selectOne("qna.selectOneContent",qna_pk);
	}


	@Override
	public List<Reserve> mypageReserveList(SqlSessionTemplate sqlSession, int memberPk,int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("storeReserve.mypageReserveList", memberPk,rb);
	}

	@Override
	public int reserveCount(SqlSessionTemplate sqlSession, int memberPk) {
		
		return sqlSession.selectOne("storeReserve.reserveCount", memberPk);
	}
	
	@Override
	public Member loginCheck(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("member.selectOne", memberId);
	}
	
	@Override
	public String findCheck(SqlSessionTemplate sqlSession, int memberPk) {
		return sqlSession.selectOne("member.selectTwo", memberPk);
	}

	@Override
	public int delete(SqlSessionTemplate sqlSession, int memberPk) {
		return sqlSession.delete("member.deleteMember", memberPk);
	}

	@Override
	public String duplicatePwCheck(SqlSessionTemplate sqlSession, int parseInt) {
		return sqlSession.selectOne("member.selectPwCheck",parseInt);
	}
	
	@Override
	public int mypagePwUpdate(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("member.mypagePwUpdate",member);
	}

	@Override
	public int mypageUpdate(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("member.mypageUpdate", m);
	}

	@Override
	public Payment mypagePayment(SqlSessionTemplate sqlSession, int reserve_pk) {
		
		return sqlSession.selectOne("storeReserve.paymentOne", reserve_pk);
	}

	@Override
	public int paymentUpdate(SqlSessionTemplate sqlSession, int payment_pk) {
		
		return sqlSession.update("storeReserve.paymentUpdate", payment_pk);
	}
	
	@Override
	public List<Bookmark> mypageBookmarkList(SqlSessionTemplate sqlSession, int member_pk/*,int cPage, int numPerPage*/) {
		//RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("bookmark.mypageBookmarkList", member_pk/*,rb*/);
	}

/*	@Override
	public int bookmarkCount(SqlSessionTemplate sqlSession, int member_pk) {
		
		return sqlSession.selectOne("bookmark.bookmarkCount", member_pk);
	}
*/



}