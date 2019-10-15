package com.best.innerjoin.group.model.vo;

import java.util.Date;

public class Group { // group VO
	
	private int gNo;
	private String gHost;
	private String gOpenStatus;
	private String gName;
	private int gLimit;
	private String gInfo;
	private int gMemCount;
	private int localCode;
	private int gStatus;
	private int gCategoryCode;
	private String gCategoryName;
	private int gReptCount;
	private String filePath;
	private Date gEnrollDate;
	private Date gModifyDate;
	private String districtName;
	private String cityName;

	public Group() {
	}

	public Group(int gNo, String gHost, String gOpenStatus, String gName, int gLimit, String gInfo, int gMemCount,
			int localCode, int gStatus, int gCategoryCode, String gCategoryName,int gReptCount, String filePath, Date gEnrollDate,
			Date gModifyDate, String districtName,String cityName) {
		super();
		this.gNo = gNo;
		this.gHost = gHost;
		this.gOpenStatus = gOpenStatus;
		this.gName = gName;
		this.gLimit = gLimit;
		this.gInfo = gInfo;
		this.gMemCount = gMemCount;
		this.localCode = localCode;
		this.gStatus = gStatus;
		this.gCategoryCode = gCategoryCode;
		this.gCategoryName = gCategoryName;
		this.gReptCount = gReptCount;
		this.filePath = filePath;
		this.gEnrollDate = gEnrollDate;
		this.gModifyDate = gModifyDate;
		this.districtName = districtName;
		this.cityName = cityName;
	}

	public int getgNo() {
		return gNo;
	}

	public void setgNo(int gNo) {
		this.gNo = gNo;
	}

	public String getgHost() {
		return gHost;
	}

	public void setgHost(String gHost) {
		this.gHost = gHost;
	}

	public String getgOpenStatus() {
		return gOpenStatus;
	}

	public void setgOpenStatus(String gOpenStatus) {
		this.gOpenStatus = gOpenStatus;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public int getgLimit() {
		return gLimit;
	}

	public void setgLimit(int gLimit) {
		this.gLimit = gLimit;
	}

	public String getgInfo() {
		return gInfo;
	}

	public void setgInfo(String gInfo) {
		this.gInfo = gInfo;
	}

	public int getgMemCount() {
		return gMemCount;
	}

	public void setgMemCount(int gMemCount) {
		this.gMemCount = gMemCount;
	}

	public int getLocalCode() {
		return localCode;
	}

	public void setLocalCode(int localCode) {
		this.localCode = localCode;
	}

	public int getgStatus() {
		return gStatus;
	}

	public void setgStatus(int gStatus) {
		this.gStatus = gStatus;
	}

	public int getgCategoryCode() {
		return gCategoryCode;
	}

	public void setgCategoryCode(int gCategoryCode) {
		this.gCategoryCode = gCategoryCode;
	}

	public int getgReptCount() {
		return gReptCount;
	}

	public void setgReptCount(int gReptCount) {
		this.gReptCount = gReptCount;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getgEnrollDate() {
		return gEnrollDate;
	}

	public void setgEnrollDate(Date gEnrollDate) {
		this.gEnrollDate = gEnrollDate;
	}

	public Date getgModifyDate() {
		return gModifyDate;
	}

	public void setgModifyDate(Date gModifyDate) {
		this.gModifyDate = gModifyDate;
	}

	public String getDistrictName() {
		return districtName;
	}

	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}
	
	

	public String getgCategoryName() {
		return gCategoryName;
	}

	public void setgCategoryName(String gCategoryName) {
		this.gCategoryName = gCategoryName;
	}
	
	

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	@Override
	public String toString() {
		return "Group [gNo=" + gNo + ", gHost=" + gHost + ", gOpenStatus=" + gOpenStatus + ", gName=" + gName
				+ ", gLimit=" + gLimit + ", gInfo=" + gInfo + ", gMemCount=" + gMemCount + ", localCode=" + localCode
				+ ", gStatus=" + gStatus + ", gCategoryCode=" + gCategoryCode + ", gCategoryName=" + gCategoryName
				+ ", gReptCount=" + gReptCount + ", filePath=" + filePath + ", gEnrollDate=" + gEnrollDate
				+ ", gModifyDate=" + gModifyDate + ", districtName=" + districtName + ", cityName=" + cityName + "]";
	}

}
