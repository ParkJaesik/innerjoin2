package com.best.innerjoin.member.model.vo;

public class Member {
	
	private String memberId;
	private String memberPwd;
    private String memberName;
    private String loginWay;
    private String memberModifyDate;
    private String memberEnrollDate;
    private int memberHostCount;
    private int memberJoinCount;
    private int memberReptCount; 
    private String memberProPath;
    private int memberStatusCode;
	private String memberIntoroduce;
	private String memberBirthday;
	private char memberGender;
	private char memberOpenStatus;
	public Member() {
		super();
	}
	
	public Member(String memberId, String memberPwd, String memberName, String loginWay, String memberModifyDate,
			String memberEnrollDate, int memberHostCount, int memberJoinCount, int memberReptCount,
			String memberProPath, int memberStatusCode, String memberIntoroduce, String memberBirthday,
			char memberGender, char memberOpenStatus) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.loginWay = loginWay;
		this.memberModifyDate = memberModifyDate;
		this.memberEnrollDate = memberEnrollDate;
		this.memberHostCount = memberHostCount;
		this.memberJoinCount = memberJoinCount;
		this.memberReptCount = memberReptCount;
		this.memberProPath = memberProPath;
		this.memberStatusCode = memberStatusCode;
		this.memberIntoroduce = memberIntoroduce;
		this.memberBirthday = memberBirthday;
		this.memberGender = memberGender;
		this.memberOpenStatus = memberOpenStatus;
	}

	public Member(String memberId, String memberPwd, String memberName, String loginWay, String memberModifyDate,
			String memberEnrollDate, int memberHostCount, int memberJoinCount, int memberReptCount,
			String memberProPath, int memberStatusCode) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.loginWay = loginWay;
		this.memberModifyDate = memberModifyDate;
		this.memberEnrollDate = memberEnrollDate;
		this.memberHostCount = memberHostCount;
		this.memberJoinCount = memberJoinCount;
		this.memberReptCount = memberReptCount;
		this.memberProPath = memberProPath;
		this.memberStatusCode = memberStatusCode;
	
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getLoginWay() {
		return loginWay;
	}
	public void setLoginWay(String loginWay) {
		this.loginWay = loginWay;
	}
	public String getMemberModifyDate() {
		return memberModifyDate;
	}
	public void setMemberModifyDate(String memberModifyDate) {
		this.memberModifyDate = memberModifyDate;
	}
	public String getMemberEnrollDate() {
		return memberEnrollDate;
	}
	public void setMemberEnrollDate(String memberEnrollDate) {
		this.memberEnrollDate = memberEnrollDate;
	}
	public int getMemberHostCount() {
		return memberHostCount;
	}
	public void setMemberHostCount(int memberHostCount) {
		this.memberHostCount = memberHostCount;
	}
	public int getMemberJoinCount() {
		return memberJoinCount;
	}
	public void setMemberJoinCount(int memberJoinCount) {
		this.memberJoinCount = memberJoinCount;
	}
	public int getMemberReptCount() {
		return memberReptCount;
	}
	public void setMemberReptCount(int memberReptCount) {
		this.memberReptCount = memberReptCount;
	}
	public String getMemberProPath() {
		return memberProPath;
	}
	public void setMemberProPath(String memberProPath) {
		this.memberProPath = memberProPath;
	}
	public int getMemberStatusCode() {
		return memberStatusCode;
	}
	public void setMemberStatusCode(int memberStatusCode) {
		this.memberStatusCode = memberStatusCode;
	}
	
	public String getMemberIntoroduce() {
		return memberIntoroduce;
	}

	public void setMemberIntoroduce(String memberIntoroduce) {
		this.memberIntoroduce = memberIntoroduce;
	}

	public String getMemberBirthday() {
		return memberBirthday;
	}

	public void setMemberBirthday(String memberBirthday) {
		this.memberBirthday = memberBirthday;
	}

	public char getMemberGender() {
		return memberGender;
	}

	public void setMemberGender(char memberGender) {
		this.memberGender = memberGender;
	}

	public char getMemberOpenStatus() {
		return memberOpenStatus;
	}

	public void setMemberOpenStatus(char memberOpenStatus) {
		this.memberOpenStatus = memberOpenStatus;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName=" + memberName
				+ ", loginWay=" + loginWay + ", memberModifyDate=" + memberModifyDate + ", memberEnrollDate="
				+ memberEnrollDate + ", memberHostCount=" + memberHostCount + ", memberJoinCount=" + memberJoinCount
				+ ", memberReptCount=" + memberReptCount + ", memberProPath=" + memberProPath + ", memberStatusCode="
				+ memberStatusCode + ", memberIntoroduce=" + memberIntoroduce + ", memberBirthday=" + memberBirthday
				+ ", memberGender=" + memberGender + ", memberOpenStatus=" + memberOpenStatus + "]";
	}
	
    

}
