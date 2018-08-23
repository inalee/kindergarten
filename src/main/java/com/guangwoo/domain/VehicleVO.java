package com.guangwoo.domain;

public class VehicleVO {

	private Integer kincode;
	private Integer carcode;
	private String carnum;
	private Integer carpay;
	private Integer fayear;
	private String oilname;
	private String vtlname;
	private String faname;
	private String kinname;
	private String carname;
	
	public VehicleVO() {
		super();
	}

	public VehicleVO(Integer kincode, Integer carcode, String carnum, Integer carpay,
			Integer fayear, String oilname, String vtlname, String faname, String kinname,
			String carname) {
		super();
		this.kincode = kincode;
		this.carcode = carcode;
		this.carnum = carnum;
		this.carpay = carpay;
		this.fayear = fayear;
		this.oilname = oilname;
		this.vtlname = vtlname;
		this.faname = faname;
		this.kinname = kinname;
		this.carname = carname;
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

	public String getCarnum() {
		return carnum;
	}

	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}

	public Integer getCarpay() {
		return carpay;
	}

	public void setCarpay(Integer carpay) {
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

	@Override
	public String toString() {
		return "VehicleVO [kincode=" + kincode + ", carcode=" + carcode + ", carnum=" + carnum
				+ ", carpay=" + carpay + ", fayear=" + fayear + ", oilname=" + oilname
				+ ", vtlname=" + vtlname + ", faname=" + faname + ", kinname=" + kinname
				+ ", carname=" + carname + "]";
	}
	
	


	
	
}
