package com.ina.domain;

public class ChildrenVO {
	private int ccode;
	private int gcode;
	private int kincode;
	private int id; //반번호
	private String cname;
	private String cgen;
	private String caddress;
	private String cidnum;
	private int crank;
	private String cstate;
	private int cage;
	private String cperson;
	private String chobby;
	private String cinterest;
	private String ccaution;
	public int getCcode() {
		return ccode;
	}
	public void setCcode(int ccode) {
		this.ccode = ccode;
	}
	public int getGcode() {
		return gcode;
	}
	public void setGcode(int gcode) {
		this.gcode = gcode;
	}
	public int getKincode() {
		return kincode;
	}
	public void setKincode(int kincode) {
		this.kincode = kincode;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getCaddress() {
		return caddress;
	}
	public void setCaddress(String caddress) {
		this.caddress = caddress;
	}
	public String getCidnum() {
		return cidnum;
	}
	public void setCidnum(String cidnum) {
		this.cidnum = cidnum;
	}
	public int getCrank() {
		return crank;
	}
	public void setCrank(int crank) {
		this.crank = crank;
	}
	public String getCstate() {
		return cstate;
	}
	public void setCstate(String cstate) {
		this.cstate = cstate;
	}
	public int getCage() {
		return cage;
	}
	public void setCage(int cage) {
		this.cage = cage;
	}
	public String getCperson() {
		return cperson;
	}
	public void setCperson(String cperson) {
		this.cperson = cperson;
	}
	public String getChobby() {
		return chobby;
	}
	public void setChobby(String chobby) {
		this.chobby = chobby;
	}
	public String getCinterest() {
		return cinterest;
	}
	public void setCinterest(String cinterest) {
		this.cinterest = cinterest;
	}
	public String getCcaution() {
		return ccaution;
	}
	public void setCcaution(String ccaution) {
		this.ccaution = ccaution;
	}
	public ChildrenVO(int ccode, int gcode, int kincode, int id, String cname, String cgen, String caddress,
			String cidnum, int crank, String cstate, int cage, String cperson, String chobby, String cinterest,
			String ccaution) {
		super();
		this.ccode = ccode;
		this.gcode = gcode;
		this.kincode = kincode;
		this.id = id;
		this.cname = cname;
		this.cgen = cgen;
		this.caddress = caddress;
		this.cidnum = cidnum;
		this.crank = crank;
		this.cstate = cstate;
		this.cage = cage;
		this.cperson = cperson;
		this.chobby = chobby;
		this.cinterest = cinterest;
		this.ccaution = ccaution;
	}
	
	
	
	public ChildrenVO() {
		
	}

}
