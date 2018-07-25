package com.ina.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;



@Repository
public class WaitingDAOImpl implements WaitingDAO{
	
	 @Inject
	   private SqlSession sqlSession;
	   
	   private static final String namespace = "com.kinder.mapper.ina.inaMapper";

	
	@Override
	public List<Map<String, Object>> wait_list(int gcode) {
		return sqlSession.selectList(namespace+".wait_list",gcode);
	}
	
	@Override
	public List<Map<String, Object>> wait_list2(int gcode) {
		return sqlSession.selectList(namespace+".wait_list2",gcode);
	}
	
	@Override
	public List<Map<String, Object>> wait_list3(int gcode) {
		return sqlSession.selectList(namespace+".wait_list3",gcode);
	}
	
	@Override
	public List<Map<String, Object>> wait_list4(int kincode) {
		return sqlSession.selectList(namespace+".wait_list4",kincode);
	}
	
}
