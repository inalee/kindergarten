package com.hojung.domain;

public class KidscaferestimeCri {
	
	private int cfrescode;
	private int cfrestime;
	
	public KidscaferestimeCri() {
		
	}

	public KidscaferestimeCri(int cfrescode, int cfrestime) {
		super();
		this.cfrescode = cfrescode;
		this.cfrestime = cfrestime;
	}

	public int getCfrescode() {
		return cfrescode;
	}

	public void setCfrescode(int cfrescode) {
		this.cfrescode = cfrescode;
	}

	public int getCfrestime() {
		return cfrestime;
	}

	public void setCfrestime(int cfrestime) {
		this.cfrestime = cfrestime;
	}

	@Override
	public String toString() {
		return "KidscaferestimeCri [cfrescode=" + cfrescode + ", cfrestime=" + cfrestime + "]";
	}

}
