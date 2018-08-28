package com.hojung.domain;

import java.util.Date;

public class KidscafesumCri {
	
	private int cfcode;
	private Date cfresdate;
	private int cfrestime;
	private int cfresnum;
	
	public KidscafesumCri() {
	}

	public KidscafesumCri(int cfcode, Date cfresdate, int cfrestime, int cfresnum) {
		super();
		this.cfcode = cfcode;
		this.cfresdate = cfresdate;
		this.cfrestime = cfrestime;
		this.cfresnum = cfresnum;
	}

	public int getCfcode() {
		return cfcode;
	}

	public void setCfcode(int cfcode) {
		this.cfcode = cfcode;
	}

	public Date getCfresdate() {
		return cfresdate;
	}

	public void setCfresdate(Date cfresdate) {
		this.cfresdate = cfresdate;
	}

	public int getCfrestime() {
		return cfrestime;
	}

	public void setCfrestime(int cfrestime) {
		this.cfrestime = cfrestime;
	}

	public int getCfresnum() {
		return cfresnum;
	}

	public void setCfresnum(int cfresnum) {
		this.cfresnum = cfresnum;
	}

	@Override
	public String toString() {
		return "KidscafesumVO [cfcode=" + cfcode + ", cfresdate=" + cfresdate + ", cfrestime=" + cfrestime
				+ ", cfresnum=" + cfresnum + "]";
	}

	
	
}
