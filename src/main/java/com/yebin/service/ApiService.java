package com.yebin.service;


public interface ApiService {

	//창의 프로그램 api 연결
	public StringBuffer programService(String term, String zone, String city, String date, String person) throws Exception;
	
	//창의 자원 api 연결
	public StringBuffer resourceService(String term, String zone, String city, String date, String person) throws Exception;

	//구글 감성언어 api 연결
	public StringBuffer naturalLangService(String RequestJson);
	
	//네이버 api 연결
	public StringBuffer searchKeywords(String keywords);
}
