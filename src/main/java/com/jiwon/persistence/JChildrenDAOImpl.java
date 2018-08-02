package com.jiwon.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kinder.domain.ClassVO;
import com.jiwon.dto.AttendDTO;
import com.kinder.domain.ChildrenVO;

@Repository
public class JChildrenDAOImpl implements JChildrenDAO {

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

	@Override
	public List<Integer> getKinderList() throws Exception {
		return session.selectList(namespace + ".getKinderList");
	}

	@Override
	public void insertACheck(AttendDTO dto) throws Exception {
		session.insert(namespace + ".insertACheck", dto);
	}

	@Override
	public List<AttendDTO> getAttendByMonth(AttendDTO dto) throws Exception {
		return session.selectList(namespace + ".getAttendByMonth", dto);
	}
}
