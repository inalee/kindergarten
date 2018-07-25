package com.ina.persistence;

import java.util.List;
import java.util.Map;

public interface WaitingDAO {
	
	public List<Map<String, Object>> wait_list(int gcode);
	
	public List<Map<String, Object>> wait_list2(int gcode);
	
	public List<Map<String, Object>> wait_list3(int gcode);
	
	public List<Map<String, Object>> wait_list4(int kincode);
}
