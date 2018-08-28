package com.jiwon.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kinder.domain.ClassVO;
import com.kinder.domain.MemberVO;
import com.jiwon.domain.VideoVO;
import com.jiwon.dto.AttendDTO;
import com.jiwon.dto.ChildrenDTO;
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

	@Override
	public List<ChildrenDTO> getChildrenList(String memid) throws Exception {
		return session.selectList(namespace + ".getChildrenList", memid);
	}

	@Override
	public ChildrenDTO getChildInfo(int ccode) throws Exception {
		return session.selectOne(namespace + ".getChildInfo", ccode);
	}

	@Override
	public void insertVideoInfo(VideoVO vo) throws Exception {
		session.insert(namespace + ".insertVideoInfo", vo);
	}

	@Override
	public VideoVO getRecentVInfo(int ccode) throws Exception {
		return session.selectOne(namespace + ".getRecentVInfo", ccode);
	}

	@Override
	public VideoVO getFreqChInfo(int ccode) throws Exception {
		return session.selectOne(namespace + ".getFreqChInfo", ccode);
	}

	@Override
	public List<VideoVO> getPopVInfo() throws Exception {
		return session.selectList(namespace + ".getPopVInfo");
	}

	@Override
	public String getKeyword(int ccode) throws Exception {
		return session.selectOne(namespace + ".getKeyword",ccode);
	}

	@Override
	public String getInterest(int ccode) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".getInterest",ccode);
	}

	@Override
	public MemberVO getTeacherInfo(int ccode) throws Exception {
		return session.selectOne(namespace + ".getTeacherInfo", ccode);
	}

	@Override
	public ChildrenDTO getChnGInfo(int ccode) throws Exception {
		return session.selectOne(namespace + ".getChnGInfo", ccode);
	}

	@Override
	public List<ChildrenVO> getKinderMember(int kincode) throws Exception {
		return session.selectList(namespace + ".getKinderMember", kincode);
	}

	@Override
	public List<AttendDTO> getAttendByWeek(AttendDTO dto) throws Exception {
		return session.selectList(namespace + ".getAttendByWeek", dto);
	}
}
