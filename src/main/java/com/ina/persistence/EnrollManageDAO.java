package com.ina.persistence;

import java.util.List;
import java.util.Map;

import com.ina.domain.EnrollVO;

public interface EnrollManageDAO {
	public List<Map<String, Object>> enroll_list(int kincode);
	
	public void modify_status(EnrollVO ev);
	
	public List<Map<String, Object>> enroll_list2(int kincode);
	
	public List<Map<String, Object>> enroll_list3(int kincode);

	public void p_manage_enroll(EnrollVO ev);
}