package com.guangwoo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.guangwoo.domain.CarchildrenVO;
import com.guangwoo.domain.CarstationVO;
import com.guangwoo.domain.CarteacherVO;
import com.guangwoo.domain.ScheduleVO;
import com.guangwoo.persistence.ScheduleDAO;



@Service
public class ScheduleServiceImpl implements ScheduleService{

	@Inject
	private ScheduleDAO dao;
	

	@Override
	public List<CarteacherVO> select_schedule_teacher(int kincode) throws Exception {
		return dao.select_schedule_teacher(kincode);
	}


	@Override
	public List<CarchildrenVO> select_schedule_children(int kincode) throws Exception {
		return dao.select_schedule_children(kincode);
	}


	@Override
	public List<CarstationVO> select_schedule_station(int kincode) throws Exception {
		return dao.select_schedule_station(kincode);
	}


	@Override
	public List<ScheduleVO> select_schedule(int kincode) throws Exception {
		return dao.select_schedule(kincode);
	}
	@Override
	public void insertschedule(ScheduleVO vo) throws Exception {
		dao.insertschedule(vo);
		
	}


	@Override
	public void deleteschedule(int ccode) throws Exception {
		dao.deleteschedule(ccode);
		
	}

	


}
