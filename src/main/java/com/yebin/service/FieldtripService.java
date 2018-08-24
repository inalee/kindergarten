package com.yebin.service;

import java.util.List;

import com.kinder.domain.MemberVO;
import com.yebin.domain.AreacodeVO;
import com.yebin.domain.CategoryVO;
import com.yebin.domain.FieldtripVO;
import com.yebin.domain.MaterialsVO;
import com.yebin.domain.TourismVO;

public interface FieldtripService {
	
	public List<FieldtripVO> findnInsertCandidates(FieldtripVO fieldVO, MemberVO memVO, CategoryVO cateVO, AreacodeVO areaVO);
	public String updateFtChoice(FieldtripVO fieldVO);
	public void insertTourCourse(FieldtripVO fieldVO, TourismVO tourVO);
	public void insertMaterials(MaterialsVO mVO, FieldtripVO fieldVO);
	public List<Object> selectReport(FieldtripVO fieldVO);
}
