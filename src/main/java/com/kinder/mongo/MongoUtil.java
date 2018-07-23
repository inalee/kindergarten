package com.kinder.mongo;

import java.util.Date;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.bson.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.kinder.domain.MemberVO;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class MongoUtil {
 private static final Logger logger = LoggerFactory.getLogger(MongoUtil.class);
 // 변수
 private static MongoClient mgc;

 // MongoClient 가져오기
 public static MongoClient getMondb() {
  if (mgc == null) {
   try {
    mgc = new MongoClient("localhost", 27017);
   } catch (Exception e) {
    logger.error("getMondb : " + e.getMessage());
    
   }
  }
  return mgc;
 }
 
 // MongoDatabase 가져오기
 public static MongoDatabase getDb(String dbname) {
  return getMondb().getDatabase(dbname);
 }
 
 // Collection 가져오기;
 public static MongoCollection<Document> getCollection(String dbname, String colname) {
  return getDb(dbname).getCollection(colname);
 }
 //MongoDatabase에 date 입력
public static void kinderlog(HttpServletRequest request, 
	HttpSession session) {
	
	String loginmem = null;;
	String key = null;
    String uri = request.getRequestURI();
    
    if(uri.contains("tmain")|| uri.contains("tmenu")) {
      key = "teacher";
      loginmem = "tlogin";
  } else if(uri.contains("gmain")|| uri.contains("gmenu")) {
	  key = "guardian";
	  loginmem = "glogin";
  }

    if(!(Objects.isNull(key))) {
    	MemberVO vo = (MemberVO) session.getAttribute(loginmem);
		MongoCollection<Document> col = MongoUtil.getCollection("kinder", "kinderlog");
		Document d = new Document();
		
		d.append("div", key).append("date", new Date()).append("uri", request.getRequestURI())
		.append("memid", vo.getMemid()).append("memname", vo.getMemname());
		col.insertOne(d);
    }
		
	}

}
