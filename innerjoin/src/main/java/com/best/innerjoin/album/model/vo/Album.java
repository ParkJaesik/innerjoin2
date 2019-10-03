package com.best.innerjoin.album.model.vo;

public class Album {

	private int albumNo;
	private String albumTitle;
	private char albumStatus;
	private String memberId;
	private int groupNo;
	private String albumCreateDate;
	private String albumModifyDate;
	private String albumThumbnail;
	
	public Album() {
		// TODO Auto-generated constructor stub
	}

	
	public Album(int albumNo, String albumTitle, char albumStatus, String memberId, int groupNo, String albumCreateDate,
			String albumModifyDate, String albumThumbnail) {
		super();
		this.albumNo = albumNo;
		this.albumTitle = albumTitle;
		this.albumStatus = albumStatus;
		this.memberId = memberId;
		this.groupNo = groupNo;
		this.albumCreateDate = albumCreateDate;
		this.albumModifyDate = albumModifyDate;
		this.albumThumbnail = albumThumbnail;
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
	

	public String getAlbumTitle() {
		return albumTitle;
	}



	public void setAlbumTitle(String albumTitle) {
		this.albumTitle = albumTitle;
	}

	
	public String getAlbumThumbnail() {
		return albumThumbnail;
	}


	public void setAlbumThumbnail(String albumThumbnail) {
		this.albumThumbnail = albumThumbnail;
	}


	@Override
	public String toString() {
		return "Album [albumNo=" + albumNo + ", albumTitle=" + albumTitle + ", albumStatus=" + albumStatus
				+ ", memberId=" + memberId + ", groupNo=" + groupNo + ", albumCreateDate=" + albumCreateDate
				+ ", albumModifyDate=" + albumModifyDate + ", albumThumbnail=" + albumThumbnail + "]";
	}


	
}
