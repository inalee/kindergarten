package com.yebin.domain;

public class AreacodeVO {

	private int arcode;
	private String ararea;
	private String arcity;

	public AreacodeVO() {

	}

	public AreacodeVO(int arcode, String ararea, String arcity) {
		super();
		this.arcode = arcode;
		this.ararea = ararea;
		this.arcity = arcity;
	}

	public int getArcode() {
		return arcode;
	}

	public void setArcode(int arcode) {
		this.arcode = arcode;
	}

	public String getArarea() {
		return ararea;
	}

	public void setArarea(String ararea) {
		this.ararea = ararea;
	}

	public String getArcity() {
		return arcity;
	}

	public void setArcity(String arcity) {
		this.arcity = arcity;
	}

}
