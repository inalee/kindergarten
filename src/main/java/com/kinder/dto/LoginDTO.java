package com.kinder.dto;

public class LoginDTO {
	
	private String memid;
	private String mempw;
	private int memsort;
	private boolean useCookie;
	public LoginDTO() {}
	
	public LoginDTO(String memid, String mempw, int memsort, boolean useCookie) {
		super();
		this.memid = memid;
		this.mempw = mempw;
		this.memsort = memsort;
		this.useCookie = useCookie;
	}

	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getMempw() {
		return mempw;
	}
	public void setMempw(String mempw) {
		this.mempw = mempw;
	}
	
	public int getMemsort() {
		return memsort;
	}

	public void setMemsort(int memsort) {
		this.memsort = memsort;
	}

	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	
	
	
}
