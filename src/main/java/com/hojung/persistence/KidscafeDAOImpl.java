package com.hojung.persistence;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hojung.domain.KidscafeVO;
import com.hojung.domain.KidscafesearchCri;
import com.hojung.domain.KidscafesumCri;

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
	public List<KidscafeVO> selectKidscafes(KidscafesearchCri cri) throws Exception {
		return sqlSession.selectList(namespace+".selectKidscafes",cri);
	}

	@Override
	public KidscafeVO selectOneKidscafe(int cfcode) throws Exception {
		return (KidscafeVO)sqlSession.selectOne(namespace+".selectOneKidscafe", cfcode);
	}

	@Override
	public List<KidscafesumCri> selectResSum(KidscafesumCri cri) throws Exception {
		return sqlSession.selectList(namespace+".selectResSum", cri);
	}
	
}
