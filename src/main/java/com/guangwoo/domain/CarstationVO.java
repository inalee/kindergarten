package com.guangwoo.domain;

public class CarstationVO {

	private Integer kincode;
	private String kinname;
	private String stname;
	private Double stx;
	private Double sty;
	
	
	public CarstationVO() {
		super();
	}


	public CarstationVO(Integer kincode, String kinname, String stname, Double stx, Double sty) {
		super();
		this.kincode = kincode;
		this.kinname = kinname;
		this.stname = stname;
		this.stx = stx;
		this.sty = sty;
	}


	public Integer getKincode() {
		return kincode;
	}


	public void setKincode(Integer kincode) {
		this.kincode = kincode;
	}


	public String getKinname() {
		return kinname;
	}


	public void setKinname(String kinname) {
		this.kinname = kinname;
	}


	public String getStname() {
		return stname;
	}


	public void setStname(String stname) {
		this.stname = stname;
	}


	public Double getStx() {
		return stx;
	}


	public void setStx(Double stx) {
		this.stx = stx;
	}


	public Double getSty() {
		return sty;
	}


	public void setSty(Double sty) {
		this.sty = sty;
	}


	@Override
	public String toString() {
		return "CarstationVO [kincode=" + kincode + ", kinname=" + kinname + ", stname=" + stname + ", stx=" + stx
				+ ", sty=" + sty + "]";
	}


}
