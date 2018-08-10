package com.ina.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ina.domain.EnrollVO;
import com.ina.domain.RegularEnrollVO;



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
	public void update_state(EnrollVO ev) {
		sqlSession.update(namespace+".update_state",ev);
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
	public void update_regular_state(RegularEnrollVO rev) {
		sqlSession.update(namespace+".update_file_regular",rev);
	}
	
	
	@Override
	public List<Map<String, Object>> regular_wait3(int kincode) {
		return sqlSession.selectList(namespace+".sel_regular_list_te",kincode);
	}
	
	@Override
	public RegularEnrollVO select_files(int re_encode) {
		return sqlSession.selectOne(namespace+".file_down2",re_encode);
	}
	
}
