package com.yebin.persistence;

import java.util.List;
import java.util.Map;

import com.kinder.domain.ClassVO;
import com.kinder.domain.MemberVO;

public interface ClassDAO {

	public List<Object> countingKids(MemberVO vo);
	
}

