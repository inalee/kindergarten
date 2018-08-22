package com.yebin.controller;


    	
//    	{"date":"2018-08","zone":"지역없음","city":"도시없음","person":"0","searchDate":{"$date":1533026357381},"term":"역사체험-창의적체험활동","_id":{"$oid":"5b602035084ce64a102ecd28"},"memid":"teacher"}

//    	ArrayList<String> list = new ArrayList<>();
//    	
//    	list.add("{'title' : '[경기][성남문화재단]미술관에서', 'website' : 'http://www.sncf.or.kr/', 'address' : '경기도 성남시 분당구 성남대로 808 (야탑동)', 'apply' : '-', 'do' : '2018-06-23~2018-09-08'}");
//    	list.add("{'title' : '[경기] [2018-대박협사업] 도전, 사색 탐사대 - 지도를 들고 뛰어라 ', 'website' : 'https://oldmaps.khu.ac.kr', 'address' : '경희대학교 혜정박물관', 'apply' : '2018-07-09~2018-11-30', 'do' : '2018-07-09~2018-11-30'}");
    	
//    	System.out.println(list);

//    	JSONParser jps = new JSONParser();
//    	JSONObject jso;
//    	
//    	for(String li : list) {
//    		System.out.println(li);
//    		if(li.contains("'")) {
//    			li = li.replaceAll("'", "\"");
//    		}
//    		try {
//    			jso = (JSONObject) jps.parse(li);
//    			System.out.println("파싱결과" + jso.get("title"));
//    		} catch (ParseException e) {
//    			// TODO Auto-generated catch block
//    			e.printStackTrace();
//    			e.getMessage();
//    		}
//        	
//    		
//    		
//    	}
//    
//    }
//    	
    	
    	
    	
    	
    	
    	
    	// 몽고에 데이터 넣는 테스트
//    	MongoService ms = new MongoServiceImpl();
//    	CategoryService cs = new CategoryServiceImpl();
//    	CategoryVO catevo = new CategoryVO();
//    	ms.defaultSetting("kinder", "programCategory");
//    	Map<Object, Object> map = ms.jsonForMongo(ms.find(), "catemain", "catesub");
//    			
//    	String[] termSplit = null;
//		for(Object key : map.keySet()) {
//			if(key.equals("catemain")) {
//				catevo.setCatemain(termSplit[0]);
//				catevo.setCatesub(termSplit[1]);
//				cs.insertCategory(catevo);
//			}
//		}
		
    	
    	
    	
    	
    	
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
		

//}