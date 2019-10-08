package com.best.innerjoin.board.model.vo;

public class BoardAttachment {
	private int boardAtta;
	private int boardNo;
	private String boardAttaOrigin;
	private String boardAttaRename;
	private char boardAttaStatus;
	
	public BoardAttachment(){}

	public BoardAttachment(int boardAtta, int boardNo, String boardAttaOrigin, String boardAttaRename,
			char boardAttaStatus) {
		super();
		this.boardAtta = boardAtta;
		this.boardNo = boardNo;
		this.boardAttaOrigin = boardAttaOrigin;
		this.boardAttaRename = boardAttaRename;
		this.boardAttaStatus = boardAttaStatus;
	}

	public int getBoardAtta() {
		return boardAtta;
	}

	public void setBoardAtta(int boardAtta) {
		this.boardAtta = boardAtta;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
		return "BoardAttachment [boardAtta=" + boardAtta + ", boardNo=" + boardNo + ", boardAttaOrigin="
				+ boardAttaOrigin + ", boardAttaRename=" + boardAttaRename + ", boardAttaStatus=" + boardAttaStatus
				+ "]";
	}
	
}
