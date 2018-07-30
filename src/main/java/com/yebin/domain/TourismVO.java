package com.yebin.domain;

import java.sql.Date;

public class TourismVO {

	private int tourcode;
	private String touraddr;
	private boolean tourchoice;
	private String tourweb;
	private double tourmeter;
	private Date tourvisitdate;
	private int revcode;
	private String tourremarks;

	public TourismVO() {

	}

	public TourismVO(int tourcode, String touraddr, boolean tourchoice, String tourweb, double tourmeter,
			Date tourvisitdate, int revcode, String tourremarks) {
		super();
		this.tourcode = tourcode;
		this.touraddr = touraddr;
		this.tourchoice = tourchoice;
		this.tourweb = tourweb;
		this.tourmeter = tourmeter;
		this.tourvisitdate = tourvisitdate;
		this.revcode = revcode;
		this.tourremarks = tourremarks;
	}

	public int getTourcode() {
		return tourcode;
	}

	public void setTourcode(int tourcode) {
		this.tourcode = tourcode;
	}

	public String getTouraddr() {
		return touraddr;
	}

	public void setTouraddr(String touraddr) {
		this.touraddr = touraddr;
	}

	public boolean isTourchoice() {
		return tourchoice;
	}

	public void setTourchoice(boolean tourchoice) {
		this.tourchoice = tourchoice;
	}

	public String getTourweb() {
		return tourweb;
	}

	public void setTourweb(String tourweb) {
		this.tourweb = tourweb;
	}

	public double getTourmeter() {
		return tourmeter;
	}

	public void setTourmeter(double tourmeter) {
		this.tourmeter = tourmeter;
	}

	public Date getTourvisitdate() {
		return tourvisitdate;
	}

	public void setTourvisitdate(Date tourvisitdate) {
		this.tourvisitdate = tourvisitdate;
	}

	public int getRevcode() {
		return revcode;
	}

	public void setRevcode(int revcode) {
		this.revcode = revcode;
	}

	public String getTourremarks() {
		return tourremarks;
	}

	public void setTourremarks(String tourremarks) {
		this.tourremarks = tourremarks;
	}

}
