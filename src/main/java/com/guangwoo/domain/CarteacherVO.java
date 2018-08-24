package com.guangwoo.domain;

public class CarteacherVO {

	private Integer kincode;
	private Integer carcode;
	private String kinname;
	private String carname;
	private String memname;
	private String memid;
	
	
	public CarteacherVO() {
		super();
	}


	public CarteacherVO(Integer kincode, Integer carcode, String kinname, String carname, String memname,
			String memid) {
		super();
		this.kincode = kincode;
		this.carcode = carcode;
		this.kinname = kinname;
		this.carname = carname;
		this.memname = memname;
		this.memid = memid;
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


	public String getMemid() {
		return memid;
	}


	public void setMemid(String memid) {
		this.memid = memid;
	}


	@Override
	public String toString() {
		return "CarteacherVO [kincode=" + kincode + ", carcode=" + carcode + ", kinname=" + kinname + ", carname="
				+ carname + ", memname=" + memname + ", memid=" + memid + "]";
	}
	
	

}
