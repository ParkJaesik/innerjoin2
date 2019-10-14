package com.best.innerjoin.report.model.vo;

public class Search {
	
	// 신고 게시글 
	private String searchSel;
	private String searchText;
	
	// 신고 회원
	private String searchReptSel;
	private String searchReptText;
	
	public Search() {
		// TODO Auto-generated constructor stub
	}

	public Search(String searchSel, String searchText, String searchReptSel, String searchReptText) {
		super();
		this.searchSel = searchSel;
		this.searchText = searchText;
		this.searchReptSel = searchReptSel;
		this.searchReptText = searchReptText;
	}

	public String getSearchSel() {
		return searchSel;
	}

	public void setSearchSel(String searchSel) {
		this.searchSel = searchSel;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public String getSearchReptSel() {
		return searchReptSel;
	}

	public void setSearchReptSel(String searchReptSel) {
		this.searchReptSel = searchReptSel;
	}

	public String getSearchReptText() {
		return searchReptText;
	}

	public void setSearchReptText(String searchReptText) {
		this.searchReptText = searchReptText;
	}

	@Override
	public String toString() {
		return "Search [searchSel=" + searchSel + ", searchText=" + searchText + ", searchReptSel=" + searchReptSel
				+ ", searchReptText=" + searchReptText + "]";
	}
	
	
	

}
