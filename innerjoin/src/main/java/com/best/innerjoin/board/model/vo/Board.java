package com.best.innerjoin.board.model.vo;

import java.sql.Date;

public class Board {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private Date boardCreateDate;
	private Date boardModifyDate;
	private char boardStatus;
	private int boardCount;
	private int boardTypeCode;
	private String boardWriter;
	private int groupNo;
	
	public Board() {}

	public Board(int boardNo, String boardTitle, String boardContent, Date boardCreateDate, Date boardModifyDate,
			char boardStatus, int boardCount, int boardTypeCode, String boardWriter, int groupNo) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCreateDate = boardCreateDate;
		this.boardModifyDate = boardModifyDate;
		this.boardStatus = boardStatus;
		this.boardCount = boardCount;
		this.boardTypeCode = boardTypeCode;
		this.boardWriter = boardWriter;
		this.groupNo = groupNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getBoardCreateDate() {
		return boardCreateDate;
	}

	public void setBoardCreateDate(Date boardCreateDate) {
		this.boardCreateDate = boardCreateDate;
	}

	public Date getBoardModifyDate() {
		return boardModifyDate;
	}

	public void setBoardModifyDate(Date boardModifyDate) {
		this.boardModifyDate = boardModifyDate;
	}

	public char getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(char boardStatus) {
		this.boardStatus = boardStatus;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public int getBoardTypeCode() {
		return boardTypeCode;
	}

	public void setBoardTypeCode(int boardTypeCode) {
		this.boardTypeCode = boardTypeCode;
	}

	public String getboardWriter() {
		return boardWriter;
	}

	public void setboardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardCreateDate=" + boardCreateDate + ", boardModifyDate=" + boardModifyDate + ", boardStatus="
				+ boardStatus + ", boardTypeCode=" + boardTypeCode + ", boardWriter=" + boardWriter + ", groupNo=" + groupNo
				+ "]";
	}
	
}
