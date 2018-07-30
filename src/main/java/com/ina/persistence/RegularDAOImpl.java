package com.ina.persistence;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.ina.domain.regular_recruitVO;
import com.kinder.domain.KindergartenVO;



@Repository
public class RegularDAOImpl implements RegularDAO{
	
	 @Inject
	   private SqlSession sqlSession;
	   
	   private static final String namespace = "com.kinder.mapper.ina.inaMapper";

	
	@Override
	public void make_regular(regular_recruitVO rrv) {
		sqlSession.insert(namespace+".regular_enroll",rrv);
	}
	
	@Override
	public List<regular_recruitVO> list_regular(int kincode) {
		return sqlSession.selectList(namespace+".regular_list",kincode);
	}
	
	@Override
	public List<Map<String, Object>> list_regular_par() {
		return sqlSession.selectList(namespace+".regular_list_par");
	}
	
	
	@Override
	public regular_recruitVO detail_regular(int recode) {
		return sqlSession.selectOne(namespace+".regular_detail",recode);
	}
	
	@Override
	public KindergartenVO kinder_info(int kincode) {
		return sqlSession.selectOne(namespace+".all_kinder",kincode);
	}
	
}
