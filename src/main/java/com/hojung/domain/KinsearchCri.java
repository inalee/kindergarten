package com.hojung.domain;

import java.util.Arrays;

public class KinsearchCri {

	private int sigungucode;
	private String kinname;
	private int[] kinkind_lists;
	private int vacancy;
	private int kinshuttle;
	private int[] kinmax;
	
	public KinsearchCri() {
		super();
	}

	public KinsearchCri(int sigungucode, String kinname, int[] kinkind_lists, int vacancy, int kinshuttle,
			int[] kinmax) {
		super();
		this.sigungucode = sigungucode;
		this.kinname = kinname;
		this.kinkind_lists = kinkind_lists;
		this.vacancy = vacancy;
		this.kinshuttle = kinshuttle;
		this.kinmax = kinmax;
	}

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

	public int[] getKinkind_lists() {
		return kinkind_lists;
	}

	public void setKinkind_lists(int[] kinkind_lists) {
		this.kinkind_lists = kinkind_lists;
	}

	public int getVacancy() {
		return vacancy;
	}

	public void setVacancy(int vacancy) {
		this.vacancy = vacancy;
	}

	public int getKinshuttle() {
		return kinshuttle;
	}

	public void setKinshuttle(int kinshuttle) {
		this.kinshuttle = kinshuttle;
	}

	public int[] getKinmax() {
		return kinmax;
	}

	public void setKinmax(int[] kinmax) {
		this.kinmax = kinmax;
	}

	@Override
	public String toString() {
		return "KinsearchCri [sigungucode=" + sigungucode + ", kinname=" + kinname + ", kinkind_lists="
				+ Arrays.toString(kinkind_lists) + ", vacancy=" + vacancy + ", kinshuttle=" + kinshuttle + ", kinmax="
				+ Arrays.toString(kinmax) + "]";
	}
	
	
}
