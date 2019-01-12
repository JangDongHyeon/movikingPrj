package com.spring.movieKing.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.movieKing.user.dao.UserJoinDAOImpl;
import com.spring.movieKing.user.dao.UsersJoinDAO;
import com.spring.movieKing.user.dvo.UsersVO;
@Service
public class UserJoinServiceImpl implements UsersJoinService {

	@Autowired
	private UsersJoinDAO usersJoinDAO;
	
	@Override
	public boolean usersNameCheck(String username) throws Exception {
		 boolean isCheck=false;
	        int check=usersJoinDAO.usersNameCheck(username);
	        // 0보다 크면 중복이 존재 true 반환
	        if(check>0) {
	            isCheck=true;
	        }else {
	            // 0이면 중복 없음.
	            isCheck=false;
	        }
	        return isCheck;
	}

	@Override
	public void usersRegister(UsersVO usersVO) throws Exception {
		// TODO Auto-generated method stub
		usersJoinDAO.usersRegister(usersVO);   

	}

}
