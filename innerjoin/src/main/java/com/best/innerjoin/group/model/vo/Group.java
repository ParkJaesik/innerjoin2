package com.best.innerjoin.group.model.vo;

import java.util.Date;

public class Group { // group VO
	
	private int groupNo;
	private String groupHost;
	private String groupOpenStatus;
	private String groupName;
	private int groupLimit;
	private String groupInfo;
	private int groupMemCount;
	private String groupOriginFileName;
	private String groupRenameFileName;
	private Date groupEnrollDate;
	private int localCode;
	private int groupStatusName;
	private int groupCategoryCode;
	private int groupReptCount;
	
	public Group() {
		// TODO Auto-generated constructor stub
	}

	public Group(int groupNo, String groupHost, String groupOpenStatus, String groupName, int groupLimit,
			String groupInfo, int groupMemCount, String groupOriginFileName, String groupRenameFileName,
			Date groupEnrollDate, int localCode, int groupStatusName, int groupCategoryCode, int groupReptCount) {
		super();
		this.groupNo = groupNo;
		this.groupHost = groupHost;
		this.groupOpenStatus = groupOpenStatus;
		this.groupName = groupName;
		this.groupLimit = groupLimit;
		this.groupInfo = groupInfo;
		this.groupMemCount = groupMemCount;
		this.groupOriginFileName = groupOriginFileName;
		this.groupRenameFileName = groupRenameFileName;
		this.groupEnrollDate = groupEnrollDate;
		this.localCode = localCode;
		this.groupStatusName = groupStatusName;
		this.groupCategoryCode = groupCategoryCode;
		this.groupReptCount = groupReptCount;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public String getGroupHost() {
		return groupHost;
	}

	public void setGroupHost(String groupHost) {
		this.groupHost = groupHost;
	}

	public String getGroupOpenStatus() {
		return groupOpenStatus;
	}

	public void setGroupOpenStatus(String groupOpenStatus) {
		this.groupOpenStatus = groupOpenStatus;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public int getGroupLimit() {
		return groupLimit;
	}

	public void setGroupLimit(int groupLimit) {
		this.groupLimit = groupLimit;
	}

	public String getGroupInfo() {
		return groupInfo;
	}

	public void setGroupInfo(String groupInfo) {
		this.groupInfo = groupInfo;
	}

	public int getGroupMemCount() {
		return groupMemCount;
	}

	public void setGroupMemCount(int groupMemCount) {
		this.groupMemCount = groupMemCount;
	}

	public String getGroupOriginFileName() {
		return groupOriginFileName;
	}

	public void setGroupOriginFileName(String groupOriginFileName) {
		this.groupOriginFileName = groupOriginFileName;
	}

	public String getGroupRenameFileName() {
		return groupRenameFileName;
	}

	public void setGroupRenameFileName(String groupRenameFileName) {
		this.groupRenameFileName = groupRenameFileName;
	}

	public Date getGroupEnrollDate() {
		return groupEnrollDate;
	}

	public void setGroupEnrollDate(Date groupEnrollDate) {
		this.groupEnrollDate = groupEnrollDate;
	}

	public int getLocalCode() {
		return localCode;
	}

	public void setLocalCode(int localCode) {
		this.localCode = localCode;
	}

	public int getGroupStatusName() {
		return groupStatusName;
	}

	public void setGroupStatusName(int groupStatusName) {
		this.groupStatusName = groupStatusName;
	}

	public int getGroupCategoryCode() {
		return groupCategoryCode;
	}

	public void setGroupCategoryCode(int groupCategoryCode) {
		this.groupCategoryCode = groupCategoryCode;
	}

	public int getGroupReptCount() {
		return groupReptCount;
	}

	public void setGroupReptCount(int groupReptCount) {
		this.groupReptCount = groupReptCount;
	}

	@Override
	public String toString() {
		return "Group [groupNo=" + groupNo + ", groupHost=" + groupHost + ", groupOpenStatus=" + groupOpenStatus
				+ ", groupName=" + groupName + ", groupLimit=" + groupLimit + ", groupInfo=" + groupInfo
				+ ", groupMemCount=" + groupMemCount + ", groupOriginFileName=" + groupOriginFileName
				+ ", groupRenameFileName=" + groupRenameFileName + ", groupEnrollDate=" + groupEnrollDate
				+ ", localCode=" + localCode + ", groupStatusName=" + groupStatusName + ", groupCategoryCode="
				+ groupCategoryCode + ", groupReptCount=" + groupReptCount + "]";
	}
	
	
	
	
	
	

}
