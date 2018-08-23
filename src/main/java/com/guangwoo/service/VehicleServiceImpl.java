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




}
