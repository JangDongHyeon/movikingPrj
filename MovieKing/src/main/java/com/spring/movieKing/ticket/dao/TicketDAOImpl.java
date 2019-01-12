package com.spring.movieKing.ticket.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.movieKing.ticket.dvo.PaymentVO;
import com.spring.movieKing.ticket.dvo.ScheduleVO;
import com.spring.movieKing.ticket.dvo.SeatVO;
import com.spring.movieKing.ticket.dvo.TheaterVO;

@Repository
public class TicketDAOImpl implements TicketDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<TheaterVO> getTheaterList(int movieCd) {
		return sqlSession.selectList("ticket.getTheaterList",movieCd);
	}

	@Override
	public List<ScheduleVO> getDateList(int movieCd, int tUid) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<>();
		map.put("movieCd",movieCd);
		map.put("tUid",tUid);
		return sqlSession.selectList("ticket.getDateList",map);
	}

	@Override
	public List<SeatVO> getSeatList(int tUid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ticket.getSeatList",tUid);
	}

	@Override
	public void ticketInsert(int tUid, int schedule_uid, String nm) {
		// TODO Auto-generated method stub
		Map<String,Object> map=new HashMap<>();
		map.put("tUid",tUid);
		map.put("schedule_uid",schedule_uid);
		map.put("nm",nm);
		
		sqlSession.insert("ticket.ticketInsert",map);
	}

	@Override
	public void updateTicket(String nm) {
		// TODO Auto-generated method stub
		sqlSession.update("ticket.updateTicket",nm);
	}

	@Override
	public String ticketUidFind(int tUid, int schedule_uid, String nm) {
		// TODO Auto-generated method stub
		Map<String,Object> map=new HashMap<>();
		map.put("tUid",tUid);
		map.put("schedule_uid",schedule_uid);
		map.put("nm",nm);
		return sqlSession.selectOne("ticket.ticketUidFind",map);
	}

	@Override
	public void reservationIn(Map<String, Object>reMap) {
		// TODO Auto-generated method stub
		reMap.put("size", reMap.size());
		
		sqlSession.insert("ticket.reservationIn",reMap);
		
		
	}

	@Override
	public void payMentIn(Map<String, Object> payMap) {
		// TODO Auto-generated method stub
		sqlSession.insert("ticket.payMentIn",payMap);
	}

	@Override
	public List<PaymentVO> payMentList(String user) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ticket.payMentList",user);
	}

	

}
