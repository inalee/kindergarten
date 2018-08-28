package com.yebin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kinder.domain.TeacherVO;
import com.yebin.domain.ApprovalVO;
import com.yebin.domain.FieldtripVO;
import com.yebin.persistence.ApprovalDAO;


@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Inject ApprovalDAO apprdao;
	
	@Override
	public List<Object> insertApprDoc(FieldtripVO fieldVO, ApprovalVO apprVO) {
		Map<String, Object> map = new HashMap<>();
		map.put("fieldVO", fieldVO);
		map.put("apprVO", apprVO);
		
		List<Object> apprResult = apprdao.insertApprDoc(map);
		
		return apprResult;
	}

	@Override
	public Boolean isMaster(TeacherVO teVO) {
		TeacherVO tvo = apprdao.isMaster(teVO);
		return tvo.isTmaster();
	}

	@Override
	public List<Object> getDetails(ApprovalVO apprVO) {
		List<Object> listDetail = apprdao.getDetails(apprVO);
		return listDetail;
	}

	@Override
	public void updateApv(ApprovalVO apprVO) {
		apprdao.updateApv(apprVO);
	}

}
