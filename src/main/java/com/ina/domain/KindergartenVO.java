package com.ina.domain;

import java.util.Date;

public class KindergartenVO {
	private int kincode;
	private String sido;
	private String sigungu;
	private String kinname;
	private String kinkind;
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
	public String getSigungu() {
		return sigungu;
	}
	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}
	public String getKinname() {
		return kinname;
	}
	public void setKinname(String kinname) {
		this.kinname = kinname;
	}
	public String getKinkind() {
		return kinkind;
	}
	public void setKinkind(String kinkind) {
		this.kinkind = kinkind;
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
	public KindergartenVO(int kincode, String sido, String sigungu, String kinname, String kinkind, String zipcode,
			String kinaddress, String kinphone, String kinfax, int kinroom, int kinarea, int kinplay, int kinteacher,
			int kinmax, int kincurrent, boolean kinshuttle, String kinhome, Date kinpermit) {
		super();
		this.kincode = kincode;
		this.sido = sido;
		this.sigungu = sigungu;
		this.kinname = kinname;
		this.kinkind = kinkind;
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
	}
	
	
	public KindergartenVO() {
		
	}

	
}
