package com.best.innerjoin.group.model.vo;

public class GroupMember {
	
	private String gmemberId;
	private int gNo;
	private int levelCode;
	private int gMemRCount;
	
	public GroupMember() {
		// TODO Auto-generated constructor stub
	}

	public GroupMember(String gmemberId, int gNo, int levelCode, int gMemRCount) {
		super();
		this.gmemberId = gmemberId;
		this.gNo = gNo;
		this.levelCode = levelCode;
		this.gMemRCount = gMemRCount;
	}

	public String getGmemberId() {
		return gmemberId;
	}

	public void setGmemberId(String gmemberId) {
		this.gmemberId = gmemberId;
	}

	public int getgNo() {
		return gNo;
	}

	public void setgNo(int gNo) {
		this.gNo = gNo;
	}

	public int getLevelCode() {
		return levelCode;
	}

	public void setLevelCode(int levelCode) {
		this.levelCode = levelCode;
	}

	public int getgMemRCount() {
		return gMemRCount;
	}

	public void setgMemRCount(int gMemRCount) {
		this.gMemRCount = gMemRCount;
	}

	@Override
	public String toString() {
		return "GroupMember [gmemberId=" + gmemberId + ", gNo=" + gNo + ", levelCode=" + levelCode + ", gMemRCount="
				+ gMemRCount + "]";
	}
	
	
	

}
