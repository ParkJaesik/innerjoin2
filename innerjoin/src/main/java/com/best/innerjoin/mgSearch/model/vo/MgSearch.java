package com.best.innerjoin.mgSearch.model.vo;

public class MgSearch {
	private int districtCode;
	private String districtName;
	private int cityCode;
	private String cityName;
	
	public MgSearch() { }
	
	public MgSearch(int districtCode, String districtName, int cityCode, String cityName) {
		super();
		this.districtCode = districtCode;
		this.districtName = districtName;
		this.cityCode = cityCode;
		this.cityName = cityName;
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

	@Override
	public String toString() {
		return "MgSearch [districtCode=" + districtCode + ", districtName=" + districtName + ", cityCode=" + cityCode
				+ ", cityName=" + cityName + "]";
	}
	
	
	

}
