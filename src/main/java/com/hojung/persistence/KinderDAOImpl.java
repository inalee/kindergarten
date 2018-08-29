package com.hojung.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hojung.domain.KinsearchCri;
import com.kinder.domain.GuardianVO;
import com.kinder.domain.KindergartenVO;

@Repository
public class KinderDAOImpl implements KinderDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.kinder.mapper.hojungMapper";

	@Override
	public String getTime() {
		return sqlSession.selectOne(namespace+".getTime");
	}

	@Override
	public List<KindergartenVO> selectKinders_kw(KinsearchCri cri) throws Exception {
		return sqlSession.selectList(namespace+".selectKinders_kw",cri);
	}

	@Override
	public List<KindergartenVO> selectKinders_map(KinsearchCri cri) throws Exception {
		return sqlSession.selectList(namespace+".selectKinders_map",cri);
	}

	@Override
	public GuardianVO selectGuardian(String memid) throws Exception {
		return (GuardianVO) sqlSession.selectOne(namespace+".selectGuardian", memid);
	}
	
}
