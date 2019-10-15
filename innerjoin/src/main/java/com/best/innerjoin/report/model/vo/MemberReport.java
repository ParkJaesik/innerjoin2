package com.best.innerjoin.report.model.vo;

public class MemberReport {
	private int memReptNo;
	private String memReptContent;
	private String memReptStatus;
	private String reporterId;
	private String reportedId;
	private String memReptDate;
	
	public MemberReport() {
		// TODO Auto-generated constructor stub
	}

	public MemberReport(int memReptNo, String memReptContent, String memReptStatus, String reporterId,
			String reportedId, String memReptDate) {
		super();
		this.memReptNo = memReptNo;
		this.memReptContent = memReptContent;
		this.memReptStatus = memReptStatus;
		this.reporterId = reporterId;
		this.reportedId = reportedId;
		this.memReptDate = memReptDate;
	}



	public int getMemReptNo() {
		return memReptNo;
	}

	public void setMemReptNo(int memReptNo) {
		this.memReptNo = memReptNo;
	}

	public String getMemReptContent() {
		return memReptContent;
	}

	public void setMemReptContent(String memReptContent) {
		this.memReptContent = memReptContent;
	}

	public String getMemReptStatus() {
		return memReptStatus;
	}

	public void setMemReptStatus(String memReptStatus) {
		this.memReptStatus = memReptStatus;
	}

	public String getReporterId() {
		return reporterId;
	}

	public void setReporterId(String reporterId) {
		this.reporterId = reporterId;
	}

	public String getReportedId() {
		return reportedId;
	}

	public void setReportedId(String reportedId) {
		this.reportedId = reportedId;
	}

	
	public String getMemReptDate() {
		return memReptDate;
	}



	public void setMemReptDate(String memReptDate) {
		this.memReptDate = memReptDate;
	}



	@Override
	public String toString() {
		return "MemberReport [memReptNo=" + memReptNo + ", memReptContent=" + memReptContent + ", memReptStatus="
				+ memReptStatus + ", reporterId=" + reporterId + ", reportedId=" + reportedId + ", memReptDate="
				+ memReptDate + "]";
	}

}
