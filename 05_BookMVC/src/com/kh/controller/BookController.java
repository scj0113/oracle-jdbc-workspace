package com.kh.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import com.kh.model.dao.BookDAO;
import com.kh.model.vo.Book;
import com.kh.model.vo.Member;
import com.kh.model.vo.Rent;

public class BookController {

	private BookDAO dao = new BookDAO();
	private Member member = new Member();
	
	public ArrayList<Book> printBookAll(){
	    ArrayList<Book> bookList = null;
		
	    try {
	        bookList = dao.printBookAll();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		
	    return bookList;
	}
	
	public boolean registerBook(Book book) {
		
	
		
		try {
			ArrayList<Book> bookList = dao.printBookAll();
			
			dao.registerBook(book);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		return false;
		
		
	}
	
	public boolean sellBook(int no) {
		
		
		try {
			dao.sellBook(no);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return false;
		
	}
	
	public boolean registerMember(Member member) {

		try {
			dao.registerMember(member);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
		
	}
	
	
	public Member login(String id, String password) {
		
		Member m = new Member();
		m.setMemberId(id);
		m.setMemberPwd(password);;		
			try {
				Member result = dao.login(id, password);
				if (result != null) { 
					return m;
			}} catch (SQLException e) {
				e.printStackTrace();
			}
		
		return null;
		
	}
	
	public boolean deleteMember() {                           // update 쓰기
		return false;
		
	}
	
	public boolean rentBook(int no) {
		return false;
		
	}
	
	public boolean deleteRent(int no) {
		return false;
		
	}
	
	public ArrayList<Rent> printRentBook(){
		return null;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
}



















