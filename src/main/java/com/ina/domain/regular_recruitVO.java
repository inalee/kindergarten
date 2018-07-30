package com.ina.domain;

import java.util.Date;

public class regular_recruitVO {

	private int recode;
	private int kincode;
	private int sigungucode;
	private int renum;
	private int renum_2;
	private String reopen;
	private String redetail;
	private Date redate;
	
	
	

	public regular_recruitVO(int recode, int kincode, int sigungucode, int renum, int renum_2, String reopen,
			String redetail, Date redate) {
		super();
		this.recode = recode;
		this.kincode = kincode;
		this.sigungucode = sigungucode;
		this.renum = renum;
		this.renum_2 = renum_2;
		this.reopen = reopen;
		this.redetail = redetail;
		this.redate = redate;
	}




	public int getRecode() {
		return recode;
	}




	public void setRecode(int recode) {
		this.recode = recode;
	}




	public int getKincode() {
		return kincode;
	}




	public void setKincode(int kincode) {
		this.kincode = kincode;
	}




	public int getSigungucode() {
		return sigungucode;
	}




	public void setSigungucode(int sigungucode) {
		this.sigungucode = sigungucode;
	}




	public int getRenum() {
		return renum;
	}




	public void setRenum(int renum) {
		this.renum = renum;
	}




	public int getRenum_2() {
		return renum_2;
	}




	public void setRenum_2(int renum_2) {
		this.renum_2 = renum_2;
	}




	public String getReopen() {
		return reopen;
	}




	public void setReopen(String reopen) {
		this.reopen = reopen;
	}




	public String getRedetail() {
		return redetail;
	}




	public void setRedetail(String redetail) {
		this.redetail = redetail;
	}




	public Date getRedate() {
		return redate;
	}




	public void setRedate(Date redate) {
		this.redate = redate;
	}




	public regular_recruitVO() {
		
	}
	
	
}
