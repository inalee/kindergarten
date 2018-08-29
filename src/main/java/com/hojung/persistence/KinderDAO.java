package com.hojung.persistence;

import java.util.List;

import com.hojung.domain.KinsearchCri;
import com.kinder.domain.GuardianVO;
import com.kinder.domain.KindergartenVO;

public interface KinderDAO {

	public String getTime();
	
	public List<KindergartenVO> selectKinders_kw(KinsearchCri cri) throws Exception;
	
	public List<KindergartenVO> selectKinders_map(KinsearchCri cri) throws Exception;
	
	public GuardianVO selectGuardian(String memid) throws Exception;

}
