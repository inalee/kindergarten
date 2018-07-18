package com.ina.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

}
