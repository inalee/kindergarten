package com.yebin.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.bson.Document;
import org.springframework.stereotype.Service;

import com.yebin.util.JsonParse;

@Service
public class ApiServiceImpl implements ApiService {
	

	
	@Inject
	MongoService mongoService;

	@Override
	public StringBuffer programService(String term, String zone, String city, String date, String person) throws Exception {
		
		System.out.println("[분류]"+term+" [지역]"+zone+" [도시]"+city+" [운영시작일]"+date+" [인원]"+person);	  

		String line = "";
		StringBuffer sb = new StringBuffer();
		
		if( (!zone.equals("전국")) && city.equals("전체")) {
			mongoService.defaultSetting("kinder", "areacode");
			String projectionStr = "{zone : 0, _id: 0}";
			List<Document> cityList = mongoService.findwithFilter(projectionStr, "zone", zone);
			Map<Object, Object> map = mongoService.bsonToJson(cityList);
			
			for(Object key : map.keySet()) {
				StringBuilder urlBuilder = new StringBuilder("https://www.crezone.net/api/program/list.php?count=100&post_modified:desc"); /*URL*/
				urlBuilder.append("&" + URLEncoder.encode("term","UTF-8") + "=" + URLEncoder.encode(term, "UTF-8"));
				urlBuilder.append("&" + URLEncoder.encode("zone","UTF-8") + "=" + URLEncoder.encode(zone, "UTF-8"));
				urlBuilder.append("&" + URLEncoder.encode("city","UTF-8") + "=" + URLEncoder.encode(map.get(key).toString(), "UTF-8"));
//				urlBuilder.append("&" + URLEncoder.encode("do_date_start","UTF-8") + "=" + URLEncoder.encode(date, "UTF-8"));
			
				// url 읽어오기
				try (BufferedReader br = new BufferedReader(new InputStreamReader(new URL(urlBuilder.toString()).openStream(), "utf-8"))) {
					// html을 String으로 parsing
					while ((line = br.readLine()) != null) {
						
						if(!line.equals("[]") &&  line != null) {
							System.out.println(line);
							System.out.println(line.length() +" "+ line.lastIndexOf("]"));
							if(line.length() == line.lastIndexOf("]")+1) {
								line = line.substring(1, line.lastIndexOf("]"));
								sb.append(line + ",");							
							}
							
						}
					}
					
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("Get_Page 예외 : " + e.getMessage());
				}	

				
			}
			
			if(sb.length() > 0) {
				String string = "[" + sb.substring(0, sb.lastIndexOf(",")) +"]";
				System.out.println(string);
				sb.setLength(0);
				sb.append(string);
				System.out.println("전체 조회 : "+sb.toString());				
				return sb;
			}else {
				sb.append("[]");
				return sb;
			}

		}else {
			// 창의 프로그램 api 주소 : "https://www.crezone.net/api/program/list.php";
			StringBuilder urlBuilder = new StringBuilder("https://www.crezone.net/api/program/list.php?count=100&post_modified:desc"); /*URL*/
			urlBuilder.append("&" + URLEncoder.encode("term","UTF-8") + "=" + URLEncoder.encode(term, "UTF-8"));
//			urlBuilder.append("&" + URLEncoder.encode("do_date_start","UTF-8") + "=" + URLEncoder.encode(date, "UTF-8"));
			if(!zone.equals("전국")) {
				urlBuilder.append("&" + URLEncoder.encode("zone","UTF-8") + "=" + URLEncoder.encode(zone, "UTF-8"));	
				urlBuilder.append("&" + URLEncoder.encode("city","UTF-8") + "=" + URLEncoder.encode(city, "UTF-8"));			
			}
			
			// url 읽어오기
			try (BufferedReader br = new BufferedReader(new InputStreamReader(new URL(urlBuilder.toString()).openStream(), "utf-8"))) {
				// html을 String으로 parsing
				while ((line = br.readLine()) != null) {
						sb.append(line);
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Get_Page 예외 : " + e.getMessage());
			}	

		}
		
		System.out.println("그냥 조회 : " +sb.toString());
		return sb;
	}

	@Override
	public StringBuffer resourceService(String term, String zone, String city, String date, String person)
			throws Exception {
		// TODO 창의 자원 서비스 구성하기
		return null;
	}

	// API - Google 감성 단어 분석
	@Override
	public StringBuffer naturalLangService(String RequestJson) {
		StringBuffer sb = new StringBuffer();
		try {
			URL url = new URL("https://language.googleapis.com/v1/documents:analyzeSentiment?key=AIzaSyCTBxLzvLMvydsDG-3h9z-LuxpIJxROZt0");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			String input = "{'encodingType' : 'UTF8', 'document' : {'type' : 'PLAIN_TEXT', 'content' : '"+RequestJson+"'}}";
			OutputStream os = conn.getOutputStream();
			os.write(input.getBytes());
			os.flush();

//			if (conn.getResponseCode() != HttpURLConnection.HTTP_CREATED) {
//				throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode()+ conn.getResponseMessage());
//				
//			}

			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
			String output;
			System.out.println("Output from Server .... \n");
			while ((output = br.readLine()) != null) {
//				System.out.println(output);
				sb.append(output);
			}
			conn.disconnect();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return sb;
	}
	
	// 네이버 API - 검색하기
	public StringBuffer searchKeywords(String keywords) {
		   
		   StringBuffer response = new StringBuffer();
		   String clientId = "RndrNxky81OAivMWAUWx";//애플리케이션 클라이언트 아이디값";
	       String clientSecret = "NoqnD7XvVS";//애플리케이션 클라이언트 시크릿값";
	       
	       try {
	            String text = URLEncoder.encode(keywords, "UTF-8");
	            String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text; // json 결과
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("X-Naver-Client-Id", clientId);
	            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // 에러 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }
	            String inputLine;
	           
	            while ((inputLine = br.readLine()) != null) {
	                 response.append(inputLine);
	            }
	            br.close();
	            System.out.println(response.toString());
	            
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	        
		return response;
		
	}
	

}
