package com.ina.persistence;

import java.util.List;
import java.util.Map;

import com.ina.domain.regular_recruitVO;
import com.kinder.domain.KindergartenVO;
import com.kinder.domain.SearchCri;

public interface RegularDAO {

	public void make_regular(regular_recruitVO rrv);
	
	public List<regular_recruitVO> list_regular(int kincode);
	
	public List<Map<String, Object>> list_regular_par();
	
	public regular_recruitVO detail_regular(int recode);
	
	public KindergartenVO kinder_info(int kincode);
	
	public List<Map<String, Object>> list_del_regular(int gcode);
	
	public void regular_final(int re_encode);
	
	public List<Map<String, Object>> final_list(int kincode);
	
	public void no_file(int re_encode);
	
	public List<Map<String, Object>> cancel_list(int kincode);
	
	public List<Map<String, Object>> search_regular(SearchCri cri);
}
