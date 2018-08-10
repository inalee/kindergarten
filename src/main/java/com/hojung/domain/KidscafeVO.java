package com.hojung.domain;

import java.util.Date;

public class KidscafeVO {
	
	int cfcode;
	String cfname;
	String sido;
	int sigungucode;
	int zipcode;
	String address;
	Date cfpermit;
	double cfarea;
	String cfphone;
	double coordinatex;
	double coordinatey;
	String cfpermitnum;
	int cfopen;
	int cfclose;
	int numperhour;
	
	public KidscafeVO() {
	}

	public KidscafeVO(int cfcode, String cfname, String sido, int sigungucode, int zipcode, String address,
			Date cfpermit, double cfarea, String cfphone, double coordinatex, double coordinatey, String cfpermitnum,
			int cfopen, int cfclose, int numperhour) {
		super();
		this.cfcode = cfcode;
		this.cfname = cfname;
		this.sido = sido;
		this.sigungucode = sigungucode;
		this.zipcode = zipcode;
		this.address = address;
		this.cfpermit = cfpermit;
		this.cfarea = cfarea;
		this.cfphone = cfphone;
		this.coordinatex = coordinatex;
		this.coordinatey = coordinatey;
		this.cfpermitnum = cfpermitnum;
		this.cfopen = cfopen;
		this.cfclose = cfclose;
		this.numperhour = numperhour;
	}

	public int getCfcode() {
		return cfcode;
	}

	public void setCfcode(int cfcode) {
		this.cfcode = cfcode;
	}

	public String getCfname() {
		return cfname;
	}

	public void setCfname(String cfname) {
		this.cfname = cfname;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public int getSigungucode() {
		return sigungucode;
	}

	public void setSigungucode(int sigungucode) {
		this.sigungucode = sigungucode;
	}

	public int getZipcode() {
		return zipcode;
	}

	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getCfpermit() {
		return cfpermit;
	}

	public void setCfpermit(Date cfpermit) {
		this.cfpermit = cfpermit;
	}

	public double getCfarea() {
		return cfarea;
	}

	public void setCfarea(double cfarea) {
		this.cfarea = cfarea;
	}

	public String getCfphone() {
		return cfphone;
	}

	public void setCfphone(String cfphone) {
		this.cfphone = cfphone;
	}

	public double getCoordinatex() {
		return coordinatex;
	}

	public void setCoordinatex(double coordinatex) {
		this.coordinatex = coordinatex;
	}

	public double getCoordinatey() {
		return coordinatey;
	}

	public void setCoordinatey(double coordinatey) {
		this.coordinatey = coordinatey;
	}

	public String getCfpermitnum() {
		return cfpermitnum;
	}

	public void setCfpermitnum(String cfpermitnum) {
		this.cfpermitnum = cfpermitnum;
	}

	public int getCfopen() {
		return cfopen;
	}

	public void setCfopen(int cfopen) {
		this.cfopen = cfopen;
	}

	public int getCfclose() {
		return cfclose;
	}

	public void setCfclose(int cfclose) {
		this.cfclose = cfclose;
	}

	public int getNumperhour() {
		return numperhour;
	}

	public void setNumperhour(int numperhour) {
		this.numperhour = numperhour;
	}

	@Override
	public String toString() {
		return "KidscafeVO [cfcode=" + cfcode + ", cfname=" + cfname + ", sido=" + sido + ", sigungucode=" + sigungucode
				+ ", zipcode=" + zipcode + ", address=" + address + ", cfpermit=" + cfpermit + ", cfarea=" + cfarea
				+ ", cfphone=" + cfphone + ", coordinatex=" + coordinatex + ", coordinatey=" + coordinatey
				+ ", cfpermitnum=" + cfpermitnum + ", cfopen=" + cfopen + ", cfclose=" + cfclose + ", numperhour="
				+ numperhour + "]";
	}

	

}
