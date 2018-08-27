package com.hojung.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hojung.domain.KidscafeVO;
import com.hojung.domain.KidscafesearchCri;
import com.hojung.domain.KidscafesumCri;
import com.hojung.domain.KinsearchCri;
import com.hojung.persistence.KidscafeDAO;
import com.hojung.persistence.KinderDAO;
import com.kinder.domain.KindergartenVO;

@Service
public class KidscafeServiceImpl implements KidscafeService {
	
	@Inject
	private KidscafeDAO dao;

	@Override
	public List<KidscafeVO> selectKidscafes(KidscafesearchCri cri) throws Exception {
		return dao.selectKidscafes(cri);
	}

	@Override
	public KidscafeVO selectOneKidscafe(int cfcode) throws Exception {
		return dao.selectOneKidscafe(cfcode);
	}

	@Override
	public HashMap<Integer, Integer> selectResSum(KidscafesumCri cri) throws Exception {
		
		HashMap<Integer, Integer> hm = new HashMap<>();
		
		List<KidscafesumCri> ressum = dao.selectResSum(cri);
		for (KidscafesumCri sumCri : ressum) {
			hm.put(sumCri.getCfrestime(), sumCri.getSum_cfresnum());
		}
		return hm;
	}

}
