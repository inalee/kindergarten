package com.yebin.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yebin.domain.CategoryVO;


@Repository
public class CategoryDAOImpl implements CategoryDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.yebin.mapper.fieldtripMapper";
	
	@Override
	public void insert(CategoryVO vo) {
		sqlSession.insert(namespace+".insertCategory", vo);
	}

	@Override
	public void selectOne(CategoryVO vo) {
//		sqlSession.selectOne()
		
	}

}
