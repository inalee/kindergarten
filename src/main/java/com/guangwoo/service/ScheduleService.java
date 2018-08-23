package com.guangwoo.service;

import java.util.List;

import com.guangwoo.domain.CarchildrenVO;
import com.guangwoo.domain.CarstationVO;
import com.guangwoo.domain.CarteacherVO;
import com.guangwoo.domain.ScheduleVO;

public interface ScheduleService {

	public List<ScheduleVO> select_schedule(int kincode) throws Exception;
	
	public List<CarteacherVO> select_schedule_teacher(int kincode) throws Exception;
	
	public List<CarchildrenVO> select_schedule_children(int kincode) throws Exception;
	
	public List<CarstationVO> select_schedule_station(int kincode) throws Exception;
	
	public void insertschedule(ScheduleVO vo)throws Exception;
	
	public void deleteschedule(int ccode)throws Exception;
}
