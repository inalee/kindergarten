package com.yebin.persistence;

import java.util.Map;

import com.yebin.domain.FieldtripVO;

public interface FieldtripDAO {
	
	public void insertCandidates(Map<String, Object> params);
	public void updateFieldtrip(FieldtripVO fieldVO);

}
