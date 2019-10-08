package com.best.innerjoin.board.model.vo;

import java.sql.Date;

/**
 * @author user1
 *
 */
public class Board {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private Date boardCreateDate;
	private Date boardModifyDate;
	private char boardStatus;
	private int boardCount;
	private int boardTypeCode;
	private String memberId;
	private int groupNo;
	private String memberName;
	private int boardAtta;
	private String boardAttaOrigin;
	private String boardAttaRename;
	private char boardAttaStatus;
	
	public Board() {}

	public Board(int boardNo, String boardTitle, String boardContent, Date boardCreateDate, Date boardModifyDate,
			char boardStatus, int boardCount, int boardTypeCode, String memberId, int groupNo, String memberName) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCreateDate = boardCreateDate;
		this.boardModifyDate = boardModifyDate;
		this.boardStatus = boardStatus;
		this.boardCount = boardCount;
		this.boardTypeCode = boardTypeCode;
		this.memberId = memberId;
		this.groupNo = groupNo;
		this.memberName = memberName;
	}
	
	public Board(int boardNo, String boardTitle, String boardContent, Date boardCreateDate, Date boardModifyDate,
			char boardStatus, int boardCount, int boardTypeCode, String memberId, int groupNo, String memberName,
			int boardAtta, String boardAttaOrigin, String boardAttaRename, char boardAttaStatus) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCreateDate = boardCreateDate;
		this.boardModifyDate = boardModifyDate;
		this.boardStatus = boardStatus;
		this.boardCount = boardCount;
		this.boardTypeCode = boardTypeCode;
		this.memberId = memberId;
		this.groupNo = groupNo;
		this.memberName = memberName;
		this.boardAtta = boardAtta;
		this.boardAttaOrigin = boardAttaOrigin;
		this.boardAttaRename = boardAttaRename;
		this.boardAttaStatus = boardAttaStatus;
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

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
	public int getBoardAtta() {
		return boardAtta;
	}

	public void setBoardAtta(int boardAtta) {
		this.boardAtta = boardAtta;
	}

	public String getBoardAttaOrigin() {
		return boardAttaOrigin;
	}

	public void setBoardAttaOrigin(String boardAttaOrigin) {
		this.boardAttaOrigin = boardAttaOrigin;
	}

	public String getBoardAttaRename() {
		return boardAttaRename;
	}

	public void setBoardAttaRename(String boardAttaRename) {
		this.boardAttaRename = boardAttaRename;
	}

	public char getBoardAttaStatus() {
		return boardAttaStatus;
	}

	public void setBoardAttaStatus(char boardAttaStatus) {
		this.boardAttaStatus = boardAttaStatus;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardCreateDate=" + boardCreateDate + ", boardModifyDate=" + boardModifyDate + ", boardStatus="
				+ boardStatus + ", boardCount=" + boardCount + ", boardTypeCode=" + boardTypeCode + ", memberId="
				+ memberId + ", groupNo=" + groupNo + ", memberName=" + memberName + "]";
	}

}
