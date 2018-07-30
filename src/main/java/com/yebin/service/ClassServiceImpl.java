package com.yebin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kinder.domain.ClassVO;
import com.kinder.domain.MemberVO;
import com.yebin.persistence.ClassDAO;
import com.yebin.persistence.ClassDAOImpl;


@Service
public class ClassServiceImpl implements ClassService{

	@Inject
	private ClassDAO classDAO;
	
	@Override
	public List<Object> countingKids(MemberVO vo) {
		return classDAO.countingKids(vo);
	}
}
