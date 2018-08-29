package com.hojung.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hojung.domain.KinsearchCri;
import com.hojung.persistence.KinderDAO;
import com.kinder.domain.GuardianVO;
import com.kinder.domain.KindergartenVO;

@Service
public class KinderServiceImpl implements KinderService {
	
	@Inject
	private KinderDAO dao;

	@Override
	public List<KindergartenVO> selectKinders_kw(KinsearchCri cri) throws Exception {
		return dao.selectKinders_kw(cri);
	}

	@Override
	public List<KindergartenVO> selectKinders_map(KinsearchCri cri) throws Exception {
		return dao.selectKinders_map(cri);
	}

	@Override
	public GuardianVO selectGuardian(String memid) throws Exception {
		return dao.selectGuardian(memid);
	}


}
