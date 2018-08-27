package com.guangwoo.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.guangwoo.domain.CarchildrenVO;
import com.guangwoo.domain.CarstationVO;
import com.guangwoo.domain.CarteacherVO;
import com.guangwoo.domain.ScheduleVO;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kinder.mapper.guangwoo.guangwooMapper";
	
	

	@Override
	public List<CarteacherVO> select_schedule_teacher(int kincode) throws Exception {
		return session.selectList(namespace+".select_schedule_teacher",kincode) ;
	}

	@Override
	public List<CarchildrenVO> select_schedule_children(int kincode) throws Exception {
		return session.selectList(namespace+".select_schedule_children",kincode) ;
	}

	@Override
	public List<CarstationVO> select_schedule_station(int kincode) throws Exception {
		return session.selectList(namespace+".select_schedule_station",kincode);
	}

	@Override
	public List<ScheduleVO> select_schedule(int kincode) throws Exception {
		return session.selectList(namespace+".select_schedule",kincode) ;
		
	}
	@Override
	public void insertschedule(ScheduleVO vo) throws Exception {
		session.insert(namespace+".insertschedule",vo);
		
	}

	@Override
	public void deleteschedule(int ccode) throws Exception {
		session.delete(namespace+".deleteschedule",ccode);
		
	}

	

}
