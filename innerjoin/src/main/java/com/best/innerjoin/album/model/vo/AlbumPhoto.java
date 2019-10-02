package com.best.innerjoin.album.model.vo;

public class AlbumPhoto {

	private int photoNo;
	private String photoCreateDate;
	private String photoModifyDate;
	private String photoOriginName;
	private String photoRename;
	private int albumNo;
	
	public AlbumPhoto() {
		// TODO Auto-generated constructor stub
	}

	public AlbumPhoto(int photoNo, String photoCreateDate, String photoModifyDate, String photoOriginName,
			String photoRename, int albumNo) {
		super();
		this.photoNo = photoNo;
		this.photoCreateDate = photoCreateDate;
		this.photoModifyDate = photoModifyDate;
		this.photoOriginName = photoOriginName;
		this.photoRename = photoRename;
		this.albumNo = albumNo;
	}

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}

	public String getPhotoCreateDate() {
		return photoCreateDate;
	}

	public void setPhotoCreateDate(String photoCreateDate) {
		this.photoCreateDate = photoCreateDate;
	}

	public String getPhotoModifyDate() {
		return photoModifyDate;
	}

	public void setPhotoModifyDate(String photoModifyDate) {
		this.photoModifyDate = photoModifyDate;
	}

	public String getPhotoOriginName() {
		return photoOriginName;
	}

	public void setPhotoOriginName(String photoOriginName) {
		this.photoOriginName = photoOriginName;
	}

	public String getPhotoRename() {
		return photoRename;
	}

	public void setPhotoRename(String photoRename) {
		this.photoRename = photoRename;
	}

	public int getAlbumNo() {
		return albumNo;
	}

	public void setAlbumNo(int albumNo) {
		this.albumNo = albumNo;
	}

	@Override
	public String toString() {
		return "AlbumPhoto [photoNo=" + photoNo + ", photoCreateDate=" + photoCreateDate + ", photoModifyDate="
				+ photoModifyDate + ", photoOriginName=" + photoOriginName + ", photoRename=" + photoRename
				+ ", albumNo=" + albumNo + "]";
	}
	
	
}
