package com.hojung.domain;

import java.sql.Date;
import java.util.Arrays;

public class MyresVO {
	
	private int cfrescode;
	private java.util.Date confirtime;
	private String cfimg;
	private String cfname;
	private String address;
	private Date cfresdate;
	private int[] cfrestime_lists;
	private String cfrestime_str;
	private int adultsnum;
	private int kidsnum;
	private int cfcode;
	
	public MyresVO() {

	}

	public MyresVO(int cfrescode, java.util.Date confirtime, String cfimg, String cfname, String address,
			Date cfresdate, int[] cfrestime_lists, String cfrestime_str, int adultsnum, int kidsnum, int cfcode) {
		super();
		this.cfrescode = cfrescode;
		this.confirtime = confirtime;
		this.cfimg = cfimg;
		this.cfname = cfname;
		this.address = address;
		this.cfresdate = cfresdate;
		this.cfrestime_lists = cfrestime_lists;
		this.cfrestime_str = cfrestime_str;
		this.adultsnum = adultsnum;
		this.kidsnum = kidsnum;
		this.cfcode = cfcode;
	}

	public int getCfrescode() {
		return cfrescode;
	}

	public void setCfrescode(int cfrescode) {
		this.cfrescode = cfrescode;
	}

	public java.util.Date getConfirtime() {
		return confirtime;
	}

	public void setConfirtime(java.util.Date confirtime) {
		this.confirtime = confirtime;
	}

	public String getCfimg() {
		return cfimg;
	}

	public void setCfimg(String cfimg) {
		this.cfimg = cfimg;
	}

	public String getCfname() {
		return cfname;
	}

	public void setCfname(String cfname) {
		this.cfname = cfname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getCfresdate() {
		return cfresdate;
	}

	public void setCfresdate(Date cfresdate) {
		this.cfresdate = cfresdate;
	}

	public int[] getCfrestime_lists() {
		return cfrestime_lists;
	}

	public void setCfrestime_lists(int[] cfrestime_lists) {
		this.cfrestime_lists = cfrestime_lists;
	}

	public String getCfrestime_str() {
		return cfrestime_str;
	}

	public void setCfrestime_str(String cfrestime_str) {
		this.cfrestime_str = cfrestime_str;
	}

	public int getAdultsnum() {
		return adultsnum;
	}

	public void setAdultsnum(int adultsnum) {
		this.adultsnum = adultsnum;
	}

	public int getKidsnum() {
		return kidsnum;
	}

	public void setKidsnum(int kidsnum) {
		this.kidsnum = kidsnum;
	}

	public int getCfcode() {
		return cfcode;
	}

	public void setCfcode(int cfcode) {
		this.cfcode = cfcode;
	}

	@Override
	public String toString() {
		return "MyresVO [cfrescode=" + cfrescode + ", confirtime=" + confirtime + ", cfimg=" + cfimg + ", cfname="
				+ cfname + ", address=" + address + ", cfresdate=" + cfresdate + ", cfrestime_lists="
				+ Arrays.toString(cfrestime_lists) + ", cfrestime_str=" + cfrestime_str + ", adultsnum=" + adultsnum
				+ ", kidsnum=" + kidsnum + ", cfcode=" + cfcode + "]";
	}

}
