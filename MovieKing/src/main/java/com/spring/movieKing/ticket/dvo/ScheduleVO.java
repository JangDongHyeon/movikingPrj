package com.spring.movieKing.ticket.dvo;

public class ScheduleVO {
	private String schedule_date;
	private String theater_time;
	private int schedule_uid;
	
	
	public int getSchedule_uid() {
		return schedule_uid;
	}
	public void setSchedule_uid(int schedule_uid) {
		this.schedule_uid = schedule_uid;
	}
	public String getSchedule_date() {
		return schedule_date;
	}
	public void setSchedule_date(String schedule_date) {
		this.schedule_date = schedule_date;
	}
	public String getTheater_time() {
		return theater_time;
	}
	public void setTheater_time(String theater_time) {
		this.theater_time = theater_time;
	}
	
	
}
