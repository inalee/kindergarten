package com.jiwon.persistence;

import java.util.List;

import com.kinder.domain.ClassVO;
import com.jiwon.dto.AttendDTO;
import com.jiwon.dto.ChildrenDTO;
import com.kinder.domain.ChildrenVO;


public interface JChildrenDAO {

	public List<ClassVO> getClassList(int kincode) throws Exception;
	public List<ChildrenVO> getClassMember(int clcode) throws Exception;
	public List<Integer> getKinderList() throws Exception;
	public void insertACheck(AttendDTO dto) throws Exception;
	public List<AttendDTO> getAttendByMonth(AttendDTO dto) throws Exception;
	public List<ChildrenVO> getChildrenList(String memid) throws Exception;
	public ChildrenDTO getChildInfo(int ccode) throws Exception;
}
