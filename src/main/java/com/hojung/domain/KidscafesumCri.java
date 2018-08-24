package com.hojung.domain;

import java.sql.Date;

public class KidscafesumCri {
	
	int cfcode;
	Date cfresdate;
	int cfrestime;
	int sum_cfresnum;
	
	public KidscafesumCri() {
	}

	public KidscafesumCri(int cfcode, Date cfresdate, int cfrestime, int sum_cfresnum) {
		super();
		this.cfcode = cfcode;
		this.cfresdate = cfresdate;
		this.cfrestime = cfrestime;
		this.sum_cfresnum = sum_cfresnum;
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

	public int getSum_cfresnum() {
		return sum_cfresnum;
	}

	public void setSum_cfresnum(int sum_cfresnum) {
		this.sum_cfresnum = sum_cfresnum;
	}

	@Override
	public String toString() {
		return "KidscafesumVO [cfcode=" + cfcode + ", cfresdate=" + cfresdate + ", cfrestime=" + cfrestime
				+ ", sum_cfresnum=" + sum_cfresnum + "]";
	}

	
	
}
