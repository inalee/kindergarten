package com.yebin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kinder.domain.MemberVO;
import com.yebin.domain.AreacodeVO;
import com.yebin.domain.CategoryVO;
import com.yebin.domain.FieldtripVO;
import com.yebin.domain.MaterialsVO;
import com.yebin.domain.TourismVO;
import com.yebin.persistence.FieldtripDAO;


@Service
public class FieldtripServiceImpl implements FieldtripService{

	@Inject
	FieldtripDAO fieldDAO;
	
	@Override
	public List<FieldtripVO> findnInsertCandidates(FieldtripVO fieldVO, MemberVO memVO, CategoryVO cateVO, AreacodeVO areaVO) {
		Map<String, Object> params = new HashMap<>();
		params.put("fieldVO", fieldVO);
		params.put("memVO", memVO);
		params.put("cateVO", cateVO);
		params.put("areaVO", areaVO);
		
		//후보지 insert하고 ftcode 받기
		return fieldDAO.insertCandidates(params);
	}

	@Override
	public String updateFtChoice(FieldtripVO fieldVO) {
		fieldDAO.updateFieldtrip(fieldVO);
		List<String> temp = fieldDAO.getAddrByFtcode(fieldVO);
		String fieldAddr = temp.get(0);
		return fieldAddr;
	}
	
	
	@Override
	public void insertTourCourse(FieldtripVO fieldVO, TourismVO tourVO){
		Map<String, Object> params = new HashMap<>();
		params.put("fieldVO", fieldVO);
		params.put("tourVO", tourVO);
		fieldDAO.insertTourCourse(params);
	}

	@Override
	public void insertMaterials(MaterialsVO mVO, FieldtripVO fieldVO) {
		Map<String, Object> params = new HashMap<>();
		params.put("fieldVO", fieldVO);
		params.put("mVO", mVO);
		fieldDAO.insertMaterials(params);
	}

	@Override
	public List<Object> selectReport(FieldtripVO fieldVO) {
		System.out.println(fieldVO.getFtcode());
		List<Object> reportList = fieldDAO.selectReport(fieldVO);
		return reportList;
	}

	
	
}
