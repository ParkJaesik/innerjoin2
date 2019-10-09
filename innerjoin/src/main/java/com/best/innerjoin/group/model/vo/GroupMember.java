package com.best.innerjoin.group.model.vo;

public class GroupMember {


	private String memberId;
	private int groupNo;
	private int levelCode;
	private int groupMemReptCount;
	private String memberName;
	
	public GroupMember() {}

	public GroupMember(String memberId, int groupNo, int levelCode, int groupMemReptCount, String memberName) {
		super();
		this.memberId = memberId;
		this.groupNo = groupNo;
		this.levelCode = levelCode;
		this.groupMemReptCount = groupMemReptCount;
		this.memberName = memberName;
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


	public int getGroupMemReptCount() {
		return groupMemReptCount;
	}

	public void setGroupMemReptCount(int groupMemReptCount) {
		this.groupMemReptCount = groupMemReptCount;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;

	public int getgMemRCount() {
		return gMemRCount;
	}

	public void setgMemRCount(int gMemRCount) {
		this.gMemRCount = gMemRCount;

	}

	@Override
	public String toString() {

		return "GroupMember [memberId=" + memberId + ", groupNo=" + groupNo + ", levelCode=" + levelCode
				+ ", groupMemReptCount=" + groupMemReptCount + ", memberName=" + memberName + "]";
	}
	
	

		return "GroupMember [gmemberId=" + gmemberId + ", gNo=" + gNo + ", levelCode=" + levelCode + ", gMemRCount="
				+ gMemRCount + "]";
	}
	
	
	
}
