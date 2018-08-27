package com.guangwoo.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.guangwoo.domain.VehicleVO;


@Repository
public class VehicleDAOImpl implements VehicleDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kinder.mapper.guangwoo.guangwooMapper";
	
	@Override
	public List<VehicleVO> selectcar(int kincode) throws Exception {
		return session.selectList(namespace+".selectcar", kincode);
	}

	@Override
	public List<VehicleVO> select_car_teacher(int kincode) throws Exception {
		return session.selectList(namespace+".select_car_teacher",kincode);
	}
	
	@Override
	public void insert_car(VehicleVO vo) throws Exception {
		session.insert(namespace+".insert_car",vo);
		
	}

	@Override
	public void delete_car(Integer carcode) throws Exception {
		session.delete(namespace+".delete_car",carcode);
		
	}

	



	
	
	
}
