package com.jiwon.dto;

import java.sql.Time;
import java.util.Date;

public class AttendDTO {
	private int ccode;
	private String cname;
	private int clcode;
	private int atstate;
	private String atstime;
	private String atetime;
	private String atdate;
	
	
	public String getAtdate() {
		return atdate;
	}
	public void setAtdate(String atdate) {
		this.atdate = atdate;
	}
	public AttendDTO() {
		super();
	}
	public AttendDTO(int ccode, String cname, int clcode, int atstate) {
		super();
		this.ccode = ccode;
		this.cname = cname;
		this.clcode = clcode;
		this.atstate = atstate;
	}
	public AttendDTO(int ccode, String cname, int clcode, int atstate, String atstime, String atetime) {
		super();
		this.ccode = ccode;
		this.cname = cname;
		this.clcode = clcode;
		this.atstate = atstate;
		this.atstime = atstime;
		this.atetime = atetime;
	}
	
	public String getAtstime() {
		return atstime;
	}

	public void setAtstime(String atstime) {
		this.atstime = atstime;
	}

	public String getAtetime() {
		return atetime;
	}

	public void setAtetime(String atetime) {
		this.atetime = atetime;
	}

	public int getCcode() {
		return ccode;
	}
	public void setCcode(int ccode) {
		this.ccode = ccode;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getClcode() {
		return clcode;
	}
	public void setClcode(int clcode) {
		this.clcode = clcode;
	}
	public int getAtstate() {
		return atstate;
	}
	public void setAtstate(int atstate) {
		this.atstate = atstate;
	}
	
	

}
