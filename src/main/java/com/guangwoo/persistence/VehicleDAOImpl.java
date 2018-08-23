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



	
	
	
}
