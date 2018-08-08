package com.jiwon.service;



import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Service;

@Service
public class JapiServiceImpl implements JapiService {

	@Override
	public StringBuffer youtubeService(String apiURL) throws Exception {
		//System.out.println("apiURL : " + apiURL);
		URL url = new URL(apiURL);
		 HttpURLConnection con = (HttpURLConnection) url.openConnection();
		 con.setRequestMethod("GET");
		 int responseCode = con.getResponseCode();
		 BufferedReader br;
		 if (responseCode == 200) { // 정상 호출
			 br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		 } else { // 에러 발생
			 br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		 }
		 String inputLine;
		 StringBuffer res = new StringBuffer();
		 while ((inputLine = br.readLine()) != null) {
			 res.append(inputLine);
		 }
		 
		return res;
	}


}
