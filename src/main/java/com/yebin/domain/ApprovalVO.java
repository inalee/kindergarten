package com.yebin.domain;

import java.sql.Date;

public class ApprovalVO {

	private int apvcode;
	private int ftcode;
	private int tecode;
	private boolean apvmaster;
	private Date apvdate;

	public ApprovalVO() {
	
	}

	public ApprovalVO(int apvcode, int ftcode, int tecode, boolean apvmaster, Date apvdate) {
		super();
		this.apvcode = apvcode;
		this.ftcode = ftcode;
		this.tecode = tecode;
		this.apvmaster = apvmaster;
		this.apvdate = apvdate;
	}

	public int getApvcode() {
		return apvcode;
	}

	public void setApvcode(int apvcode) {
		this.apvcode = apvcode;
	}

	public int getFtcode() {
		return ftcode;
	}

	public void setFtcode(int ftcode) {
		this.ftcode = ftcode;
	}

	public int getTecode() {
		return tecode;
	}

	public void setTecode(int tecode) {
		this.tecode = tecode;
	}

	public boolean isApvmaster() {
		return apvmaster;
	}

	public void setApvmaster(boolean apvmaster) {
		this.apvmaster = apvmaster;
	}

	public Date getApvdate() {
		return apvdate;
	}

	public void setApvdate(Date apvdate) {
		this.apvdate = apvdate;
	}

}
