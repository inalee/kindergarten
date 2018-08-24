package com.guangwoo.persistence;

import java.util.List;

import com.guangwoo.domain.VehicleVO;



public interface VehicleDAO {

	public List<VehicleVO> selectcar(int kincode) throws Exception;
	

	
	
}
