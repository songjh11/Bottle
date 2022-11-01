package com.example.demo.util;

import lombok.Data;

@Data
public class Pager {

	
	private Long page;
	private Long perPage=10L;
	private Long startRow;
	
	private String kind;
	private String search;
	
	public String getSearch() {
		if(this.search==null) {
			this.search="";
			return search;
		}
		
		return search;
	}
	
	public void makeRow() {
		this.startRow = (this.getPage()-1)*perPage;
		
	}
	
	
	public Long getPage() {
		if (this.page==null || this.page<1) {
			this.page=1L;
		}
		return this.page;
	}
	
}
