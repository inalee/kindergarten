package com.jiwon.dto;

public class AttendDTO {
	private int ccode;
	private String cname;
	private int clcode;
	private int state;
	public AttendDTO(int ccode, String cname, int clcode, int state) {
		super();
		this.ccode = ccode;
		this.cname = cname;
		this.clcode = clcode;
		this.state = state;
	}
	public int getCcode() {
		return ccode;
	}
	public void setCcode(int ccode) {
		this.ccode = ccode;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getClcode() {
		return clcode;
	}
	public void setClcode(int clcode) {
		this.clcode = clcode;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	

}
