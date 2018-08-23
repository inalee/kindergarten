package com.guangwoo.domain;

public class ScheduleVO {

	private Integer kincode;
	private Integer carcode;
	private Integer ccode;
	private Double stx;
	private Double sty;
	private String kinname;
	private String carname;
	private String memname;
	private String svtime;
	private String stname;
	private String cname;
	
	public ScheduleVO() {
		super();
	}

	public ScheduleVO(Integer kincode, Integer carcode, Integer ccode, Double stx, Double sty,
			String kinname, String carname, String memname, String svtime, String stname,
			String cname) {
		super();
		this.kincode = kincode;
		this.carcode = carcode;
		this.ccode = ccode;
		this.stx = stx;
		this.sty = sty;
		this.kinname = kinname;
		this.carname = carname;
		this.memname = memname;
		this.svtime = svtime;
		this.stname = stname;
		this.cname = cname;
	}

	public Integer getKincode() {
		return kincode;
	}

	public void setKincode(Integer kincode) {
		this.kincode = kincode;
	}

	public Integer getCarcode() {
		return carcode;
	}

	public void setCarcode(Integer carcode) {
		this.carcode = carcode;
	}

	public Integer getCcode() {
		return ccode;
	}

	public void setCcode(Integer ccode) {
		this.ccode = ccode;
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

	public String getMemname() {
		return memname;
	}

	public void setMemname(String memname) {
		this.memname = memname;
	}

	public String getSvtime() {
		return svtime;
	}

	public void setSvtime(String svtime) {
		this.svtime = svtime;
	}

	public String getStname() {
		return stname;
	}

	public void setStname(String stname) {
		this.stname = stname;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	@Override
	public String toString() {
		return "scheduleVO [kincode=" + kincode + ", carcode=" + carcode + ", ccode=" + ccode
				+ ", stx=" + stx + ", sty=" + sty + ", kinname=" + kinname + ", carname=" + carname
				+ ", memname=" + memname + ", svtime=" + svtime + ", stname=" + stname + ", cname="
				+ cname + "]";
	}
	
}
