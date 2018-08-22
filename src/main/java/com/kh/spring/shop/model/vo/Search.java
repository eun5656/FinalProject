package com.kh.spring.shop.model.vo;

public class Search {
	private String searchType;
	private String searchLocation;
	
	public Search() {
		
	}

	public Search(String searchType, String searchLocation) {
		super();
		this.searchType = searchType;
		this.searchLocation = searchLocation;
	}

	@Override
	public String toString() {
		return "Search [searchType=" + searchType + ", searchLocation=" + searchLocation + "]";
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchLocation() {
		return searchLocation;
	}

	public void setSearchLocation(String searchLocation) {
		this.searchLocation = searchLocation;
	}
	
	
}
