package com.spring.movieKing.user.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.movieKing.home.controller.HomeController;
import com.spring.movieKing.user.dvo.UsersVO;
import com.spring.movieKing.user.service.UsersJoinService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	  private static final String joinPage="user/join";
	  
	  private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	  
	 /* @Autowired
	  private BCryptPasswordEncoder bCryptPasswordEncoder;*/
	  
	  @Autowired
	    private UsersJoinService usersJoinService;
	
	@RequestMapping(value = "/login")
	public String getLogin(Model model, HttpSession session,@RequestParam(value="error",required=false)String error,
			@RequestParam(value="logout",required=false)String logout) {
	
		if(error!=null) {
			model.addAttribute("error","아이디와 비밀번호가 틀립니다");

		}
		if(logout!=null) {
			model.addAttribute("logout","로그아웃이 되었습니다");
		
		}

		return "user/login";
	}
	
    @RequestMapping(value="joinForm", method=RequestMethod.GET)
    public String memberForm(Model model) throws Exception{     
        model.addAttribute("usersVO",new UsersVO());
    	return joinPage;
    }
     
    @RequestMapping(value="join", method=RequestMethod.POST)
    public String memberInsert(@ModelAttribute @Valid UsersVO usersVO, BindingResult bindResult, Model model ) throws Exception{
         // BindingResult   ModelAttribute 을 이용해 매개변수를 Bean 에 binding 할 때 발생한 오류 정보를 받기 위해 선언해야 하는 애노테이션입니다
    	if(bindResult.hasErrors()) {
   
            return joinPage;
        }
         
        //username 중복 체크
        if(usersJoinService.usersNameCheck(usersVO.getUsername())) {
            // 0보다 크면 중복이 존재 true 반환
            logger.info("중복된 아이디 입니다.");
            model.addAttribute("idCheck", "중복된 아이디 입니다." );
            return joinPage;
        }
         
        //비밀번호 체크
        if(!usersVO.passwordCheck()) {
            logger.info("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            model.addAttribute("pwCheck", "비밀번호와 비밀번호 확인이 일치하지 않습니다." );
            return joinPage;
        }
         
        //비밀번호 암오화 작업
        if(StringUtils.hasText(usersVO.getPassword())) {
            //String bCryptString=bCryptPasswordEncoder.encode(usersVO.getPassword());
            usersVO.setPassword(usersVO.getPassword());
        }
     
        usersJoinService.usersRegister(usersVO);
        model.addAttribute("userNameJo",usersVO.getUsername());
        return "redirect:/user/login";
    }
     
	
}
