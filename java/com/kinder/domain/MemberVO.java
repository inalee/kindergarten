package com.kinder.domain;

import java.util.Date;

public class MemberVO {
	private String memid;
	private String mempw;
	private String memname;
	private String memphone;
	private String memaddress;
	private String memgen;
	private int memage;
	private Date memdate;
	private int memsort;
	public MemberVO() {	}
	public MemberVO(String memid, String mempw, String memname, String memphone, String memaddress, String memgen,
			int memage, Date memdate, int memsort) {
		super();
		this.memid = memid;
		this.mempw = mempw;
		this.memname = memname;
		this.memphone = memphone;
		this.memaddress = memaddress;
		this.memgen = memgen;
		this.memage = memage;
		this.memdate = memdate;
		this.memsort = memsort;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getMempw() {
		return mempw;
	}
	public void setMempw(String mempw) {
		this.mempw = mempw;
	}
	public String getMemname() {
		return memname;
	}
	public void setMemname(String memname) {
		this.memname = memname;
	}
	public String getMemphone() {
		return memphone;
	}
	public void setMemphone(String memphone) {
		this.memphone = memphone;
	}
	public String getMemaddress() {
		return memaddress;
	}
	public void setMemaddress(String memaddress) {
		this.memaddress = memaddress;
	}
	public String getMemgen() {
		return memgen;
	}
	public void setMemgen(String memgen) {
		this.memgen = memgen;
	}
	public int getMemage() {
		return memage;
	}
	public void setMemage(int memage) {
		this.memage = memage;
	}
	public Date getMemdate() {
		return memdate;
	}
	public void setMemdate(Date memdate) {
		this.memdate = memdate;
	}
	public int getMemsort() {
		return memsort;
	}
	public void setMemsort(int memsort) {
		this.memsort = memsort;
	}
	
	
	
}
