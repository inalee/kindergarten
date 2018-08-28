package com.yebin.persistence;

import java.util.List;
import java.util.Map;

import com.kinder.domain.TeacherVO;
import com.yebin.domain.ApprovalVO;

public interface ApprovalDAO {

	public List<Object> insertApprDoc(Map<String, Object> params);
	public TeacherVO isMaster(TeacherVO teVO);
	public List<Object> getDetails(ApprovalVO apprVO);
	public void updateApv(ApprovalVO apprVO);
}
