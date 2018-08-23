package com.guangwoo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.guangwoo.domain.StationVO;
import com.guangwoo.persistence.StationDAO;


@Service
public class StationServiceImpl implements StationService{
	
	@Inject private StationDAO dao;

	@Override
	public void station_insert(StationVO vo) throws Exception {
		dao.station_insert(vo);
	}

	@Override
	public void station_update_sdcode(StationVO vo) throws Exception {
		dao.station_update_sdcode(vo);
	}

	@Override
	public void station_update_stname(StationVO vo) throws Exception {
		dao.station_update_stname(vo);
		
	}

	@Override
	public void station_update_stx(StationVO vo) throws Exception {
		dao.station_update_stx(vo);
		
	}

	@Override
	public void station_update_sty(StationVO vo) throws Exception {
		dao.station_update_sty(vo);
		
	}

	@Override
	public List<StationVO> station_select(int kincode) throws Exception {
		return dao.station_select(kincode);
	}

	@Override
	public void station_delete(Integer stcode) throws Exception {
		dao.station_delete(stcode);
		
	}

}
