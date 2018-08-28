package com.hojung.persistence;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hojung.domain.KidscafeVO;
import com.hojung.domain.KidscafesearchCri;
import com.hojung.domain.KidscafesumCri;
import com.hojung.domain.MyresVO;

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
	
	@Override
	public List<MyresVO> selectMyRes(int gcode) throws Exception {
		return sqlSession.selectList(namespace+".selectMyRes", gcode);
	}

	@Override
	public List<Integer> selectMyRestime(int cfrescode) throws Exception {
		return sqlSession.selectList(namespace+".selectMyRestime", cfrescode);
	}

	@Override
	public void deleteMyRes(int cfrescode) throws Exception {
		sqlSession.delete(namespace+".deleteCrt",cfrescode);
		sqlSession.delete(namespace+".deleteCr",cfrescode);
	}
	
}
