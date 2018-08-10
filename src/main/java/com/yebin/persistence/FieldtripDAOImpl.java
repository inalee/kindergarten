package com.yebin.persistence;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yebin.domain.FieldtripVO;


@Repository
public class FieldtripDAOImpl implements FieldtripDAO {
	
	@Inject
	SqlSession sqlSession;
	
	private static final String namespace = "com.yebin.mapper.fieldtripMapper";
	
	@Override
	public void insertCandidates(Map<String, Object> params) {
		sqlSession.insert(namespace+".insertCandidates", params);
	
	}

	@Override
	public void updateFieldtrip(FieldtripVO fieldVO) {
		sqlSession.update(namespace+".updateFieldtrip", fieldVO);
	}

}
