package com.youtube.model.vo;

import java.util.Date;

public class CommentLike {

	private int commentLikeCode;
	private Date commentLikeDate;
	
	private VideoComment comment;
	private Member member;
	public CommentLike() {
	}
	public CommentLike(int commentLikeCode, Date commentLikeDate, VideoComment comment, Member member) {
		super();
		this.commentLikeCode = commentLikeCode;
		this.commentLikeDate = commentLikeDate;
		this.comment = comment;
		this.member = member;
	}
	public int getCommentLikeCode() {
		return commentLikeCode;
	}
	public void setCommentLikeCode(int commentLikeCode) {
		this.commentLikeCode = commentLikeCode;
	}
	public Date getCommentLikeDate() {
		return commentLikeDate;
	}
	public void setCommentLikeDate(Date commentLikeDate) {
		this.commentLikeDate = commentLikeDate;
	}
	public VideoComment getComment() {
		return comment;
	}
	public void setComment(VideoComment comment) {
		this.comment = comment;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	@Override
	public String toString() {
		return "CommentLike [commentLikeCode=" + commentLikeCode + ", commentLikeDate=" + commentLikeDate + ", comment="
				+ comment + ", member=" + member + "]";
	}
	
}
