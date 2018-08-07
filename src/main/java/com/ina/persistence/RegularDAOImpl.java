package com.ina.persistence;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ina.domain.Regular_finalVO;
import com.ina.domain.regular_recruitVO;
import com.kinder.domain.KindergartenVO;
import com.kinder.domain.SearchCri;



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
	
	@Override
	public List<Map<String, Object>> list_del_regular(int gcode) {
		return sqlSession.selectList(namespace+".list_del_regular",gcode);
	}
	
	@Override
	public void regular_final(Regular_finalVO rf) {
		sqlSession.update(namespace+".regular_fin",rf);
		
	}
	
	@Override
	public List<Map<String, Object>> final_list(int kincode) {
		return sqlSession.selectList(namespace+".regular_fin_list",kincode);
	}
	
	@Override
	public void no_file(int re_encode) {
		sqlSession.update(namespace+".no_file",re_encode);
	}
	
	@Override
	public List<Map<String, Object>> cancel_list(int kincode) {
		return sqlSession.selectList(namespace+".cancel_list",kincode);
	}
	
	@Override
	public List<Map<String, Object>> search_regular(SearchCri cri) {
		return sqlSession.selectList(namespace+".search_kinder_regular",cri);
	}

	
	@Override
	public void delete_regular(int recode) {
		sqlSession.selectList(namespace+".del_regular_2",recode);
	}

}
