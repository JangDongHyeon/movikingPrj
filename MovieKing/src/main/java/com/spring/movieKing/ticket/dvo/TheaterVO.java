package com.spring.movieKing.ticket.dvo;

public class TheaterVO {
	private int total_seat_number;
	private String theater_name;
	private int theater_uid;
	
	
	public int getTheater_uid() {
		return theater_uid;
	}
	public void setTheater_uid(int theater_uid) {
		this.theater_uid = theater_uid;
	}
	public int getTotal_seat_number() {
		return total_seat_number;
	}
	public void setTotal_seat_number(int total_seat_number) {
		this.total_seat_number = total_seat_number;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	
	
}
