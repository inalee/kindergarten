package com.yebin.domain;

public class CategoryVO {

	private int catecode;
	private String catemain;
	private String catesub;

	public CategoryVO() {
	}

	public CategoryVO(int catecode, String catemain, String catesub) {
		this.catecode = catecode;
		this.catemain = catemain;
		this.catesub = catesub;
	}

	public int getCatecpde() {
		return catecode;
	}

	public void setCatecode(int catecode) {
		this.catecode = catecode;
	}

	public String getCatemain() {
		return catemain;
	}

	public void setCatemain(String catemain) {
		this.catemain = catemain;
	}

	public String getCatesub() {
		return catesub;
	}

	public void setCatesub(String catesub) {
		this.catesub = catesub;
	}

}
