package com.kinder.persistence;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kinder.domain.ChildrenVO;
import com.kinder.domain.ClassVO;
import com.kinder.domain.KindergartenVO;
import com.kinder.domain.SearchCri;

@Repository
public class KindergartenDAOImpl implements KindergartenDAO{
	
	 @Inject
	   private SqlSession sqlSession;
	   
	   private static final String namespace = "com.kinder.mapper.memberMapper";

	
	@Override
	public List<KindergartenVO> searchKinder(SearchCri cri) {
		return sqlSession.selectList(namespace+".search_kinder",cri);
	}

	@Override
	public KindergartenVO searchKinder2(int kincode) {
		return sqlSession.selectOne(namespace+".search_kinder2", kincode);
	}
	
	
	@Override
	public void make_class(ClassVO cv) {
		sqlSession.selectOne(namespace+".insert_class", cv);
	}
	
	@Override
	public List<ChildrenVO> select_kinder_child(int kincode) {
		return sqlSession.selectList(namespace+".select_kinder_child",kincode);
	}
	
	
	@Override
	public List<ClassVO> select_class(int kincode) {
		return sqlSession.selectList(namespace+".kinder_class",kincode);
	}
	
	
	@Override
	public void update_class(ChildrenVO cv) {
		sqlSession.selectOne(namespace+".update_class", cv);
	}
}
