package com.ina.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class crawling {
	public static void main(String[] args) {
		Elements emts = null;
		Map<String, String> imgs = new HashMap<>();
		String url = "https://map.naver.com/local/siteview.nhn?code=36225193";
		String filename = null;
		String fullpath = null;
		String src = null;
		// parsing
		try {
			// img 태그들을 emts
			emts = Jsoup.connect(url).get().select("html");
			System.out.println(emts);
			for (Element e : emts) {
				// 경로에서 파일이름만 추출
				src = e.text();
				// 기존에 존재하면 추가하지 않음
				fullpath = imgs.get(filename);

//				if (Objects.isNull(fullpath)) {
//					imgs.put(filename, src);
//				}
				// 출력
//				for (String key : imgs.keySet()) {
//					System.out.printf("KEY : %s, VALUE : %s %n", key, imgs.get(key));
//				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
}

		
