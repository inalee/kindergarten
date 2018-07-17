package com.kinder.domain;

public class GuardianVO {


	private String memid;
	private String grelation;
	

	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getGrelation() {
		return grelation;
	}
	public void setGrelation(String grelation) {
		this.grelation = grelation;
	}
	public GuardianVO(String memid, String grelation) {
		super();

		this.memid = memid;
		this.grelation = grelation;
	}
	
	
	public GuardianVO() {
		
	}
	
}
