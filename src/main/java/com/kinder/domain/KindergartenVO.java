package com.kinder.domain;

import java.util.Date;

public class KindergartenVO {
	private int kincode;
	private String sido;
	private int sigungucode;
	private String kinname;
	private int kinkindcode;
	private String zipcode;
	private String kinaddress;
	private String kinphone;
	private String kinfax;
	private int kinroom;
	private int kinarea;
	private int kinplay;
	private int kinteacher;
	private int kinmax;
	private int kincurrent;
	private boolean kinshuttle;
	private String kinhome;
	private Date kinpermit;
	private double kinla;
	private double kinlo;
	private String kinspec;
	
	public int getKincode() {
		return kincode;
	}
	public void setKincode(int kincode) {
		this.kincode = kincode;
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
	public String getKinname() {
		return kinname;
	}
	public void setKinname(String kinname) {
		this.kinname = kinname;
	}
	public int getKinkindcode() {
		return kinkindcode;
	}
	public void setKinkindcode(int kinkindcode) {
		this.kinkindcode = kinkindcode;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getKinaddress() {
		return kinaddress;
	}
	public void setKinaddress(String kinaddress) {
		this.kinaddress = kinaddress;
	}
	public String getKinphone() {
		return kinphone;
	}
	public void setKinphone(String kinphone) {
		this.kinphone = kinphone;
	}
	public String getKinfax() {
		return kinfax;
	}
	public void setKinfax(String kinfax) {
		this.kinfax = kinfax;
	}
	public int getKinroom() {
		return kinroom;
	}
	public void setKinroom(int kinroom) {
		this.kinroom = kinroom;
	}
	public int getKinarea() {
		return kinarea;
	}
	public void setKinarea(int kinarea) {
		this.kinarea = kinarea;
	}
	public int getKinplay() {
		return kinplay;
	}
	public void setKinplay(int kinplay) {
		this.kinplay = kinplay;
	}
	public int getKinteacher() {
		return kinteacher;
	}
	public void setKinteacher(int kinteacher) {
		this.kinteacher = kinteacher;
	}
	public int getKinmax() {
		return kinmax;
	}
	public void setKinmax(int kinmax) {
		this.kinmax = kinmax;
	}
	public int getKincurrent() {
		return kincurrent;
	}
	public void setKincurrent(int kincurrent) {
		this.kincurrent = kincurrent;
	}
	public boolean isKinshuttle() {
		return kinshuttle;
	}
	public void setKinshuttle(boolean kinshuttle) {
		this.kinshuttle = kinshuttle;
	}
	public String getKinhome() {
		return kinhome;
	}
	public void setKinhome(String kinhome) {
		this.kinhome = kinhome;
	}
	public Date getKinpermit() {
		return kinpermit;
	}
	public void setKinpermit(Date kinpermit) {
		this.kinpermit = kinpermit;
	}

	
	
	public double getKinla() {
		return kinla;
	}
	public void setKinla(double kinla) {
		this.kinla = kinla;
	}
	public double getKinlo() {
		return kinlo;
	}
	public void setKinlo(double kinlo) {
		this.kinlo = kinlo;
	}
	public String getKinspec() {
		return kinspec;
	}
	public void setKinspec(String kinspec) {
		this.kinspec = kinspec;
	}
	
	
	
	public KindergartenVO(int kincode, String sido, int sigungucode, String kinname, int kinkindcode, String zipcode,
			String kinaddress, String kinphone, String kinfax, int kinroom, int kinarea, int kinplay, int kinteacher,
			int kinmax, int kincurrent, boolean kinshuttle, String kinhome, Date kinpermit, double kinla, double kinlo,
			String kinspec) {
		super();
		this.kincode = kincode;
		this.sido = sido;
		this.sigungucode = sigungucode;
		this.kinname = kinname;
		this.kinkindcode = kinkindcode;
		this.zipcode = zipcode;
		this.kinaddress = kinaddress;
		this.kinphone = kinphone;
		this.kinfax = kinfax;
		this.kinroom = kinroom;
		this.kinarea = kinarea;
		this.kinplay = kinplay;
		this.kinteacher = kinteacher;
		this.kinmax = kinmax;
		this.kincurrent = kincurrent;
		this.kinshuttle = kinshuttle;
		this.kinhome = kinhome;
		this.kinpermit = kinpermit;
		this.kinla = kinla;
		this.kinlo = kinlo;
		this.kinspec = kinspec;
	}
	public KindergartenVO() {
		
	}
	
	
}
