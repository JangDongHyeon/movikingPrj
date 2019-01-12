package com.spring.movieKing.ticket.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.movieKing.ticket.dao.TicketDAOImpl;
import com.spring.movieKing.ticket.dvo.PaymentVO;
import com.spring.movieKing.ticket.dvo.ScheduleVO;
import com.spring.movieKing.ticket.dvo.SeatVO;
import com.spring.movieKing.ticket.dvo.TheaterVO;

@Service
public class TicketServiceImpl implements TicketService {
	
	@Autowired
	private TicketDAOImpl ticketDAO;

	@Override
	public List<TheaterVO> getTheaterList(int movieCd) {
		
		
		return ticketDAO.getTheaterList(movieCd);
		


		
	}

	@Override
	public List<ScheduleVO> getDateList(int movieCd, int tUid) {
		// TODO Auto-generated method stub
		return ticketDAO.getDateList(movieCd,tUid);
	}

	@Override
	public List<SeatVO> getSeatList(int tUid) {
		// TODO Auto-generated method stub
		return ticketDAO.getSeatList(tUid);
	}
	@Override
	public void ticketInsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		String[] st=(String[]) map.get("dataSeat");
		Map<String,Object> reMap=new HashMap<>();
		
		
		int key=1;
		for(String nm:st) {
			//ticket 테이블에 저장
			ticketDAO.ticketInsert((int)map.get("tUid"),(int)map.get("schedule_uid"),nm);
			//seat 테이블에 issue 1로 업데이트 결제된 좌석
			ticketDAO.updateTicket(nm);
			//ticket_uid 가져온다
			reMap.put("ticket"+key,(ticketDAO.ticketUidFind((int)map.get("tUid"),(int)map.get("schedule_uid"),nm)));			
			key++;
		}
		
		//총 티켓 reservation 테이블에 값을 넣는다
		ticketDAO.reservationIn(reMap);
		
		//총 티켓값
		int total=8000*reMap.size();
		//로그인 유저 정보
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	
		
		Map<String,Object> payMap =new HashMap<>();
		payMap.put("total",total);
		payMap.put("user", authentication.getName());
		payMap.put("ticket_uid",reMap.get("ticket1"));
		payMap.put("size", reMap.size());
		ticketDAO.payMentIn(payMap);
		
		
		
	
		
	
	}

	@Override
	public List<PaymentVO> paymentList() {
		// TODO Auto-generated method stub
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		return ticketDAO.payMentList(authentication.getName());
	}	
	
}
