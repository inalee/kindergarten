package com.kinder.domain;

public class ClassVO {
	private int clcode;
	private int tecode;
	private int kincode;
	private String clname;
	private String clage;
	private int agecode;
	public int getClcode() {
		return clcode;
	}
	public void setClcode(int clcode) {
		this.clcode = clcode;
	}
	public int getTecode() {
		return tecode;
	}
	public void setTecode(int tecode) {
		this.tecode = tecode;
	}
	public int getKincode() {
		return kincode;
	}
	public void setKincode(int kincode) {
		this.kincode = kincode;
	}
	public String getClname() {
		return clname;
	}
	public void setClname(String clname) {
		this.clname = clname;
	}
	public String getClage() {
		return clage;
	}
	public void setClage(String clage) {
		this.clage = clage;
	}
	public int getAgecode() {
		return agecode;
	}
	public void setAgecode(int agecode) {
		this.agecode = agecode;
	}
	public ClassVO(int clcode, int tecode, int kincode, String clname, String clage, int agecode) {
		super();
		this.clcode = clcode;
		this.tecode = tecode;
		this.kincode = kincode;
		this.clname = clname;
		this.clage = clage;
		this.agecode = agecode;
	}
	
	
	public ClassVO() {
		
	}
	
	
	
}
