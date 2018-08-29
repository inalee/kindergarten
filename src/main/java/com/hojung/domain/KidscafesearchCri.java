package com.hojung.domain;

import java.util.Date;
import java.util.Arrays;

public class KidscafesearchCri {
	
	private int sigungucode;
	private String cfname;
	private String cfresdatestr;
	private Date cfresdate;
	private int starttime;
	private int endtime;
	private int[] cfrestime_lists;
	private int adultsnum;
	private int kidsnum;
	private int cfresnum;
	
	public KidscafesearchCri() {
	}

	public KidscafesearchCri(int sigungucode, String cfname, String cfresdatestr, Date cfresdate, int starttime,
			int endtime, int[] cfrestime_lists, int adultsnum, int kidsnum, int cfresnum) {
		super();
		this.sigungucode = sigungucode;
		this.cfname = cfname;
		this.cfresdatestr = cfresdatestr;
		this.cfresdate = cfresdate;
		this.starttime = starttime;
		this.endtime = endtime;
		this.cfrestime_lists = cfrestime_lists;
		this.adultsnum = adultsnum;
		this.kidsnum = kidsnum;
		this.cfresnum = cfresnum;
	}

	public int getSigungucode() {
		return sigungucode;
	}

	public void setSigungucode(int sigungucode) {
		this.sigungucode = sigungucode;
	}

	public String getCfname() {
		return cfname;
	}

	public void setCfname(String cfname) {
		this.cfname = cfname;
	}

	public String getCfresdatestr() {
		return cfresdatestr;
	}

	public void setCfresdatestr(String cfresdatestr) {
		this.cfresdatestr = cfresdatestr;
	}

	public Date getCfresdate() {
		return cfresdate;
	}

	public void setCfresdate(Date cfresdate) {
		this.cfresdate = cfresdate;
	}

	public int getStarttime() {
		return starttime;
	}

	public void setStarttime(int starttime) {
		this.starttime = starttime;
	}

	public int getEndtime() {
		return endtime;
	}

	public void setEndtime(int endtime) {
		this.endtime = endtime;
	}

	public int[] getCfrestime_lists() {
		return cfrestime_lists;
	}

	public void setCfrestime_lists(int[] cfrestime_lists) {
		this.cfrestime_lists = cfrestime_lists;
		starttime = cfrestime_lists[0];
		endtime = cfrestime_lists[cfrestime_lists.length-1]+1;
	}

	public int getAdultsnum() {
		return adultsnum;
	}

	public void setAdultsnum(int adultsnum) {
		this.adultsnum = adultsnum;
		cfresnum = adultsnum + kidsnum;
	}

	public int getKidsnum() {
		return kidsnum;
	}

	public void setKidsnum(int kidsnum) {
		this.kidsnum = kidsnum;
		cfresnum = adultsnum + kidsnum;
	}

	public int getCfresnum() {
		return cfresnum;
	}

	public void setCfresnum(int cfresnum) {
		this.cfresnum = cfresnum;
	}

	@Override
	public String toString() {
		return "KidscafesearchCri [sigungucode=" + sigungucode + ", cfname=" + cfname + ", cfresdatestr=" + cfresdatestr
				+ ", cfresdate=" + cfresdate + ", starttime=" + starttime + ", endtime=" + endtime
				+ ", cfrestime_lists=" + Arrays.toString(cfrestime_lists) + ", adultsnum=" + adultsnum + ", kidsnum="
				+ kidsnum + ", cfresnum=" + cfresnum + "]";
	}


}
