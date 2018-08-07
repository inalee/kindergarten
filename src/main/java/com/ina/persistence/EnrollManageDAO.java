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
	
	public void enroll_delete(int encode);
	
	public void regular_delete(int re_encode);
}