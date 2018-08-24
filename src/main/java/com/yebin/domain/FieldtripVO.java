package com.yebin.domain;

import java.util.Date;

public class FieldtripVO {

	private int ftcode;
	private int tcode;
	private int catecode;
	private int arcode;
	private Date ftstart;
	private Date ftend;
	private String ftaddr;
	private String ftweb;
	private String ftperson;
	private Integer ftcost;
	private int tecode;
	private Date ftdate;
	private int revcode;
	private boolean ftchoice;
	private String ftremarks;
	private boolean mtrcode;
	private String fttitle;
	private String ftselecteddate;


	public FieldtripVO() {
	}

	public FieldtripVO(int ftcode, int tcode, int catecode, int arcode, Date ftstart, Date ftend, String ftaddr,
			String ftweb, String ftperson, Integer ftcost, int tecode, Date ftdate, int revcode, boolean ftchoice,
			String ftremarks, boolean mtrcode, String fttitle) {
		super();
		this.ftcode = ftcode;
		this.tcode = tcode;
		this.catecode = catecode;
		this.arcode = arcode;
		this.ftstart = ftstart;
		this.ftend = ftend;
		this.ftaddr = ftaddr;
		this.ftweb = ftweb;
		this.ftperson = ftperson;
		this.ftcost = ftcost;
		this.tecode = tecode;
		this.ftdate = ftdate;
		this.revcode = revcode;
		this.ftchoice = ftchoice;
		this.ftremarks = ftremarks;
		this.mtrcode = mtrcode;
		this.fttitle = fttitle;
	}

	
	public String getFtselecteddate() {
		return ftselecteddate;
	}

	public void setFtselecteddate(String ftselecteddate) {
		this.ftselecteddate = ftselecteddate;
	}

	
	public int getFtcode() {
		return ftcode;
	}

	public void setFtcode(int ftcode) {
		this.ftcode = ftcode;
	}

	public int getTcode() {
		return tcode;
	}

	public void setTcode(int tcode) {
		this.tcode = tcode;
	}

	public int getCatecpde() {
		return catecode;
	}

	public int getArcode() {
		return arcode;
	}

	public void setArcode(int arcode) {
		this.arcode = arcode;
	}

	public Date getFtstart() {
		return ftstart;
	}

	public void setFtstart(Date ftstart) {
		this.ftstart = ftstart;
	}

	public Date getFtend() {
		return ftend;
	}

	public void setFtend(Date ftend) {
		this.ftend = ftend;
	}

	public String getFtaddr() {
		return ftaddr;
	}

	public void setFtaddr(String ftaddr) {
		this.ftaddr = ftaddr;
	}

	public String getFtweb() {
		return ftweb;
	}

	public void setFtweb(String ftweb) {
		this.ftweb = ftweb;
	}

	public String getFtperson() {
		return ftperson;
	}

	public void setFtperson(String ftperson) {
		this.ftperson = ftperson;
	}

	public Integer getFtcost() {
		return ftcost;
	}

	public void setFtcost(Integer ftcost) {
		this.ftcost = ftcost;
	}

	public int getTecode() {
		return tecode;
	}

	public void setTecode(int tecode) {
		this.tecode = tecode;
	}

	public Date getFtdate() {
		return ftdate;
	}

	public void setFtdate(Date ftdate) {
		this.ftdate = ftdate;
	}

	public int getRevcode() {
		return revcode;
	}

	public void setRevcode(int revcode) {
		this.revcode = revcode;
	}

	public boolean isFtchoice() {
		return ftchoice;
	}

	public void setFtchoice(boolean ftchoice) {
		this.ftchoice = ftchoice;
	}

	public String getFtremarks() {
		return ftremarks;
	}

	public void setFtremarks(String ftremarks) {
		this.ftremarks = ftremarks;
	}

	public boolean isMtrcode() {
		return mtrcode;
	}

	public void setMtrcode(boolean mtrcode) {
		this.mtrcode = mtrcode;
	}

	public int getCatecode() {
		return catecode;
	}

	public void setCatecode(int catecode) {
		this.catecode = catecode;
	}

	public String getFttitle() {
		return fttitle;
	}

	public void setFttitle(String fttitle) {
		this.fttitle = fttitle;
	}

	@Override
	public String toString() {
		return "FieldtripVO [ftcode=" + ftcode + ", tcode=" + tcode + ", catecode=" + catecode + ", arcode=" + arcode
				+ ", ftstart=" + ftstart + ", ftend=" + ftend + ", ftaddr=" + ftaddr + ", ftweb=" + ftweb
				+ ", ftperson=" + ftperson + ", ftcost=" + ftcost + ", tecode=" + tecode + ", ftdate=" + ftdate
				+ ", revcode=" + revcode + ", ftchoice=" + ftchoice + ", ftremarks=" + ftremarks + ", mtrcode="
				+ mtrcode + ", fttitle=" + fttitle + "]";
	}

}
