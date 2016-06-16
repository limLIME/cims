package org.kosta.cims.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.ScheduleVO;
import org.springframework.stereotype.Service;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	@Resource
	private ScheduleDAO dao;
	
	@Override
	public List<ScheduleVO> getTodaySchedule(EmployeeVO vo){
		return dao.getTodaySchedule(vo);
	}
	

	@Override
	public ScheduleVO getSelectTodaySchedule(ScheduleVO vo) {
		dao.updateTodaySchedule(vo);
		return dao.getSelectTodaySchedule(vo);
	}


	@Override
	public List<ScheduleVO> getWeekSchedule(EmployeeVO vo) {
		return dao.getWeekSchedule(vo);
	}


	@Override
	public void todayDelete(ScheduleVO vo) {
		dao.todayDelete(vo);
	}
}
