package com.ina.domain;

import java.util.Date;

public class RegularEnrollVO {
	private int re_encode;
	private int ccode;
	private int recode;
	private int re_statecode;
	private Date re_log;
	private Date rehopedate;
	private String refile;
	private String reorigin;
	
	

	
	public int getRe_encode() {
		return re_encode;
	}

	public void setRe_encode(int re_encode) {
		this.re_encode = re_encode;
	}

	public int getCcode() {
		return ccode;
	}

	public void setCcode(int ccode) {
		this.ccode = ccode;
	}

	public int getRecode() {
		return recode;
	}

	public void setRecode(int recode) {
		this.recode = recode;
	}

	public int getRe_statecode() {
		return re_statecode;
	}

	public void setRe_statecode(int re_statecode) {
		this.re_statecode = re_statecode;
	}

	public Date getRe_log() {
		return re_log;
	}

	public void setRe_log(Date re_log) {
		this.re_log = re_log;
	}

	public Date getRehopedate() {
		return rehopedate;
	}

	public void setRehopedate(Date rehopedate) {
		this.rehopedate = rehopedate;
	}

	public String getRefile() {
		return refile;
	}

	public void setRefile(String refile) {
		this.refile = refile;
	}

	public String getReorigin() {
		return reorigin;
	}

	public void setReorigin(String reorigin) {
		this.reorigin = reorigin;
	}


	
	public RegularEnrollVO(int re_encode, int ccode, int recode, int re_statecode, Date re_log, Date rehopedate,
			String refile, String reorigin) {
		super();
		this.re_encode = re_encode;
		this.ccode = ccode;
		this.recode = recode;
		this.re_statecode = re_statecode;
		this.re_log = re_log;
		this.rehopedate = rehopedate;
		this.refile = refile;
		this.reorigin = reorigin;
	}

	public RegularEnrollVO () {
		
	}
	
}
