package com.ina.domain;

public class SearchCri {

	private String sigungu;
	private String kinname;
	private String kinkind;
	
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
	
	public SearchCri(String sigungu, String kinname, String kinkind) {
		super();
		this.sigungu = sigungu;
		this.kinname = kinname;
		this.kinkind = kinkind;
	}
	
	public SearchCri() {
		
		
	}
	@Override
	public String toString() {
		return "SearchCri [sigungu=" + sigungu + ", kinname=" + kinname + ", kinkind=" + kinkind + "]";
	}
	
	
	
}
