package com.hojung.service;

import java.util.List;

import com.hojung.domain.KidscafeunfitCri;

public interface KidscafeService {
	
	public List<Integer> unfitKidscafes(KidscafeunfitCri cri) throws Exception;
	
}
