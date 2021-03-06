package com.best.innerjoin.board.model.vo;

import java.sql.Date;

public class Reply {
	private int replyNo;
	private String replyContent;
	private String replyCreateDate;
	private String replyModifyDate;
	private char replyStatus;
	private int boardNo;
	private String memberId;
	private String memberName;
	private int groupNo;
	
	public Reply() {}

	public Reply(int replyNo, String replyContent, String replyCreateDate, String replyModifyDate, char replyStatus,
			int boardNo, String memberId, String memberName, int groupNo) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyCreateDate = replyCreateDate;
		this.replyModifyDate = replyModifyDate;
		this.replyStatus = replyStatus;
		this.boardNo = boardNo;
		this.memberId = memberId;
		this.memberName = memberName;
		this.groupNo = groupNo;
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

	public String getReplyCreateDate() {
		return replyCreateDate;
	}

	public void setReplyCreateDate(String replyCreateDate) {
		this.replyCreateDate = replyCreateDate;
	}

	public String getReplyModifyDate() {
		return replyModifyDate;
	}

	public void setReplyModifyDate(String replyModifyDate) {
		this.replyModifyDate = replyModifyDate;
	}

	public char getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(char replyStatus) {
		this.replyStatus = replyStatus;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyCreateDate=" + replyCreateDate
				+ ", replyModifyDate=" + replyModifyDate + ", replyStatus=" + replyStatus + ", boardNo=" + boardNo
				+ ", memberId=" + memberId + ", memberName=" + memberName + ", groupNo=" + groupNo + "]";
	}
	
}