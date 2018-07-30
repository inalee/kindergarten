package com.yebin.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kinder.domain.ClassVO;
import com.kinder.domain.MemberVO;


@Repository
public class ClassDAOImpl implements ClassDAO {

	@Inject
	private SqlSession sqlSession;
	
	 private static final String namespace = "com.yebin.mapper.classMapper";

	@Override
	public List<Object> countingKids(MemberVO vo) {
		return new ArrayList<>(sqlSession.selectList(namespace+".countingKids", vo));
	}
		
}
