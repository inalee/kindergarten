package com.yebin.util;

import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class JsonParse {

	public static Map<String, Map<String, Object>> jsonToMap(String[] arrays) {

		JSONParser jsParser = new JSONParser();
		JSONObject jsObj = new JSONObject();
		String tempStr = null;

		// 타이틀로 키&값을 찾을 수 있는 맵
		Map<String, Map<String, Object>> completeMap = new HashMap<>();

		// 키 & 값을 저장할 맵
		Map<String, Object> jsonMap = null;

		for (int i = 0; i < arrays.length; i++) {
			
			jsonMap = new TreeMap<>();
//			'title' : '[강원] Clue, Time, Speed ', 'website' 
			if (arrays[i].contains("\"")) {
				arrays[i] = arrays[i].replaceAll("\"", "");
			}

			if (arrays[i].contains("'")) {
				arrays[i] = arrays[i].replaceAll("'", "\"");
			}

			try {
				jsObj = (JSONObject) jsParser.parse(arrays[i]);	
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			for (Object key : jsObj.keySet()) {
				System.out.println("키 : " + key.toString() + " 값:" + jsObj.get(key));
				jsonMap.put(key.toString(), jsObj.get(key));
			}
			completeMap.put(jsonMap.get("title").toString(), jsonMap); // 컴플리트 맵에 넣어버리고
//			System.out.println("-----------함수 컴플리트맵키값 : " + jsonMap.get("title") + "----들어있는거?" + jsonMap);
		}
		
//		for (String kk : completeMap.keySet()) {
//			System.out.println("컴플리트 키 : " + kk + " 컴플리트 값: " + completeMap.get(kk) + " 컴플리트 값의 값 :"
//					+ completeMap.get(kk).get("website"));
//		}

		return completeMap;
	}

}
