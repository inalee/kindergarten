package com.ina.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ina.domain.EnrollVO;



@Repository
public class EnrollManageDAOImpl implements EnrollManageDAO{
	
	 @Inject
	   private SqlSession sqlSession;
	   
	   private static final String namespace = "com.kinder.mapper.ina.inaMapper";


	 @Override
	public List<Map<String, Object>> enroll_list(int kincode) {
		return sqlSession.selectList(namespace+".enroll_list",kincode);
	}
	   
	@Override
	public void modify_status(EnrollVO ev) {
		sqlSession.update(namespace+".enroll_state_modify",ev);
	}
	
	@Override
	public List<Map<String, Object>> enroll_list2(int kincode) {
		return sqlSession.selectList(namespace+".enroll_list2",kincode);
	}
	
	@Override
	public List<Map<String, Object>> enroll_list3(int kincode) {
		return sqlSession.selectList(namespace+".enroll_list3",kincode);
	}
	
	@Override
	public void p_manage_enroll(EnrollVO ev) {
		sqlSession.update(namespace+".p_manage_enroll",ev);
	}
	
	@Override
	public void enroll_delete(int encode) {
		sqlSession.update(namespace+".del_enroll",encode);
	}
	
}
