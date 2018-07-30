package com.jiwon.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kinder.domain.ClassVO;
import com.kinder.domain.ChildrenVO;

@Repository
public class ChildrenDAOImpl implements ChildrenDAO {

	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.jiwon.mapper.jiwonMapper";
	
	@Override
	public List<ClassVO> getClassList(int kincode) throws Exception {
		return session.selectList(namespace + ".getClassList", kincode) ;
	}

	@Override
	public List<ChildrenVO> getClassMember(int clcode) throws Exception {
		return session.selectList(namespace + ".getClassMember", clcode);
	}

}
