package com.yebin.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kinder.domain.MemberVO;
import com.yebin.domain.AreacodeVO;
import com.yebin.domain.CategoryVO;
import com.yebin.domain.FieldtripVO;
import com.yebin.persistence.FieldtripDAO;


@Service
public class FieldtripServiceImpl implements FieldtripService{

	@Inject
	FieldtripDAO fieldDAO;
	
	@Override
	public void findnInsertCandidates(FieldtripVO fieldVO, MemberVO memVO, CategoryVO cateVO, AreacodeVO areaVO) {
		Map<String, Object> params = new HashMap<>();
		params.put("fieldVO", fieldVO);
		params.put("memVO", memVO);
		params.put("cateVO", cateVO);
		params.put("areaVO", areaVO);
		
		fieldDAO.insertCandidates(params);
		
	}

	@Override
	public void updateFtChoice(FieldtripVO fieldVO) {
		fieldDAO.updateFieldtrip(fieldVO);
	}

	
	
}
