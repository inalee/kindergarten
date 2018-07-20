package com.kinder.domain;

public class TeacherVO {
	private String memid;
	private int kincode;
	private String kinname;
	private int tmaster;

	public String getKinname() {
		return kinname;
	}

	public void setKinname(String kinname) {
		this.kinname = kinname;
	}
	
	public String getMemid() {
		return memid;
	}

	public void setMemid(String memid) {
		this.memid = memid;
	}

	public int getKincode() {
		return kincode;
	}

	public void setKincode(int kincode) {
		this.kincode = kincode;
	}

	public int isTmaster() {
		return tmaster;
	}

	public void setTmaster(int tmaster) {
		this.tmaster = tmaster;
	}

	

	
	public TeacherVO(String memid, int kincode, String kinname, int tmaster) {
		super();
		this.memid = memid;
		this.kincode = kincode;
		this.kinname = kinname;
		this.tmaster = tmaster;
	}

	public TeacherVO() {
		
	}
}
