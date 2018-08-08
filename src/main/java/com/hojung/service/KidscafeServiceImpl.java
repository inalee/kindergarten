package com.hojung.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hojung.domain.KidscafeunfitCri;
import com.hojung.domain.KinsearchCri;
import com.hojung.persistence.KidscafeDAO;
import com.hojung.persistence.KinderDAO;
import com.kinder.domain.KindergartenVO;

@Service
public class KidscafeServiceImpl implements KidscafeService {
	
	@Inject
	private KidscafeDAO dao;

	@Override
	public List<Integer> unfitKidscafes(KidscafeunfitCri cri) throws Exception {
		return dao.unfitKidscafes(cri);
	}

}
