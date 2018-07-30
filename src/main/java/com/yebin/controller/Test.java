package com.yebin.controller;

import java.util.Map;
import java.util.Locale.Category;

import com.yebin.domain.CategoryVO;
import com.yebin.service.CategoryService;
import com.yebin.service.CategoryServiceImpl;
import com.yebin.service.MongoService;
import com.yebin.service.MongoServiceImpl;

public class Test {

    public static void main(String[] args){
    	
    	MongoService ms = new MongoServiceImpl();
    	CategoryService cs = new CategoryServiceImpl();
    	CategoryVO catevo = new CategoryVO();
    	ms.defaultSetting("kinder", "programCategory");
    	Map<Object, Object> map = ms.jsonParsing(ms.find(), "catemain", "catesub");
    			
    	String[] termSplit = null;
		for(Object key : map.keySet()) {
			if(key.equals("catemain")) {
				catevo.setCatemain(termSplit[0]);
				catevo.setCatesub(termSplit[1]);
				cs.insertCategory(catevo);
			}
		}
		
    	
    	
    	
    	
    	
        // JsonParser 테스트
//    	String jsonString = "{\"name\" : \"hello\"}";
//    	JSONParser jps = new JSONParser();
//    	JSONObject jso;
//		try {
//			jso = (JSONObject) jps.parse(jsonString);
//			System.out.println(jso.get("name"));
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			e.getMessage();
//		}
		
        
        
    }
}