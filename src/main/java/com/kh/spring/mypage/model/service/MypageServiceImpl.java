package com.kh.spring.mypage.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.bookmark.model.vo.Bookmark;
import com.kh.spring.member.model.dao.MemberDAO;
import com.kh.spring.mypage.model.dao.MypageDAO;
import com.kh.spring.qna.model.vo.Qna;
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
	public List<Bookmark> mypageBookmarkList(int member_pk/*,int cPage, int numPerPage*/) {
		
		return mypageDAO.mypageBookmarkList(sqlSession,member_pk/*,cPage,numPerPage*/);
	}

	/*@Override
	public int bookmarkCount(int member_pk) {
		
		return mypageDAO.bookmarkCount(sqlSession,member_pk);
	}
	*/
}