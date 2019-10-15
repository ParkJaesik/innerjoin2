package com.best.innerjoin.mgSearch.model.vo;

public class MgSearch {
	private int districtCode;
	private String districtName;
	private int cityCode;
	private String cityName;
	private int groupCategoryCode;
	private String groupCategoryName;
	private String mgSearch;
	
	public MgSearch() { }

	public MgSearch(int districtCode, String districtName, int cityCode, String cityName, int groupCategoryCode,
			String groupCategoryName, String mgSearch) {
		super();
		this.districtCode = districtCode;
		this.districtName = districtName;
		this.cityCode = cityCode;
		this.cityName = cityName;
		this.groupCategoryCode = groupCategoryCode;
		this.groupCategoryName = groupCategoryName;
		this.mgSearch = mgSearch;
	}

	public int getDistrictCode() {
		return districtCode;
	}

	public void setDistrictCode(int districtCode) {
		this.districtCode = districtCode;
	}

	public String getDistrictName() {
		return districtName;
	}

	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}

	public int getCityCode() {
		return cityCode;
	}

	public void setCityCode(int cityCode) {
		this.cityCode = cityCode;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public int getGroupCategoryCode() {
		return groupCategoryCode;
	}

	public void setGroupCategoryCode(int groupCategoryCode) {
		this.groupCategoryCode = groupCategoryCode;
	}

	public String getGroupCategoryName() {
		return groupCategoryName;
	}

	public void setGroupCategoryName(String groupCategoryName) {
		this.groupCategoryName = groupCategoryName;
	}

	public String getMgSearch() {
		return mgSearch;
	}

	public void setMgSearch(String mgSearch) {
		this.mgSearch = mgSearch;
	}

	@Override
	public String toString() {
		return "MgSearch [districtCode=" + districtCode + ", districtName=" + districtName + ", cityCode=" + cityCode
				+ ", cityName=" + cityName + ", groupCategoryCode=" + groupCategoryCode + ", groupCategoryName="
				+ groupCategoryName + ", mgSearch=" + mgSearch + "]";
	}


	}