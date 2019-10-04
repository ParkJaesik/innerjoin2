package com.best.innerjoin.board.model.vo;

import java.sql.Date;

public class Reply {
	private int replyNo;
	private String replyContent;
	private Date replyCreateDate;
	private Date replyModifyDate;
	private char replyStauts;
	private int boardNo;
	private String replyWriter;
	
	public Reply() {}

	public Reply(int replyNo, String replyContent, Date replyCreateDate, Date replyModifyDate, char replyStauts,
			int boardNo, String replyWriter) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyCreateDate = replyCreateDate;
		this.replyModifyDate = replyModifyDate;
		this.replyStauts = replyStauts;
		this.boardNo = boardNo;
		this.replyWriter = replyWriter;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getReplyCreateDate() {
		return replyCreateDate;
	}

	public void setReplyCreateDate(Date replyCreateDate) {
		this.replyCreateDate = replyCreateDate;
	}

	public Date getReplyModifyDate() {
		return replyModifyDate;
	}

	public void setReplyModifyDate(Date replyModifyDate) {
		this.replyModifyDate = replyModifyDate;
	}

	public char getReplyStauts() {
		return replyStauts;
	}

	public void setReplyStauts(char replyStauts) {
		this.replyStauts = replyStauts;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyCreateDate=" + replyCreateDate
				+ ", replyModifyDate=" + replyModifyDate + ", replyStauts=" + replyStauts + ", boardNo=" + boardNo
				+ ", replyWriter=" + replyWriter + "]";
	}
	
}
