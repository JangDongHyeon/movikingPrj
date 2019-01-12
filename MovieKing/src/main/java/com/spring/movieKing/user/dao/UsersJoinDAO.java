package com.spring.movieKing.user.dao;

import org.springframework.stereotype.Repository;

import com.spring.movieKing.user.dvo.UsersVO;


public interface UsersJoinDAO {
	public Integer usersNameCheck(String username) throws Exception;
	
	public void usersRegister(UsersVO userVO);
	
	
}

