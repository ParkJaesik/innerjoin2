package com.best.innerjoin.report.model.vo;

import java.util.Date;

public class GroupMemberReport {
	
	private int rNo;
	private String rContent;
	private int rCategory;
	private String reportId;
	private int reportGNo;
	private String responId;
	private int responGNo;
	private String rStatus;
	private Date rDate;
	private Date rStatusDate;
	
	public GroupMemberReport() {
		// TODO Auto-generated constructor stub
	}

	public GroupMemberReport(int rNo, String rContent, int rCategory, String reportId, int reportGNo, String responId,
			int responGNo, String rStatus, Date rDate, Date rStatusDate) {
		super();
		this.rNo = rNo;
		this.rContent = rContent;
		this.rCategory = rCategory;
		this.reportId = reportId;
		this.reportGNo = reportGNo;
		this.responId = responId;
		this.responGNo = responGNo;
		this.rStatus = rStatus;
		this.rDate = rDate;
		this.rStatusDate = rStatusDate;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public int getrCategory() {
		return rCategory;
	}

	public void setrCategory(int rCategory) {
		this.rCategory = rCategory;
	}

	public String getReportId() {
		return reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}

	public int getReportGNo() {
		return reportGNo;
	}

	public void setReportGNo(int reportGNo) {
		this.reportGNo = reportGNo;
	}

	public String getResponId() {
		return responId;
	}

	public void setResponId(String responId) {
		this.responId = responId;
	}

	public int getResponGNo() {
		return responGNo;
	}

	public void setResponGNo(int responGNo) {
		this.responGNo = responGNo;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public Date getrStatusDate() {
		return rStatusDate;
	}

	public void setrStatusDate(Date rStatusDate) {
		this.rStatusDate = rStatusDate;
	}

	@Override
	public String toString() {
		return "GroupMemberReport [rNo=" + rNo + ", rContent=" + rContent + ", rCategory=" + rCategory + ", reportId="
				+ reportId + ", reportGNo=" + reportGNo + ", responId=" + responId + ", responGNo=" + responGNo
				+ ", rStatus=" + rStatus + ", rDate=" + rDate + ", rStatusDate=" + rStatusDate + "]";
	}


	
	

}
