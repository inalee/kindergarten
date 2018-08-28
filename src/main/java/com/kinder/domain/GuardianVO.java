package com.kinder.domain;

public class GuardianVO {

	private int gcode;
	private String memid;
	private String grelation;
	
	public GuardianVO() {
		
	}

	public GuardianVO(int gcode, String memid, String grelation) {
		super();
		this.gcode = gcode;
		this.memid = memid;
		this.grelation = grelation;
	}

	public int getGcode() {
		return gcode;
	}

	public void setGcode(int gcode) {
		this.gcode = gcode;
	}

	public String getMemid() {
		return memid;
	}

	public void setMemid(String memid) {
		this.memid = memid;
	}

	public String getGrelation() {
		return grelation;
	}

	public void setGrelation(String grelation) {
		this.grelation = grelation;
	}

	@Override
	public String toString() {
		return "GuardianVO [gcode=" + gcode + ", memid=" + memid + ", grelation=" + grelation + "]";
	}
}
