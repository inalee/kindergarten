package com.jiwon.persistence;

import java.util.List;

import com.kinder.domain.ClassVO;
import com.kinder.domain.ChildrenVO;


public interface JChildrenDAO {

	public List<ClassVO> getClassList(int kincode) throws Exception;
	public List<ChildrenVO> getClassMember(int clcode) throws Exception;
}
