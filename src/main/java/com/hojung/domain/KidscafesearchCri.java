package com.hojung.domain;

import java.util.Arrays;

public class KidscafesearchCri {
	
	int sigungucode;
	String cfname;
	String cfresdate;
	int[] cfrestime_lists;
	int cfresnum;
	
	public KidscafesearchCri() {
	}

	public KidscafesearchCri(int sigungucode, String cfname, String cfresdate, int[] cfrestime_lists, int cfresnum) {
		super();
		this.sigungucode = sigungucode;
		this.cfname = cfname;
		this.cfresdate = cfresdate;
		this.cfrestime_lists = cfrestime_lists;
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

	public String getCfresdate() {
		return cfresdate;
	}

	public void setCfresdate(String cfresdate) {
		this.cfresdate = cfresdate;
	}

	public int[] getCfrestime_lists() {
		return cfrestime_lists;
	}

	public void setCfrestime_lists(int[] cfrestime_lists) {
		this.cfrestime_lists = cfrestime_lists;
	}

	public int getCfresnum() {
		return cfresnum;
	}

	public void setCfresnum(int cfresnum) {
		this.cfresnum = cfresnum;
	}

	@Override
	public String toString() {
		return "KidscafesearchCri [sigungucode=" + sigungucode + ", cfname=" + cfname + ", cfresdate=" + cfresdate
				+ ", cfrestime_lists=" + Arrays.toString(cfrestime_lists) + ", cfresnum=" + cfresnum + "]";
	}
	
	

}
