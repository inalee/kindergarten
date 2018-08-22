package com.yebin.persistence;

import java.util.List;
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
	public List<FieldtripVO> insertCandidates(Map<String, Object> params) {
		List<FieldtripVO> listFvo = sqlSession.selectList(namespace+".insertCandidates", params);
		return listFvo;
	}

	@Override
	public void updateFieldtrip(FieldtripVO fieldVO) {
		sqlSession.update(namespace+".updateFieldtrip", fieldVO);
	
	}

	@Override
	public List<String> getAddrByFtcode(FieldtripVO fieldVO) {
		List<String> ftaddr = sqlSession.selectList(namespace+".getAddrByFtcode", fieldVO);
		return ftaddr;
	}
	
	
	@Override
	public void insertTourCourse(Map<String, Object> params) {
		sqlSession.insert(namespace+".insertTourCourse", params);
	}
	
}
