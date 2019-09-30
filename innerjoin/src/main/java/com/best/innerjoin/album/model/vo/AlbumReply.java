package com.best.innerjoin.album.model.vo;

public class AlbumReply {

	private int arNo;
	private String arContent;
	private String arCreateDate;
	private String arModifyDate;
	private char arStatus;
	private int albumNo;
	private String arWriter;
	private int groupNo;
	
	public AlbumReply() {
		// TODO Auto-generated constructor stub
	}

	public AlbumReply(int arNo, String arContent, String arCreateDate, String arModifyDate, char arStatus, int albumNo,
			String arWriter, int groupNo) {
		super();
		this.arNo = arNo;
		this.arContent = arContent;
		this.arCreateDate = arCreateDate;
		this.arModifyDate = arModifyDate;
		this.arStatus = arStatus;
		this.albumNo = albumNo;
		this.arWriter = arWriter;
		this.groupNo = groupNo;
	}

	public int getArNo() {
		return arNo;
	}

	public void setArNo(int arNo) {
		this.arNo = arNo;
	}

	public String getArContent() {
		return arContent;
	}

	public void setArContent(String arContent) {
		this.arContent = arContent;
	}

	public String getArCreateDate() {
		return arCreateDate;
	}

	public void setArCreateDate(String arCreateDate) {
		this.arCreateDate = arCreateDate;
	}

	public String getArModifyDate() {
		return arModifyDate;
	}

	public void setArModifyDate(String arModifyDate) {
		this.arModifyDate = arModifyDate;
	}

	public char getArStatus() {
		return arStatus;
	}

	public void setArStatus(char arStatus) {
		this.arStatus = arStatus;
	}

	public int getAlbumNo() {
		return albumNo;
	}

	public void setAlbumNo(int albumNo) {
		this.albumNo = albumNo;
	}

	public String getArWriter() {
		return arWriter;
	}

	public void setArWriter(String arWriter) {
		this.arWriter = arWriter;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	@Override
	public String toString() {
		return "AlbumReply [arNo=" + arNo + ", arContent=" + arContent + ", arCreateDate=" + arCreateDate
				+ ", arModifyDate=" + arModifyDate + ", arStatus=" + arStatus + ", albumNo=" + albumNo + ", arWriter="
				+ arWriter + ", groupNo=" + groupNo + "]";
	}
	
	
}
