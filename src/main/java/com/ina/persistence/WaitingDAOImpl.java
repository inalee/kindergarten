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
	
	@Override
	public List<Map<String, Object>> wait_list5(int gcode) {
		return sqlSession.selectList(namespace+".wait_list5",gcode);
	}
		
	@Override
	public void update_state(int encode) {
		sqlSession.update(namespace+".update_state",encode);
	}
	
	@Override
	public List<Map<String, Object>> regular_wait(int gcode) {
		return sqlSession.selectList(namespace+".select_regular",gcode);
	}
	
	@Override
	public List<Map<String, Object>> regular_wait2(int gcode) {
		return sqlSession.selectList(namespace+".select_regular2",gcode);
	}
	
	@Override
	public void update_regular_state(int re_encode) {
		sqlSession.update(namespace+".update_file_regular",re_encode);
	}
	
	@Override
	public List<Map<String, Object>> regular_wait3(int kincode) {
		return sqlSession.selectList(namespace+".sel_regular_list_te",kincode);
	}
}
