package com.yebin.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yebin.domain.CategoryVO;
import com.yebin.persistence.CategoryDAO;


@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Inject
	CategoryDAO cateDAO;

	@Override
	public void insertCategory(CategoryVO vo) {
		cateDAO.insert(vo);
	}

}
