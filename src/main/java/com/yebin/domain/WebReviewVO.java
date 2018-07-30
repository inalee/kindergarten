package com.yebin.domain;

public class WebReviewVO {

	private int revcode;
	private String revaddr;
	private int revpos;
	private int revneg;

	public WebReviewVO() {
	}

	public WebReviewVO(int revcode, String revaddr, int revpos, int revneg) {
		super();
		this.revcode = revcode;
		this.revaddr = revaddr;
		this.revpos = revpos;
		this.revneg = revneg;
	}

	public int getRevcode() {
		return revcode;
	}

	public void setRevcode(int revcode) {
		this.revcode = revcode;
	}

	public String getRevaddr() {
		return revaddr;
	}

	public void setRevaddr(String revaddr) {
		this.revaddr = revaddr;
	}

	public int getRevpos() {
		return revpos;
	}

	public void setRevpos(int revpos) {
		this.revpos = revpos;
	}

	public int getRevneg() {
		return revneg;
	}

	public void setRevneg(int revneg) {
		this.revneg = revneg;
	}

}
