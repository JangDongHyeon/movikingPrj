package com.spring.movieKing.ticket.dvo;

public class PaymentVO {
	private int payment_uid;
	private int total_price;
	private String payment_option;
	private String payment_date;
	private int total_ticket;
	private int issue;
	
	
	
	
	public int getPayment_uid() {
		return payment_uid;
	}
	public void setPayment_uid(int payment_uid) {
		this.payment_uid = payment_uid;
	}
	public int getIssue() {
		return issue;
	}
	public void setIssue(int issue) {
		this.issue = issue;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getPayment_option() {
		return payment_option;
	}
	public void setPayment_option(String payment_option) {
		this.payment_option = payment_option;
	}
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	public int getTotal_ticket() {
		return total_ticket;
	}
	public void setTotal_ticket(int total_ticket) {
		this.total_ticket = total_ticket;
	}
	
	
}
