package com.yebin.controller;

public class Test {

	public static void main(String[] args) {
		
		String a = "<div class='approvalForm'>\r\n" + 
				"	<table class='formTable' border='1' collapse='1' align=\"center\">\r\n" + 
				"	<th rowspan=\"2\" colspan=\"6\" width=\"500px\" ><h1>체험학습 진행 계획서</h1></th>\r\n" + 
				"	<th width='150px' style='background-color: #f7f6f6;'>담 임</th>\r\n" + 
				"	<th width='150px' style='background-color: #f7f6f6;'>원 장</th>\r\n" + 
				"	<tr><td height=\"50px\" id='teacher'></td><td height=\"50px\" id='master'></td></tr>\r\n" + 
				"	<tr><td class=\"subcate\" colspan=\"2\" width=\"20%\">일 시</td><td colspan=\"7\" id='date'></td></tr>\r\n" + 
				"	<tr><td class=\"subcate\" colspan=\"2\">분 류</td>\r\n" + 
				"		<td colspan=\"3\" id='catemain'></td>\r\n" + 
				"		<td colspan=\"1\" width=\"100px\" class=\"subcate\">소 분 류</td>\r\n" + 
				"		<td colspan=\"3\" id='catesub'></td></tr>			\r\n" + 
				"	<tr><td class=\"subcate\" id = 'subcategr'colspan=\"1\" rowspan=\"2\" width=\"10px\">장 소</td>\r\n" + 
				"		<td class=\"subcate\" colspan=\"1\" >견 학 지</td>\r\n" + 
				"		<td colspan=\"3\" id='mainplace'></td>\r\n" + 
				"		<td colspan=\"1\" width=\"100px\" class=\"subcate\">주 소</td>\r\n" + 
				"		<td colspan=\"3\" id='mainaddr'></td></tr>\r\n" + 
				"	<tr><td class='subcate' colspan='1'>관 광 지</td><td colspan='3' id='subplace'></td>\r\n" + 
				"	<td colspan='1' width='100px' class='subcate'>주 소</td><td colspan='3' id='subaddr'></td>\r\n" + 
				"	</tr>\r\n" + 
				"	<tr><td class=\"subcate\" colspan=\"2\">대 상</td>\r\n" + 
				"		<td colspan=\"7\" id='class'></td></tr>		\r\n" + 
				"	<tr><td class=\"subcate\" colspan=\"2\">인 원</td>\r\n" + 
				"		<td colspan=\"7\" id='person'></td></tr>\r\n" + 
				"	<tr><td class=\"subcate\" colspan=\"2\">준비물</td>\r\n" + 
				"		<td colspan=\"7\" id='materials'></td></tr>\r\n" + 
				"	<tr><td class=\"subcate\" colspan=\"9\">견 학 목 적</td></tr>\r\n" + 
				"	<tr><td colspan=\"9\" style=\"height: 100px\">\r\n" + 
				"		<textarea class=\"remarks\" id='apvpurpose' placeholder=\"견학 목적을 작성해 주세요.\" style='font-size: 24px;'></textarea></td></tr>\r\n" + 
				"	<tr><td class=\"subcate\" colspan=\"9\">견 학 계 획</td></tr>\r\n" + 
				"	<tr><td colspan=\"9\" style=\"height: 200px\">\r\n" + 
				"		<textarea class=\"remarks\" id= 'apvremarks' placeholder=\"견학 계획을 작성해 주세요.\" style='font-size: 24px;'></textarea></td></tr>\r\n" + 
				"	<tr><td class=\"subcate\" colspan=\"9\"><p>위 와 같이 체험학습을 진행하고자 하오니 결재 바랍니다.<br><p>\r\n" + 
				"	<script>\r\n" + 
				"	var date = new Date();\r\n" + 
				"	document.write(date.getFullYear()+\"년 \"+(date.getMonth()+1) +\"월 \"+date.getDate()+\"일\");\r\n" + 
				"	</script></td></tr>			\r\n" + 
				"	</table>	\r\n" + 
				"	</div>";
		
		if(a.contains("\"")) {
			a = a.replace("\"", "\'");
			System.out.println(a);
		}
		

	}

}

// {"date":"2018-08","zone":"지역없음","city":"도시없음","person":"0","searchDate":{"$date":1533026357381},"term":"역사체험-창의적체험활동","_id":{"$oid":"5b602035084ce64a102ecd28"},"memid":"teacher"}

// ArrayList<String> list = new ArrayList<>();
//
// list.add("{'title' : '[경기][성남문화재단]미술관에서', 'website' :
// 'http://www.sncf.or.kr/', 'address' : '경기도 성남시 분당구 성남대로 808 (야탑동)', 'apply' :
// '-', 'do' : '2018-06-23~2018-09-08'}");
// list.add("{'title' : '[경기] [2018-대박협사업] 도전, 사색 탐사대 - 지도를 들고 뛰어라 ', 'website'
// : 'https://oldmaps.khu.ac.kr', 'address' : '경희대학교 혜정박물관', 'apply' :
// '2018-07-09~2018-11-30', 'do' : '2018-07-09~2018-11-30'}");

// System.out.println(list);

// JSONParser jps = new JSONParser();
// JSONObject jso;
//
// for(String li : list) {
// System.out.println(li);
// if(li.contains("'")) {
// li = li.replaceAll("'", "\"");
// }
// try {
// jso = (JSONObject) jps.parse(li);
// System.out.println("파싱결과" + jso.get("title"));
// } catch (ParseException e) {
// // TODO Auto-generated catch block
// e.printStackTrace();
// e.getMessage();
// }
//
//
//
// }
//
// }
//

// 몽고에 데이터 넣는 테스트
// MongoService ms = new MongoServiceImpl();
// CategoryService cs = new CategoryServiceImpl();
// CategoryVO catevo = new CategoryVO();
// ms.defaultSetting("kinder", "programCategory");
// Map<Object, Object> map = ms.jsonForMongo(ms.find(), "catemain", "catesub");
//
// String[] termSplit = null;
// for(Object key : map.keySet()) {
// if(key.equals("catemain")) {
// catevo.setCatemain(termSplit[0]);
// catevo.setCatesub(termSplit[1]);
// cs.insertCategory(catevo);
// }
// }

// JsonParser 테스트
// String jsonString = "{\"name\" : \"hello\"}";
// JSONParser jps = new JSONParser();
// JSONObject jso;
// try {
// jso = (JSONObject) jps.parse(jsonString);
// System.out.println(jso.get("name"));
// } catch (ParseException e) {
// // TODO Auto-generated catch block
// e.printStackTrace();
// e.getMessage();
// }

// }