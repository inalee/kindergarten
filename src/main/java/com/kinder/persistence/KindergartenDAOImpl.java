package com.kinder.persistence;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	
}
