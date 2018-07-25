package com.ina.domain;

import java.util.Date;

public class EnrollBean {
	private int kincode;
	private int ccode;
	private Date hopedate;

	public int getKincode() {
		return kincode;
	}

	public void setKincode(int kincode) {
		this.kincode = kincode;
	}

	public int getCcode() {
		return ccode;
	}

	public void setCcode(int ccode) {
		this.ccode = ccode;
	}

	public Date getHopedate() {
		return hopedate;
	}

	public void setHopedate(Date hopedate) {
		this.hopedate = hopedate;
	}

	public EnrollBean(int kincode, int ccode, Date hopedate) {
		super();
		this.kincode = kincode;
		this.ccode = ccode;
		this.hopedate = hopedate;
	}

	@Override
	public String toString() {
		return "EnrollBean [kincode=" + kincode + ", ccode=" + ccode + ", hopedate=" + hopedate + "]";
	}

	public EnrollBean() {}
	
}
