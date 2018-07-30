package com.yebin.mongo;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.bson.BSON;
import org.bson.BSONObject;
import org.bson.Document;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.common.collect.Lists;
import com.kinder.mongo.MongoUtil;
import com.mongodb.client.AggregateIterable;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;
import com.sun.net.httpserver.Filter;

public class JsonParse {

	private JSONParser jsParser;
	private JSONObject jsObject;
	private Document doc;
	
	private JsonParse() {}
	
	public static JsonParse getInstance() {
		return new JsonParse();
	}

	// MongoDB InsertWithDate 메서드
	public void insertWithDate(String dbname, String colname, String jsonString, String dateKeyName) {
		MongoCollection<Document> col = MongoUtil.getCollection(dbname, colname);
		jsParser = new JSONParser();
		jsObject = new JSONObject();

		if (jsonString.contains("'")) {
			jsonString = jsonString.replaceAll("'", "\"");
		}

		try {
			jsObject = (JSONObject) jsParser.parse(jsonString);
//			System.out.println("jsonObj :" + jsObject);
			doc = new Document(jsObject);
			System.out.println(jsObject);
			col.insertOne(doc);
			col.updateOne(Filters.eq(dateKeyName, "null"), Updates.set(dateKeyName,new Date()));				
			
		} catch (ParseException e) {
			e.getMessage();
		}
		System.out.println("변환된 스트링 저장: " + jsonString);
	
		FindIterable<Document> findIter = col.find();
		Iterator<Document> iter = findIter.iterator();
		List<Document> list = Lists.newArrayList(iter);
		 System.out.println("find 결과 :" + list);

	}
	
	// MongoDB Insert 메서드
	public void insert(String dbname, String colname, String jsonString) {
		MongoCollection<Document> col = MongoUtil.getCollection(dbname, colname);
		jsParser = new JSONParser();
		jsObject = new JSONObject();

		if (jsonString.contains("'")) {
			jsonString = jsonString.replaceAll("'", "\"");
		}

		try {
			jsObject = (JSONObject) jsParser.parse(jsonString);
//			System.out.println("jsonObj :" + jsObject);
			doc = new Document(jsObject);
			System.out.println(jsObject);
			col.insertOne(doc);
		} catch (ParseException e) {
			e.getMessage();
		}
		System.out.println("변환된 스트링: " + jsonString);

		FindIterable<Document> findIter = col.find();
		Iterator<Document> iter = findIter.iterator();
		List<Document> list = Lists.newArrayList(iter);
		 System.out.println("find 결과 :" + list);

	}

	// db.find() 메서드
	public List<Document> find(String dbname, String colname) {
		MongoCollection<Document> col = MongoUtil.getCollection(dbname, colname);
		jsParser = new JSONParser();
		jsObject = new JSONObject();

		FindIterable<Document> findIter = col.find();
		Iterator<Document> iter = findIter.iterator();
		List<Document> list = Lists.newArrayList(iter);
//		System.out.println("find 결과 :" + list);
		return list;
	}
	
	// db.findDate() 메서드
	public List<Document> findRecentDate(String dbname, String colname, String memid) {
		MongoCollection<Document> col = MongoUtil.getCollection(dbname, colname);
		jsParser = new JSONParser();
		jsObject = new JSONObject();

		FindIterable<Document> findIter = col.find(Filters.eq("memid", memid)).sort(Document.parse("{searchDate : -1}"));
		Iterator<Document> iter = findIter.iterator();
		List<Document> list = Lists.newArrayList(iter);
		System.out.println("find 결과 :" + list);
		return list;
	}

//	find({memid : 'teacher'}).sort({searchDate : -1})
	
	// db.aggregate() 메서드
	public List<Document> aggregate(String dbname, String colname, String jsonString) {
		MongoCollection<Document> col = MongoUtil.getCollection(dbname, colname);
		jsParser = new JSONParser();
		jsObject = new JSONObject();

		List<Document> pipeline = null;

		if (jsonString.contains("'")) {
			jsonString = jsonString.replaceAll("'", "\"");
		}
		try {
			jsObject = (JSONObject) jsParser.parse(jsonString);
			

		} catch (ParseException e) {
			e.getStackTrace();
		}

		doc = new Document(jsObject);
		pipeline = Arrays.asList(doc);

		AggregateIterable<Document> aggre = col.aggregate(pipeline);
		List<Document> list = Lists.newArrayList(aggre);
		System.out.println("aggregate 결과 :" + list);
		return list;
	}

	public String timeNow() {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.HOUR_OF_DAY, 9);
		String[] mongoDate = { "ISODate('", "T", "')" };
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm:ss");

		String date = mongoDate[0] + sdf.format(cal.getTime()) + mongoDate[1] + sdf1.format(cal.getTime()) + mongoDate[2];

		System.out.println(date);
		return date.toString();
	}

		
	}


