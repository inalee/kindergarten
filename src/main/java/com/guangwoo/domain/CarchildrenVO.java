package com.guangwoo.domain;

public class CarchildrenVO {

	private Integer kincode;
	private Integer ccode;
	private Integer cage;
	private String kinname;
	private String cname;
	private String cgen;

	
	public CarchildrenVO() {
		super();
	}


	public CarchildrenVO(Integer kincode, Integer ccode, Integer cage, String kinname, String cname, String cgen) {
		super();
		this.kincode = kincode;
		this.ccode = ccode;
		this.cage = cage;
		this.kinname = kinname;
		this.cname = cname;
		this.cgen = cgen;
	}


	public Integer getKincode() {
		return kincode;
	}


	public void setKincode(Integer kincode) {
		this.kincode = kincode;
	}


	public Integer getCcode() {
		return ccode;
	}


	public void setCcode(Integer ccode) {
		this.ccode = ccode;
	}


	public Integer getCage() {
		return cage;
	}


	public void setCage(Integer cage) {
		this.cage = cage;
	}


	public String getKinname() {
		return kinname;
	}


	public void setKinname(String kinname) {
		this.kinname = kinname;
	}


	public String getCname() {
		return cname;
	}


	public void setCname(String cname) {
		this.cname = cname;
	}


	public String getCgen() {
		return cgen;
	}


	public void setCgen(String cgen) {
		this.cgen = cgen;
	}


	@Override
	public String toString() {
		return "CarchildrenVO [kincode=" + kincode + ", ccode=" + ccode + ", cage=" + cage + ", kinname=" + kinname
				+ ", cname=" + cname + ", cgen=" + cgen + "]";
	}

}
