package com.guangwoo.domain;

public class CarstationVO {

	private Integer kincode;
	private Integer stcode;
	private String kinname;
	private String stname;
	
	public CarstationVO() {
		super();
	}

	public CarstationVO(Integer kincode, Integer stcode, String kinname, String stname) {
		super();
		this.kincode = kincode;
		this.stcode = stcode;
		this.kinname = kinname;
		this.stname = stname;
	}

	public Integer getKincode() {
		return kincode;
	}

	public void setKincode(Integer kincode) {
		this.kincode = kincode;
	}

	public Integer getStcode() {
		return stcode;
	}

	public void setStcode(Integer stcode) {
		this.stcode = stcode;
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

	@Override
	public String toString() {
		return "CarstationVO [kincode=" + kincode + ", stcode=" + stcode + ", kinname=" + kinname + ", stname=" + stname
				+ "]";
	}



}
