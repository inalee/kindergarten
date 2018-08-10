package com.yebin.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.bson.Document;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.kinder.mongo.MongoUtil;
import com.mongodb.client.AggregateIterable;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;

@Service
public class MongoServiceImpl implements MongoService {

	private String dbname;
	private String colname;
	private JSONParser jsParser;
	private JSONObject jsObj;
	private Document doc;

	public MongoServiceImpl() {
	}

	@Override
	public void defaultSetting(String dbname, String colname) {
		setDbname(dbname);
		setColname(colname);
	}

	@Override
	public void insert(String jsonString) {
		MongoCollection<Document> col = MongoUtil.getCollection(getDbname(), getColname());
		if (jsonString.contains("'")) {
			jsonString = jsonString.replaceAll("'", "\"");
		}

		jsParser = new JSONParser();
		try {
			jsObj = (JSONObject) jsParser.parse(jsonString);
			col.insertOne(new Document(jsObj));
		} catch (ParseException e) {
			e.getMessage();
		}
		System.out.println("[insert] DB: " + getDbname() + " Col: " + getColname() + " " + jsonString);
	}

	public void insertMany(String jsonString) {
		MongoCollection<Document> col = MongoUtil.getCollection(getDbname(), getColname());
		List<Document> docList = new ArrayList<>();

//		if (jsonString.contains("'")) {
//			jsonString = jsonString.replaceAll("'", "\"");
//		}
		
		if (jsonString.contains("\"")) {
			jsonString = jsonString.replaceAll("\"", "'");
		}

		if (jsonString.startsWith("[")) {
			jsonString = jsonString.substring(1, jsonString.lastIndexOf("]"));
		}
		
		if (jsonString.contains("!")) {
			jsonString = jsonString.replaceAll("!", " ");
		}

		String[] test = jsonString.split("},");
		for (int i = 0; i < test.length; i++) {
			test[i] = test[i].concat("}").toString();
			System.out.println(test[i]);
			docList.add(new Document(Document.parse(test[i].toString())));
		}

		col.insertMany(docList);
		System.out.println("[insertMany] DB: " + getDbname() + " Col: " + getColname() + " " + jsonString);

	}

	@Override
	public void insertWithDate(String jsonString, String dateKeyName) {
		MongoCollection<Document> col = MongoUtil.getCollection(getDbname(), getColname());
		if (jsonString.contains("'")) {
			jsonString = jsonString.replaceAll("'", "\"");
		}

		jsParser = new JSONParser();
		try {
			jsObj = (JSONObject) jsParser.parse(jsonString);
			col.insertOne(new Document(jsObj));
			col.updateOne(Filters.eq(dateKeyName, "null"), Updates.set(dateKeyName, new Date()));
		} catch (ParseException e) {
			e.getMessage();
		}
		System.out.println("[insertWithDate] " + jsonString);

	}

	@Override
	public List<Document> findAll() {
		MongoCollection<Document> col = MongoUtil.getCollection(getDbname(), getColname());
		FindIterable<Document> findIter = col.find();
		Iterator<Document> iter = findIter.iterator();
		List<Document> list = Lists.newArrayList(iter);
		System.out.println("[find] " + list);
		return list;
	}

	@Override
	public List<Document> findwithFilter(String projectionStr, String filterKey, String filterValue) {
		MongoCollection<Document> col = MongoUtil.getCollection(getDbname(), getColname());
		FindIterable<Document> findIter = col.find(Filters.eq(filterKey, filterValue)).projection(Document.parse(projectionStr));
		Iterator<Document> iter = findIter.iterator();
		List<Document> list = Lists.newArrayList(iter);
		System.out.println("[findWithFilter] " + list);
		return list;
	}

	@Override
	public List<Document> findRecentDate(String memid) {
		MongoCollection<Document> col = MongoUtil.getCollection(getDbname(), getColname());
		FindIterable<Document> findIter = col.find(Filters.eq("memid", memid)).sort(Document.parse("{searchDate : -1}"))
				.limit(1);
		Iterator<Document> iter = findIter.iterator();
		List<Document> list = Lists.newArrayList(iter);
		System.out.println("[findRecentDate] " + list);
		return list;
	}

	@Override
	public List<Document> aggregate(String jsonString) {
		MongoCollection<Document> col = MongoUtil.getCollection(getDbname(), getColname());
		List<Document> pipeline = null;

		if (jsonString.contains("'")) {
			jsonString = jsonString.replaceAll("'", "\"");
		}
		try {
			jsObj = (JSONObject) jsParser.parse(jsonString);
		} catch (ParseException e) {
			e.getStackTrace();
		}

		pipeline = Arrays.asList(new Document(jsObj));
		AggregateIterable<Document> aggre = col.aggregate(pipeline);
		List<Document> list = Lists.newArrayList(aggre);
		System.out.println("[aggregate] " + list);

		return list;
	}

	public Map<Object, Object> jsonForMongo(List<Document> list, String... strings) {
		MongoCollection<Document> col = MongoUtil.getCollection(getDbname(), getColname());
		// 가장 최신의 data만 가져와서 map에 저장
		Map<Object, Object> map = new HashMap<>();

		for (Document listDoc : list) {
			try {
				jsObj = (JSONObject) jsParser.parse(listDoc.toJson());
				System.out.println(jsObj);
				for (int i = 1; i < strings.length; i++) {
					map.put(strings[i], jsObj.get(strings[i]));
					System.out.println("키 : " + strings[i] + "값:" + jsObj.get(strings[i]));
				}

			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		return map;
	}
	
	@Override
	public Map<Object, Object> bsonToJson(List<Document> list) {
		// 가장 최신의 data만 가져와서 map에 저장
		Map<Object, Object> map = new HashMap<>();

		for (Document listDoc : list) {
			try {
				jsObj = (JSONObject) jsParser.parse(listDoc.toJson());
				for(Object key : jsObj.keySet()) {
					map.put(jsObj.get(key), jsObj.get(key));
//					System.out.println("키 : " + jsObj.get(key) + " 값:" + jsObj.get(key));

				}
			
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		return map;
	}
	

	public String getDbname() {
		return dbname;
	}

	public void setDbname(String dbname) {
		this.dbname = dbname;
	}

	public String getColname() {
		return colname;
	}

	public void setColname(String colname) {
		this.colname = colname;
	}
}
