package com.spring.movieKing.ticket.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.spring.movieKing.ticket.dvo.PaymentVO;
import com.spring.movieKing.ticket.dvo.ScheduleVO;
import com.spring.movieKing.ticket.dvo.SeatVO;
import com.spring.movieKing.ticket.dvo.TheaterVO;



public interface TicketService {

	List<TheaterVO> getTheaterList(int movieCd);
	List<ScheduleVO> getDateList(int movieCd,int tUid);
	List<SeatVO> getSeatList(int tUid);
	void ticketInsert(Map<String,Object> map);
	List<PaymentVO> paymentList();
	
}
