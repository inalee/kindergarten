package com.guangwoo.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.guangwoo.domain.StationVO;

@Repository
public class StationDAOImpl implements StationDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kinder.mapper.guangwoo.guangwooMapper";

	@Override
	public void station_insert(StationVO vo) throws Exception {
		session.insert(namespace+".station_insert",vo);
		
	}

	@Override
	public void station_update_sdcode(StationVO vo) throws Exception {
		session.update(namespace+".station_update_sdcode",vo);
		
	}

	@Override
	public void station_update_stname(StationVO vo) throws Exception {
		session.update(namespace+".station_update_stname",vo);
		
	}

	@Override
	public void station_update_stx(StationVO vo) throws Exception {
		session.update(namespace+".station_update_stx",vo);
		
	}

	@Override
	public void station_update_sty(StationVO vo) throws Exception {
		session.update(namespace+".station_update_sty",vo);
		
	}

	@Override
	public List<StationVO> station_select(int kincode) throws Exception {
		return session.selectList(namespace+".station_select",kincode);
	}

	@Override
	public void station_delete(Integer stcode) throws Exception {
		session.delete(namespace+".station_delete",stcode);
		
	}

	

	

}
