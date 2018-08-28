package com.hojung.service;

import java.util.HashMap;
import java.util.List;

import com.hojung.domain.KidscafeVO;
import com.hojung.domain.KidscafesearchCri;
import com.hojung.domain.KidscafesumCri;
import com.hojung.domain.MyresVO;

public interface KidscafeService {
	
	public List<KidscafeVO> selectKidscafes(KidscafesearchCri cri) throws Exception;
	
	public KidscafeVO selectOneKidscafe(int cfcode) throws Exception;
	
	public HashMap<Integer, Integer> selectResSum(KidscafesumCri cri) throws Exception;
	
	public List<MyresVO> selectMyRes(int gcode) throws Exception;
	
	public List<Integer> selectMyRestime(int cfrescode) throws Exception;
	
	public void deleteMyRes(int cfrescode) throws Exception;
	
}
