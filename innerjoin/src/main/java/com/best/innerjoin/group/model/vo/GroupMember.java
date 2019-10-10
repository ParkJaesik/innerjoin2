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
	}

	@Override
	public String toString() {
		return "GroupMember [memberId=" + memberId + ", groupNo=" + groupNo + ", levelCode=" + levelCode
				+ ", groupMemReptCount=" + groupMemReptCount + ", memberName=" + memberName + "]";
	}

}
	
