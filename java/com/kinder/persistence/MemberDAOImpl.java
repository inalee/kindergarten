package com.kinder.persistence;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kinder.domain.GuardianVO;
import com.kinder.domain.MemberVO;
import com.kinder.domain.TeacherVO;
import com.kinder.dto.LoginDTO;


@Repository
public class MemberDAOImpl implements MemberDAO {
   
   @Inject
   private SqlSession sqlSession;
   
   private static final String namespace = "com.kinder.mapper.memberMapper";

   @Override
   public String getTime() {
      return sqlSession.selectOne(namespace+".getTime");
   }

   @Override
   public void insertMember(MemberVO vo) {
      sqlSession.insert(namespace+".insertMember", vo);

   }

	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		return sqlSession.selectOne(namespace + ".login", dto);
	}
	
	@Override
	public void insertGuardian(GuardianVO gv) {
		sqlSession.insert(namespace+".insertGuard",gv);	
	}

@Override
	public void insertTeacher(TeacherVO tv) {
		sqlSession.insert(namespace+".insertTeacher",tv);
	}

@Override
	public int checkMemId(String memid) {
	return sqlSession.selectOne(namespace+".checkId",memid);
	}

@Override
public MemberVO nLogin(MemberVO vo) throws Exception {
	return sqlSession.selectOne(namespace + ".nlogin", vo);
}
   
}
