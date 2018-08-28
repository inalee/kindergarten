package com.guangwoo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.guangwoo.domain.VehicleVO;
import com.guangwoo.persistence.VehicleDAO;

@Service
public class VehicleServiceImpl implements VehicleService {

	@Inject
	private VehicleDAO dao;
	
	
	@Override
	public List<VehicleVO> selectcar(int kincode) throws Exception {
		return dao.selectcar(kincode);
	}

	@Override
	public List<VehicleVO> select_car_teacher(int kincode) throws Exception {
		return dao.select_car_teacher(kincode);
	}
	
	@Override
	public void insert_car(VehicleVO vo) throws Exception {
		dao.insert_car(vo);
	}

	@Override
	public void delete_car(Integer carcode) throws Exception {
		dao.delete_car(carcode);
		
	}


	




}
