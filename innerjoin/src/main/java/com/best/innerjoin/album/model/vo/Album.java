package com.best.innerjoin.album.model.vo;

public class Album {

	private int albumNo;
	private char albumStatus;
	private String memberId;
	private int groupNo;
	private String albumCreateDate;
	private String albumModifyDate;
	
	public Album() {
		// TODO Auto-generated constructor stub
	}

	public Album(int albumNo, char albumStatus, String memberId, int groupNo, String albumCreateDate,
			String albumModifyDate) {
		super();
		this.albumNo = albumNo;
		this.albumStatus = albumStatus;
		this.memberId = memberId;
		this.groupNo = groupNo;
		this.albumCreateDate = albumCreateDate;
		this.albumModifyDate = albumModifyDate;
	}

	public int getAlbumNo() {
		return albumNo;
	}

	public void setAlbumNo(int albumNo) {
		this.albumNo = albumNo;
	}

	public char getAlbumStatus() {
		return albumStatus;
	}

	public void setAlbumStatus(char albumStatus) {
		this.albumStatus = albumStatus;
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

	public String getAlbumCreateDate() {
		return albumCreateDate;
	}

	public void setAlbumCreateDate(String albumCreateDate) {
		this.albumCreateDate = albumCreateDate;
	}

	public String getAlbumModifyDate() {
		return albumModifyDate;
	}

	public void setAlbumModifyDate(String albumModifyDate) {
		this.albumModifyDate = albumModifyDate;
	}

	@Override
	public String toString() {
		return "Album [albumNo=" + albumNo + ", albumStatus=" + albumStatus + ", memberId=" + memberId + ", groupNo="
				+ groupNo + ", albumCreateDate=" + albumCreateDate + ", albumModifyDate=" + albumModifyDate + "]";
	}
	
	
}
