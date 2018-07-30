package com.hojung.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hojung.domain.KinsearchCri;
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

//	@Override
//	public void insertMember(MemberVO vo) {
//		sqlSession.insert(namespace+".insertMember", vo);
//	}
//
//	@Override
//	public MemberVO readMember(String userid) throws Exception {
//		return (MemberVO)sqlSession.selectOne(namespace+".selectMember", userid);
//	}
//
//	@Override
//	public MemberVO readWithPW(String userid, String userpw) throws Exception {
//		Map<String, Object> paramMap = new HashMap<String, Object>();
//		
//		paramMap.put("userid", userid);
//		paramMap.put("userpw", userpw);
//		return sqlSession.selectOne(namespace+".readWithPW", paramMap);
//	}
//
//	
//
//	@Override
//	public void removeMember(String userid) {
//		sqlSession.delete(namespace+".removeMember", userid);
//	}
//
//	@Override
//	public void modifyMember(MemberVO vo) {
//		sqlSession.update(namespace+".modifyMember", vo);
//	}
	
}
