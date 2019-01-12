package com.spring.movieKing.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.movieKing.user.dvo.UsersVO;
@Repository
public class UserJoinDAOImpl implements UsersJoinDAO {

	 @Autowired
	    private SqlSession sqlSession;
	
	@Override
	public Integer usersNameCheck(String username) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("users.usersNameCheck",username);
	}

	@Override
	public void usersRegister(UsersVO userVO) {
		// TODO Auto-generated method stub
		sqlSession.update("users.usersRegister",userVO);

	}

}
