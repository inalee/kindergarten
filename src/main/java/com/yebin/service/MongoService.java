package com.yebin.service;

import java.util.List;
import java.util.Map;

import org.bson.Document;

public interface MongoService {
	
	
	// MongoDB 이름&컬렉션 이름 세팅
	public void defaultSetting (String dbname, String colname);
	// insert()
	public void insert(String jsonString);
	// insertMany()
	public void insertMany(String jsonString);
	// 날짜 형식이 있는 json insert()
	public void insertWithDate(String jsonString, String dateKeyName);
	// find()
	public List<Document> findAll();
	// findwithFilter()
	public List<Document> findwithFilter(String projectionStr, String filterKey, String filterValue);
	// 최근 데이터 입력순으로 find()
	public List<Document> findRecentDate(String memid);
	// aggregate()
	public List<Document> aggregate(String jsonString);
	// MongoDB에서 불러온 json을 parsing
	public Map<Object, Object> jsonForMongo(List<Document> list, String ...strings);
	//bson to json
	public Map<Object, Object> bsonToJson(List<Document> list);
}
