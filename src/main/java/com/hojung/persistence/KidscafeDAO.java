package com.hojung.persistence;

import java.util.Date;
import java.util.List;

import com.hojung.domain.KidscafeVO;
import com.hojung.domain.KidscafesearchCri;
import com.hojung.domain.KidscafesumCri;

public interface KidscafeDAO {

	public String getTime();
	
	public List<KidscafeVO> selectKidscafes(KidscafesearchCri cri) throws Exception;
	
	public KidscafeVO selectOneKidscafe(int cfcode) throws Exception;
	
	public List<KidscafesumCri> selectResSum(KidscafesumCri cri) throws Exception;
	
}
