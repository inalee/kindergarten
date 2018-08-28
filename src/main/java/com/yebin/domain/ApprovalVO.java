package com.yebin.domain;

import java.sql.Date;

public class ApprovalVO {

	private int apvcode;
	private String apvtitle;
	private String apvclname; // 원래는 코드로 넣어야함.. 급하니까일단..!
	private int ftcode;
	private int tecode;
	private int apvmaster;
	private Date apvdate;
	private String apvpurpose;
	private String apvremarks;
	private Date apvrqdate;

	public ApprovalVO() {

	}

	public ApprovalVO(int apvcode, String apvtitle, String apvclname, int ftcode, int tecode, int apvmaster,
			Date apvdate, String apvpurpose, String apvremarks, Date apvrqdate) {
		super();
		this.apvcode = apvcode;
		this.apvtitle = apvtitle;
		this.apvclname = apvclname;
		this.ftcode = ftcode;
		this.tecode = tecode;
		this.apvmaster = apvmaster;
		this.apvdate = apvdate;
		this.apvpurpose = apvpurpose;
		this.apvremarks = apvremarks;
		this.apvrqdate = apvrqdate;
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

	public int getApvmaster() {
		return apvmaster;
	}

	public void setApvmaster(int apvmaster) {
		this.apvmaster = apvmaster;
	}

	public Date getApvdate() {
		return apvdate;
	}

	public void setApvdate(Date apvdate) {
		this.apvdate = apvdate;
	}

	public String getApvpurpose() {
		return apvpurpose;
	}

	public void setApvpurpose(String apvpurpose) {
		this.apvpurpose = apvpurpose;
	}

	public String getApvremarks() {
		return apvremarks;
	}

	public void setApvremarks(String apvremarks) {
		this.apvremarks = apvremarks;
	}

	public Date getApvrqdate() {
		return apvrqdate;
	}

	public void setApvrqdate(Date apvrqdate) {
		this.apvrqdate = apvrqdate;
	}

	public String getApvtitle() {
		return apvtitle;
	}

	public void setApvtitle(String apvtitle) {
		this.apvtitle = apvtitle;
	}

	public String getApvclname() {
		return apvclname;
	}

	public void setApvclname(String apvclname) {
		this.apvclname = apvclname;
	}

}
