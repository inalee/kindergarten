package com.guangwoo.domain;

public class VehicleVO {

	private Integer kincode;
	private Integer carcode;
	private Integer tecode;
	private String carnum;
	private String carpay;
	private Integer fayear;
	private String oilname;
	private String vtlname;
	private String faname;
	private String kinname;
	private String carname;
	private String memname;
	
	
	public VehicleVO() {
		super();
	}


	public VehicleVO(Integer kincode, Integer carcode, Integer tecode, String carnum, String carpay, Integer fayear,
			String oilname, String vtlname, String faname, String kinname, String carname, String memname) {
		super();
		this.kincode = kincode;
		this.carcode = carcode;
		this.tecode = tecode;
		this.carnum = carnum;
		this.carpay = carpay;
		this.fayear = fayear;
		this.oilname = oilname;
		this.vtlname = vtlname;
		this.faname = faname;
		this.kinname = kinname;
		this.carname = carname;
		this.memname = memname;
	}


	public Integer getKincode() {
		return kincode;
	}


	public void setKincode(Integer kincode) {
		this.kincode = kincode;
	}


	public Integer getCarcode() {
		return carcode;
	}


	public void setCarcode(Integer carcode) {
		this.carcode = carcode;
	}


	public Integer getTecode() {
		return tecode;
	}


	public void setTecode(Integer tecode) {
		this.tecode = tecode;
	}


	public String getCarnum() {
		return carnum;
	}


	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}


	public String getCarpay() {
		return carpay;
	}


	public void setCarpay(String carpay) {
		this.carpay = carpay;
	}


	public Integer getFayear() {
		return fayear;
	}


	public void setFayear(Integer fayear) {
		this.fayear = fayear;
	}


	public String getOilname() {
		return oilname;
	}


	public void setOilname(String oilname) {
		this.oilname = oilname;
	}


	public String getVtlname() {
		return vtlname;
	}


	public void setVtlname(String vtlname) {
		this.vtlname = vtlname;
	}


	public String getFaname() {
		return faname;
	}


	public void setFaname(String faname) {
		this.faname = faname;
	}


	public String getKinname() {
		return kinname;
	}


	public void setKinname(String kinname) {
		this.kinname = kinname;
	}


	public String getCarname() {
		return carname;
	}


	public void setCarname(String carname) {
		this.carname = carname;
	}


	public String getMemname() {
		return memname;
	}


	public void setMemname(String memname) {
		this.memname = memname;
	}


	@Override
	public String toString() {
		return "VehicleVO [kincode=" + kincode + ", carcode=" + carcode + ", tecode=" + tecode + ", carnum=" + carnum
				+ ", carpay=" + carpay + ", fayear=" + fayear + ", oilname=" + oilname + ", vtlname=" + vtlname
				+ ", faname=" + faname + ", kinname=" + kinname + ", carname=" + carname + ", memname=" + memname + "]";
	}

	
}
