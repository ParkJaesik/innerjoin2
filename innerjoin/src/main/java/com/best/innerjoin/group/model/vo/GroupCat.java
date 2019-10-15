package com.best.innerjoin.group.model.vo;

public class GroupCat {

	private String groupCatCode;
	private String groupCatName;
	public GroupCat() {
		super();
	}
	public GroupCat(String groupCatCode, String groupCatName) {
		super();
		this.groupCatCode = groupCatCode;
		this.groupCatName = groupCatName;
	}
	public String getGroupCatCode() {
		return groupCatCode;
	}
	public void setGroupCatCode(String groupCatCode) {
		this.groupCatCode = groupCatCode;
	}
	public String getGroupCatName() {
		return groupCatName;
	}
	public void setGroupCatName(String groupCatName) {
		this.groupCatName = groupCatName;
	}
	@Override
	public String toString() {
		return "GroupCat [groupCatCode=" + groupCatCode + ", groupCatName=" + groupCatName + "]";
	}
	
	
}
