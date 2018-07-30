package com.jiwon.mongo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.bson.Document;

import com.google.common.collect.Lists;
import com.kinder.mongo.MongoUtil;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;

public class MongoAttendCheck {
	// MongoDatabase에 date 입력
	public static void insertAttend(int kincode, int clcode, int ccode) {
		MongoCollection<Document> col = MongoUtil.getCollection("kinder", "atcheck");
		Document d = new Document();
		d.append("date", new Date()).append("kincode", kincode).append("clcode", clcode).append("ccode", ccode).append("state", "attend");
		col.insertOne(d);
	}
	public static void insertLeave(int kincode, int clcode, int ccode) {
		MongoCollection<Document> col = MongoUtil.getCollection("kinder", "atcheck");
		Document d = new Document();
		d.append("date", new Date()).append("kincode", kincode).append("clcode", clcode).append("ccode", ccode).append("state", "leave");
		col.insertOne(d);
	}
	
	public static List<Document> findAttend(int clcode, String today){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
		MongoCollection<Document> col = MongoUtil.getCollection("kinder", "atcheck");
		FindIterable<Document> findIter;
		String start = today + "T00:00:00Z";
		String end = today + "T23:59:59Z";
		try {
			findIter = col.find(Filters.and(Filters.gte("date", format.parse(start)), Filters.lte("date", format.parse(end)), Filters.eq("clcode", clcode))).sort(new Document("date", -1));
			Iterator<Document> iter = findIter.iterator();
			List<Document> list = Lists.newArrayList(iter);
			//System.out.println("find 결과 :" + list);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ArrayList<>();
	}
}
