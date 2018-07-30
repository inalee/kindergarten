package com.yebin.service;

import com.kinder.domain.MemberVO;
import com.yebin.domain.CategoryVO;
import com.yebin.domain.FieldtripVO;

public interface FieldtripService {
	
	public void findnInsertCandidates(FieldtripVO fieldvo, MemberVO memvo, CategoryVO catevo);

}
