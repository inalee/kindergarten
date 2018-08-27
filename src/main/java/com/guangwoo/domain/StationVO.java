package com.guangwoo.domain;

public class StationVO {

	private Integer kincode;
	private Integer stcode;
	private Integer sdcode=1;
	private Double stx;
	private Double sty;
	private String stname;  
	private String kinname;
	private String carname;
	private String carnum;
	private String svtime;
	
	
	public StationVO() {
		super();
	}


	public StationVO(Integer kincode, Integer stcode, Integer sdcode, Double stx, Double sty,
			String stname, String kinname, String carname, String carnum, String svtime) {
		super();
		this.kincode = kincode;
		this.stcode = stcode;
		this.sdcode = sdcode;
		this.stx = stx;
		this.sty = sty;
		this.stname = stname;
		this.kinname = kinname;
		this.carname = carname;
		this.carnum = carnum;
		this.svtime = svtime;
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


	public Integer getSdcode() {
		return sdcode;
	}


	public void setSdcode(Integer sdcode) {
		this.sdcode = sdcode;
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


	public String getStname() {
		return stname;
	}


	public void setStname(String stname) {
		this.stname = stname;
	}


	public String getKinname() {
		return kinname;
	}


	public void setKinname(String kinname) {
		this.kinname = kinname;
	}


	public String getCarname() {
		return carname;
	}


	public void setCarname(String carname) {
		this.carname = carname;
	}


	public String getCarnum() {
		return carnum;
	}


	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}


	public String getSvtime() {
		return svtime;
	}


	public void setSvtime(String svtime) {
		this.svtime = svtime;
	}


	@Override
	public String toString() {
		return "StationVO [kincode=" + kincode + ", stcode=" + stcode + ", sdcode=" + sdcode
				+ ", stx=" + stx + ", sty=" + sty + ", stname=" + stname + ", kinname=" + kinname
				+ ", carname=" + carname + ", carnum=" + carnum + ", svtime=" + svtime + "]";
	}
	
}
