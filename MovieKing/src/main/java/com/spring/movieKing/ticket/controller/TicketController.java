package com.spring.movieKing.ticket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.movieKing.ticket.dvo.ScheduleVO;
import com.spring.movieKing.ticket.dvo.SeatVO;
import com.spring.movieKing.ticket.dvo.TheaterVO;
import com.spring.movieKing.ticket.service.TicketService;

@Controller
@RequestMapping("/ticket")
public class TicketController {

	private static final Logger logger = LoggerFactory.getLogger(TicketController.class);
	
	@Autowired
	private TicketService ticketService;
	
	@RequestMapping(value = {"/", "/main"}, method = RequestMethod.GET)
	public String main(@RequestParam(value="movieCd",required=false)String movieCd,Model model) {
		model.addAttribute("movieCd",movieCd);
		return "ticket/main";
	}
	
	@RequestMapping(value = "/theaterList/{movieCd}", method=RequestMethod.GET)
	@ResponseBody
	public List<TheaterVO> getTheaterList(@PathVariable("movieCd")int movieCd) {
		
		return ticketService.getTheaterList(movieCd);
	}
	
	@RequestMapping(value = "/dateList/{movieCd}/{tUid}", method=RequestMethod.GET)
	@ResponseBody
	public List<ScheduleVO> getDateList(@PathVariable("movieCd")int movieCd,@PathVariable("tUid")int tUid) {
		
		return ticketService.getDateList(movieCd,tUid);
	}
	@RequestMapping(value="/seatList/{tUid}",method=RequestMethod.GET)
	@ResponseBody
	public List<SeatVO> getSeatList(@PathVariable("tUid")int tUid) {
		
		return ticketService.getSeatList(tUid);
	}
	
	@RequestMapping(value="/ticketInsert",method=RequestMethod.POST)
	public String ticketInsert(@RequestParam("tUid")int tUid,@RequestParam("schedule_uid")int schedule_uid,
			@RequestParam("dataSeat")String[] dataSeat) {
				System.out.println("dataSeat"+dataSeat[0]);
				System.out.println("tUid"+tUid);
				System.out.println("schedule_uid"+schedule_uid);
				
				Map<String, Object> map=new HashMap<>();
				map.put("tUid",tUid);
				map.put("schedule_uid", schedule_uid);
				map.put("dataSeat", dataSeat);
				ticketService.ticketInsert(map);
				
				return "redirect:/";
		
	}
	@RequestMapping(value="/buyTicket")
	public String buyTicket(Model model) {
		model.addAttribute("payList",ticketService.paymentList());
		return "ticket/ticketUser";
	}
	
}
