package com.ina.persistence;

import java.util.List;
import java.util.Map;

import com.ina.domain.EnrollVO;
import com.ina.domain.RegularEnrollVO;

public interface WaitingDAO {
	

	
	public List<Map<String, Object>> wait_list2(int gcode);
	
	public List<Map<String, Object>> wait_list3(int gcode);
	
	public List<Map<String, Object>> wait_list4(int kincode);
	
	public List<Map<String, Object>> wait_list5(int gcode);
	
	public void update_state(EnrollVO ev);

	public List<Map<String, Object>> regular_wait(int gcode);
	
	public List<Map<String, Object>> regular_wait2(int gcode);
	
	public List<Map<String, Object>> regular_wait3(int kincode);
	
	
	public void update_regular_state(RegularEnrollVO rev);
	
	public RegularEnrollVO select_files(int re_encode);
	
}
