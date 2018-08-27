package com.guangwoo.persistence;

import java.util.List;

import com.guangwoo.domain.StationVO;

public interface StationDAO {

	public void station_insert(StationVO vo)throws Exception;
	
	public void station_update_sdcode(StationVO vo)throws Exception;
	public void station_update_stname(StationVO vo)throws Exception;
	public void station_update_stx(StationVO vo)throws Exception;
	public void station_update_sty(StationVO vo)throws Exception;
	
	public List<StationVO> station_select(int kincode)throws Exception;
	
	public void station_delete(Integer stcode)throws Exception;
	
}
