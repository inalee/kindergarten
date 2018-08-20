package com.jiwon.persistence;

import java.util.List;

import com.kinder.domain.ClassVO;
import com.kinder.domain.MemberVO;
import com.jiwon.domain.VideoVO;
import com.jiwon.dto.AttendDTO;
import com.jiwon.dto.ChildrenDTO;
import com.kinder.domain.ChildrenVO;


public interface JChildrenDAO {

	// 출결
	public List<ClassVO> getClassList(int kincode) throws Exception;
	public List<ChildrenVO> getClassMember(int clcode) throws Exception;
	public List<Integer> getKinderList() throws Exception;
	public void insertACheck(AttendDTO dto) throws Exception;
	public List<AttendDTO> getAttendByMonth(AttendDTO dto) throws Exception;
	public List<ChildrenVO> getChildrenList(String memid) throws Exception;
	public ChildrenDTO getChildInfo(int ccode) throws Exception;
	public MemberVO getTeacherInfo(int ccode) throws Exception;
	
	// 영상추천
	public void insertVideoInfo(VideoVO vo) throws Exception;
	public VideoVO getRecentVInfo(int ccode) throws Exception;
	public VideoVO getFreqChInfo(int ccode) throws Exception;
	public List<VideoVO> getPopVInfo() throws Exception;
	public String getKeyword(int ccode) throws Exception;
	public String getInterest(int ccode) throws Exception;
}
