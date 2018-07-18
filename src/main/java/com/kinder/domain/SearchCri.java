package com.kinder.domain;

public class SearchCri {

	private int sigungucode;
	private String kinname;
	private int kinkindcode;
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

	@Override
	public String toString() {
		return "SearchCri [sigungucode=" + sigungucode + ", kinname=" + kinname + ", kinkindcode=" + kinkindcode + "]";
	}
	
	
	
	
}
