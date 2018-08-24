package com.hojung.service;

import java.util.HashMap;
import java.util.List;

import com.hojung.domain.KidscafeVO;
import com.hojung.domain.KidscafesearchCri;
import com.hojung.domain.KidscafesumCri;

public interface KidscafeService {
	
	public List<KidscafeVO> selectKidscafes(KidscafesearchCri cri) throws Exception;
	
	public KidscafeVO selectOneKidscafe(int cfcode) throws Exception;
	
	public HashMap<Integer, Integer> selectResSum(KidscafesumCri cri) throws Exception;
	
}
