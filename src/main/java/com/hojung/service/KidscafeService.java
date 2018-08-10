package com.hojung.service;

import java.util.List;

import com.hojung.domain.KidscafeVO;
import com.hojung.domain.KidscafesearchCri;

public interface KidscafeService {
	
	public List<KidscafeVO> selectKidscafes(KidscafesearchCri cri) throws Exception;
	
}
