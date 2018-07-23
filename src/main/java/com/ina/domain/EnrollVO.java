package com.ina.domain;

import java.util.Date;

public class EnrollVO {

	private int encode;
	private int ccode;
	private int kincode;
	private int statcode;
	private Date hopedate;
	private Date enlog;

	

	public EnrollVO(int encode, int ccode, int kincode, int statcode, Date hopedate, Date enlog) {
		super();
		this.encode = encode;
		this.ccode = ccode;
		this.kincode = kincode;
		this.statcode = statcode;
		this.hopedate = hopedate;
		this.enlog = enlog;
	}



	public int getEncode() {
		return encode;
	}



	public void setEncode(int encode) {
		this.encode = encode;
	}



	public int getCcode() {
		return ccode;
	}



	public void setCcode(int ccode) {
		this.ccode = ccode;
	}



	public int getKincode() {
		return kincode;
	}



	public void setKincode(int kincode) {
		this.kincode = kincode;
	}



	public int getStatcode() {
		return statcode;
	}



	public void setStatcode(int statcode) {
		this.statcode = statcode;
	}



	public Date getHopedate() {
		return hopedate;
	}



	public void setHopedate(Date hopedate) {
		this.hopedate = hopedate;
	}



	public Date getEnlog() {
		return enlog;
	}



	public void setEnlog(Date enlog) {
		this.enlog = enlog;
	}



	public EnrollVO() {
		
	}
}
