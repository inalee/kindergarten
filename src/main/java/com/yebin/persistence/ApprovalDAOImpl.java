package com.yebin.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kinder.domain.TeacherVO;
import com.yebin.domain.ApprovalVO;


@Repository
public class ApprovalDAOImpl implements ApprovalDAO{
	
	@Inject
	SqlSession sqlSession;
	
	private static final String namespace = "com.yebin.mapper.fieldtripMapper";
	

	@Override
	public List<Object> insertApprDoc(Map<String, Object> params) {
		// param으로 fieldVO와 approvalVO 받아서 sql구문 수행
		return sqlSession.selectList(namespace+".insertApprDoc", params);	
	}


	@Override
	public TeacherVO isMaster(TeacherVO teVO) {

		return sqlSession.selectOne(namespace+".isMaster", teVO);
	}

	@Override
	public List<Object> getDetails(ApprovalVO apprVO) {
		
		return sqlSession.selectList(namespace+".getDetails", apprVO);
	}


	@Override
	public void updateApv(ApprovalVO apprVO) {
		sqlSession.update(namespace+".updateApv", apprVO);
	}
	
	

}
