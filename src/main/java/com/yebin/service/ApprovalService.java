package com.yebin.service;

import java.util.List;

import com.kinder.domain.TeacherVO;
import com.yebin.domain.ApprovalVO;
import com.yebin.domain.FieldtripVO;

public interface ApprovalService {
	
	public List<Object> insertApprDoc(FieldtripVO fieldVO, ApprovalVO apprVO);
	public Boolean isMaster(TeacherVO teVO);
	public List<Object> getDetails(ApprovalVO apprVO);
	public void updateApv(ApprovalVO apprVO);

}
