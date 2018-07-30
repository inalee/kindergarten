package com.ina.persistence;

import java.util.List;
import java.util.Map;

import com.ina.domain.regular_recruitVO;
import com.kinder.domain.KindergartenVO;

public interface RegularDAO {

	public void make_regular(regular_recruitVO rrv);
	
	public List<regular_recruitVO> list_regular(int kincode);
	
	public List<Map<String, Object>> list_regular_par();
	
	public regular_recruitVO detail_regular(int recode);
	
	public KindergartenVO kinder_info(int kincode);
}
