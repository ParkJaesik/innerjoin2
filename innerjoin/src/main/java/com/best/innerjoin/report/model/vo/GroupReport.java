package com.best.innerjoin.report.model.vo;

public class GroupReport {

	private int groupReptNo;
	private String groupReptContent;
	private int groupNo;
	private String groupName;
	private String memberId;
	private String groupReptStatus;
	private String groupReptDate;
	
	public GroupReport() {
		// TODO Auto-generated constructor stub
	}

	

	


	public GroupReport(int groupReptNo, String groupReptContent, int groupNo, String groupName, String memberId,
			String groupReptStatus, String groupReptDate) {
		super();
		this.groupReptNo = groupReptNo;
		this.groupReptContent = groupReptContent;
		this.groupNo = groupNo;
		this.groupName = groupName;
		this.memberId = memberId;
		this.groupReptStatus = groupReptStatus;
		this.groupReptDate = groupReptDate;
	}






	public int getGroupReptNo() {
		return groupReptNo;
	}

	public void setGroupReptNo(int groupReptNo) {
		this.groupReptNo = groupReptNo;
	}

	public String getGroupReptContent() {
		return groupReptContent;
	}

	public void setGroupReptContent(String groupReptContent) {
		this.groupReptContent = groupReptContent;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getGroupReptStatus() {
		return groupReptStatus;
	}

	public void setGroupReptStatus(String groupReptStatus) {
		this.groupReptStatus = groupReptStatus;
	}
	
	

	public String getGroupReptDate() {
		return groupReptDate;
	}



	public void setGroupReptDate(String groupReptDate) {
		this.groupReptDate = groupReptDate;
	}


	

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}



	@Override
	public String toString() {
		return "GroupReport [groupReptNo=" + groupReptNo + ", groupReptContent=" + groupReptContent + ", groupNo="
				+ groupNo + ", groupName=" + groupName + ", memberId=" + memberId + ", groupReptStatus="
				+ groupReptStatus + ", groupReptDate=" + groupReptDate + "]";
	}


	
}
