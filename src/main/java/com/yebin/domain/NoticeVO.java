package com.yebin.domain;

import java.sql.Date;

public class NoticeVO {

	private int ntccode;
	private String ntctitle;
	private int gcode;
	private int apvcode;
	private String ntcremarks;
	private Date ntcdate;
	private boolean ntcjoin;

	public NoticeVO() {
	
	}

	public NoticeVO(int ntccode, String ntctitle, int gcode, int apvcode, String ntcremarks, Date ntcdate,
			boolean ntcjoin) {
		super();
		this.ntccode = ntccode;
		this.ntctitle = ntctitle;
		this.gcode = gcode;
		this.apvcode = apvcode;
		this.ntcremarks = ntcremarks;
		this.ntcdate = ntcdate;
		this.ntcjoin = ntcjoin;
	}

	public int getNtccode() {
		return ntccode;
	}

	public void setNtccode(int ntccode) {
		this.ntccode = ntccode;
	}

	public String getNtctitle() {
		return ntctitle;
	}

	public void setNtctitle(String ntctitle) {
		this.ntctitle = ntctitle;
	}

	public int getGcode() {
		return gcode;
	}

	public void setGcode(int gcode) {
		this.gcode = gcode;
	}

	public int getApvcode() {
		return apvcode;
	}

	public void setApvcode(int apvcode) {
		this.apvcode = apvcode;
	}

	public String getNtcremarks() {
		return ntcremarks;
	}

	public void setNtcremarks(String ntcremarks) {
		this.ntcremarks = ntcremarks;
	}

	public Date getNtcdate() {
		return ntcdate;
	}

	public void setNtcdate(Date ntcdate) {
		this.ntcdate = ntcdate;
	}

	public boolean isNtcjoin() {
		return ntcjoin;
	}

	public void setNtcjoin(boolean ntcjoin) {
		this.ntcjoin = ntcjoin;
	}

}
