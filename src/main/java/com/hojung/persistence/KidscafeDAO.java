package com.hojung.persistence;

import java.util.List;

import com.hojung.domain.KidscafeVO;
import com.hojung.domain.KidscafeunfitCri;

public interface KidscafeDAO {

	public String getTime();
	
	public List<Integer> unfitKidscafes(KidscafeunfitCri cri) throws Exception;
	

	
}
