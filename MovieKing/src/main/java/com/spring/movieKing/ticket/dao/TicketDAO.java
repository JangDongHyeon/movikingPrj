package com.spring.movieKing.ticket.dao;

import java.util.List;
import java.util.Map;

import com.spring.movieKing.ticket.dvo.PaymentVO;
import com.spring.movieKing.ticket.dvo.ScheduleVO;
import com.spring.movieKing.ticket.dvo.SeatVO;
import com.spring.movieKing.ticket.dvo.TheaterVO;

public interface TicketDAO {

	List<TheaterVO> getTheaterList(int movieCd);
	List<ScheduleVO> getDateList(int movieCd,int tUid);
	List<SeatVO> getSeatList(int tUid);
	void ticketInsert(int tUid,int schedule_uid,String nm);
	void updateTicket(String nm);
	String ticketUidFind(int tUid,int schedule_uid,String nm);
	void reservationIn(Map<String, Object>reMap);
	void payMentIn(Map<String, Object>payMap);
	List<PaymentVO> payMentList(String user);
}
