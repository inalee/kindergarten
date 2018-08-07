package com.ina.domain;

public class Regular_finalVO {

	private int kincode;
	private int ccode;
	private int re_encode;
	
	public int getKincode() {
		return kincode;
	}
	public void setKincode(int kincode) {
		this.kincode = kincode;
	}
	public int getCcode() {
		return ccode;
	}
	public void setCcode(int ccode) {
		this.ccode = ccode;
	}
	public int getRe_encode() {
		return re_encode;
	}
	public void setRe_encode(int re_encode) {
		this.re_encode = re_encode;
	}
	public Regular_finalVO(int kincode, int ccode, int re_encode) {
		super();
		this.kincode = kincode;
		this.ccode = ccode;
		this.re_encode = re_encode;
	}
	
	
	public Regular_finalVO() {
		
		
	}
}
