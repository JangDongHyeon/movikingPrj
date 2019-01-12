package com.spring.movieKing.user.service;

import com.spring.movieKing.user.dvo.UsersVO;

public interface UsersJoinService {
	
	public boolean usersNameCheck(String username) throws Exception;
	
	public void usersRegister(UsersVO usersVO) throws Exception;
	
	
}
