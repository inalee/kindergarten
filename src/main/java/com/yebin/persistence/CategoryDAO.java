package com.yebin.persistence;

import com.yebin.domain.CategoryVO;

public interface CategoryDAO {
	
	public void insert(CategoryVO vo); 
	public void selectOne(CategoryVO vo);

}
