package com.hojung.domain;

import java.util.Arrays;
import java.util.Date;

public class KidscaferesCri {
	
	private int cfcode;
	private int gcode;
	private Date cfresdate;
	private int adultsnum;
	private int kidsnum;
	private int[] cfrestime_lists;
	
	public KidscaferesCri() {
		
	}

	public KidscaferesCri(int cfcode, int gcode, Date cfresdate, int adultsnum, int kidsnum, int[] cfrestime_lists) {
		super();
		this.cfcode = cfcode;
		this.gcode = gcode;
		this.cfresdate = cfresdate;
		this.adultsnum = adultsnum;
		this.kidsnum = kidsnum;
		this.cfrestime_lists = cfrestime_lists;
	}

	public int getCfcode() {
		return cfcode;
	}

	public void setCfcode(int cfcode) {
		this.cfcode = cfcode;
	}

	public int getGcode() {
		return gcode;
	}

	public void setGcode(int gcode) {
		this.gcode = gcode;
	}

	public Date getCfresdate() {
		return cfresdate;
	}

	public void setCfresdate(Date cfresdate) {
		this.cfresdate = cfresdate;
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

	public int[] getCfrestime_lists() {
		return cfrestime_lists;
	}

	public void setCfrestime_lists(int[] cfrestime_lists) {
		this.cfrestime_lists = cfrestime_lists;
	}

	@Override
	public String toString() {
		return "KidscaferesCri [cfcode=" + cfcode + ", gcode=" + gcode + ", cfresdate=" + cfresdate + ", adultsnum="
				+ adultsnum + ", kidsnum=" + kidsnum + ", cfrestime_lists=" + Arrays.toString(cfrestime_lists) + "]";
	}

}
