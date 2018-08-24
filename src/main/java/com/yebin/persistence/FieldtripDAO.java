package com.yebin.persistence;

import java.util.List;
import java.util.Map;

import com.yebin.domain.FieldtripVO;
import com.yebin.domain.MaterialsVO;

public interface FieldtripDAO {
	
	public List<FieldtripVO> insertCandidates(Map<String, Object> params);
	public void updateFieldtrip(FieldtripVO fieldVO);
	public List<String> getAddrByFtcode(FieldtripVO fieldVO);
	public void insertTourCourse(Map<String, Object> params);
	public void insertMaterials(Map<String, Object> params);
	public List<Object> selectReport(FieldtripVO fieldVO);
}
