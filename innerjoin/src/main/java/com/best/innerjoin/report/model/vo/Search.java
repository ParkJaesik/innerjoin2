package com.best.innerjoin.report.model.vo;

public class Search {
	
	private String searchSel;
	private String searchText;
	
	public Search() {
		// TODO Auto-generated constructor stub
	}

	public Search(String searchSel, String searchText) {
		super();
		this.searchSel = searchSel;
		this.searchText = searchText;
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

	@Override
	public String toString() {
		return "Search [searchSel=" + searchSel + ", searchText=" + searchText + "]";
	}
	
	
	

}
