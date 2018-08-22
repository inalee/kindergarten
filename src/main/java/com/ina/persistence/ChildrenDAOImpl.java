package com.ina.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ina.domain.EnrollBean;
import com.ina.domain.EnrollVO;
import com.kinder.domain.ChildrenVO;


@Repository
public class ChildrenDAOImpl implements ChildrenDAO{
	
	 @Inject
	   private SqlSession sqlSession;
	   
	   private static final String namespace = "com.kinder.mapper.ina.inaMapper";

	
	@Override
	public void insertChild(ChildrenVO cv) {
		  sqlSession.insert(namespace+".ina_insertChild", cv);
	}
	
	
	@Override
	public int checkGid(String memid) {
		return sqlSession.selectOne(namespace+".gcode_select",memid);
	}
	
	@Override
	public List<ChildrenVO> childInfo(int gcode) {
		return sqlSession.selectList(namespace+".search_mychild",gcode);
		
	}
	
	@Override
	public void updateRank(ChildrenVO cv) {
		sqlSession.update(namespace+".update_rank",cv);
	}
	
	@Override
	public String search_child(int ccode) {
		return sqlSession.selectOne(namespace+".search_childname",ccode);
	}
	
	@Override
	public void enroll_kinder(EnrollBean eb) {
		sqlSession.insert(namespace+".p_enroll",eb);
	}

	
	@Override
	public EnrollVO result_enroll(EnrollBean eb) {
		return sqlSession.selectOne(namespace+".result_enroll",eb);
	}
	
	
	@Override
	public int Kin_num(int ccode) {
		return sqlSession.selectOne(namespace+".search_kinnum",ccode);
	}
	
	@Override
	public int same_kin(EnrollBean eb) {
		return sqlSession.selectOne(namespace+".same_kinder",eb);
	}
	
	@Override
	public ChildrenVO sel_child_info(int ccode) {
		return sqlSession.selectOne(namespace+".sel_child_info",ccode);
	}
}
