package com.kh.model.vo;

import java.util.Date;

public class Rent {

		
	private int rentNo;
	private Member memeber;
	private Book book;
	private Date rentDate;
	public Rent() {}
	
	public Rent(int rentNo, Member memeber, Book book, Date rentDate) {
		this.rentNo = rentNo;
		this.memeber = memeber;
		this.book = book;
		this.rentDate = rentDate;
	}
	
	public int getRentNo() {
		return rentNo;
	}
	public void setRentNo(int rentNo) {
		this.rentNo = rentNo;
	}
	public Member getMemeber() {
		return memeber;
	}
	public void setMemeber(Member memeber) {
		this.memeber = memeber;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public Date getRentDate() {
		return rentDate;
	}
	public void setRentDate(Date rentDate) {
		this.rentDate = rentDate;
	}
	@Override
	public String toString() {
		return "Rent [rentNo=" + rentNo + ", memeber=" + memeber + ", book=" + book + ", rentDate=" + rentDate + "]";
	}
	
}
