package com.hojung.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hojung.domain.KidscafeunfitCri;

@Repository
public class KidscafeDAOImpl implements KidscafeDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.kinder.mapper.hojungMapper";

	@Override
	public String getTime() {
		return sqlSession.selectOne(namespace+".getTime");
	}

	@Override
	public List<Integer> unfitKidscafes(KidscafeunfitCri cri) throws Exception {
		return sqlSession.selectList(namespace+".unfitKidscafes",cri);
	}
	
}
