package com.kh.spring.message.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.message.model.vo.Message;

@Repository
public class MessageDAOImpl implements MessageDAO {

	@Override
	public int CheckId(SqlSessionTemplate sqlSession, String receive_user) {
		System.out.println(receive_user);
		return sqlSession.selectOne("message.selectCheck",receive_user);
	}

	@Override
	public int insertMsg(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		
		return sqlSession.insert("message.insertMsg", map);
	}

	@Override
	public List<Message> selectList(SqlSessionTemplate sqlSession,String send_user,int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
	      
		return sqlSession.selectList("message.selectList", send_user,rb);
	}

	@Override
	public List<Message> selectList2(SqlSessionTemplate sqlSession, String receive_user,int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("message.selectList2", receive_user,rb);
	}

	@Override
	public Message selectOne(SqlSessionTemplate sqlSession, int message_pk) {
		return sqlSession.selectOne("message.selectOne", message_pk);
	}

	@Override
	public int update(SqlSessionTemplate sqlSession, int message_pk) {
		return sqlSession.update("message.update", message_pk);
	}

	@Override
	public int delete(SqlSessionTemplate sqlSession, int message_pk) {
		
		return sqlSession.delete("message.delete", message_pk);
	}

	@Override
	public int selectCount(SqlSessionTemplate sqlSession,String send_user) {
		
		return sqlSession.selectOne("message.selectCount",send_user);
	}

	@Override
	public int selectCount2(SqlSessionTemplate sqlSession, String receive_user) {
		return sqlSession.selectOne("message.selectCount2",receive_user);
	}

}
