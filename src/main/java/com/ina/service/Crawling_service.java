package com.ina.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawling_service {


	public static void main(String[] args) {
		/*
		 * 페이지 주소를 전달하면 그 페이지의 이미지 경로와 파일이름 수집해서 Map<파일이름, 파일이름포함전체경로>
		 * 
		 */

		// 초기
		Elements emts = null;
		Elements emts2 = null;
		Map<String, String> contains = new HashMap<>();
		String url = "http://info.childcare.go.kr/info/pnis/search/preview/SafetyEducationCheckSlPu.jsp?flag=AE&STCODE_POP=11140000085&CRNAMETITLE=CJ%ED%82%A4%EC%A6%88%EB%B9%8C+%EC%96%B4%EB%A6%B0%EC%9D%B4%EC%A7%91";
		String name = null;

		String src = null;
		String src2 = null;
		
		try {
			// img 태그들을 emts
			emts = Jsoup.connect(url).get().select("table th");

			
			for (Element e : emts) {
				// 경로에서 파일이름만 추출
				src = e.text();
//
//					System.out.println(src);
					if(src.equals("이수 인원")) {
						name = e.nextElementSibling().text();
						contains.put(src, name);
				
					}
					else if(src.equals("소방대피 훈련 여부")) {
						name = e.nextElementSibling().text();
						contains.put(src, name);
					}
					else if(src.equals("훈련일자")) {
						name = e.nextElementSibling().text();
						contains.put(src, name);
					}
					else if(src.equals("가스점검 여부")) {
						name = e.nextElementSibling().text();
						contains.put(src, name);	
						contains.put("가스 점검일",e.nextElementSibling().nextElementSibling().nextElementSibling().text());
					}
					else if(src.equals("소방안전 점검 여부")) {
						name = e.nextElementSibling().text();
						contains.put(src, name);	
						contains.put("소방안전 점검일",e.nextElementSibling().nextElementSibling().nextElementSibling().text());
					}
					else if(src.equals("전기설비 점검 여부")) {
						name = e.nextElementSibling().text();
						contains.put(src, name);	
						contains.put("전기설비 점검일",e.nextElementSibling().nextElementSibling().nextElementSibling().text());
					}
					else if(src.equals("점검여부")) { //전기안전점검관리
						name = e.nextElementSibling().text();
						contains.put(src, name);	
						Element e2 = e.nextElementSibling().nextElementSibling().nextElementSibling();
						contains.put("전기안전점검관리점검일자",e2.text());
						contains.put("점검결과",e2.nextElementSibling().nextElementSibling().text());
					}	

			}
			

			
			emts2 = Jsoup.connect(url).get().select("table td");
			
			for (Element e2 : emts2) {
				src2 = e2.text();
				
				if(src2.equals("어린이집 안전공제회")) {
					contains.put("공제회가입현황/"+e2.nextElementSibling().text(), e2.nextElementSibling().nextElementSibling().text());	
				}
				else if(src2.equals("영유아 생명·신체보상(의무가입)")) {
					contains.put("영유아 생명·신체보상(의무가입)/"+e2.nextElementSibling().text(), e2.nextElementSibling().nextElementSibling().text());	
				}
				else if(src2.equals("화재(의무가입)")) {
					contains.put("화재(의무가입)/"+e2.nextElementSibling().text(), e2.nextElementSibling().nextElementSibling().text());	
				}
				else if(src2.equals("보육교직원 생명·신체")) {
					contains.put("보육교직원 생명·신체/"+e2.nextElementSibling().text(), e2.nextElementSibling().nextElementSibling().text());	
				}
				else if(src2.equals("가스배상 책임(집단급식소 운영)")) {
					contains.put("가스배상 책임(집단급식소 운영)/"+e2.nextElementSibling().text(), e2.nextElementSibling().nextElementSibling().text());	
				}
				else if(src2.equals("놀이시설 안전(옥외놀이터 설치)")) {
					contains.put("놀이시설 안전(옥외놀이터 설치)/"+e2.nextElementSibling().text(), e2.nextElementSibling().nextElementSibling().text());	
				}
				else if(src2.equals("통학버스 책임(차량운행시설)")) {
					contains.put("통학버스 책임(차량운행시설)/"+e2.nextElementSibling().text(), e2.nextElementSibling().nextElementSibling().text());	
				}
				else if(src2.equals("통학버스 종합(차량운행시설)")) {
					contains.put("통학버스 종합(차량운행시설)/"+e2.nextElementSibling().text(), e2.nextElementSibling().nextElementSibling().text());	
				}
			}
	
			for (String key : contains.keySet()) {
				System.out.printf("KEY : %s, VALUE : %s %n", key, contains.get(key));
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}