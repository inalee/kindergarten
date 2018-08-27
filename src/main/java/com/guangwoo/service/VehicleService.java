package com.guangwoo.service;

import java.util.List;

import com.guangwoo.domain.VehicleVO;

public interface VehicleService {

	public List<VehicleVO> selectcar(int kincode) throws Exception;
	
	public List<VehicleVO> select_car_teacher(int kincode)throws Exception;
	
	public void insert_car(VehicleVO vo)throws Exception;
	
	public void delete_car(Integer carcode)throws Exception;
}
