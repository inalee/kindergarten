package com.guangwoo.service;

import java.util.List;

import com.guangwoo.domain.VehicleVO;

public interface VehicleService {

	public List<VehicleVO> selectcar(int kincode) throws Exception;
	
}
