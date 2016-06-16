package org.kosta.cims.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.ScheduleVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO {
	@Resource
	private SqlSessionTemplate template;
	
	
	@Override
	public List<ScheduleVO> getTodaySchedule(EmployeeVO vo){
		return template.selectList("schedule.getTodaySchedule",vo);
	}


	@Override
	public void updateTodaySchedule(ScheduleVO vo) {
		template.update("schedule.updateTodaySchedule", vo);
	}


	@Override
	public ScheduleVO getSelectTodaySchedule(ScheduleVO vo) {
		return template.selectOne("schedule.getSelectTodaySchedule", vo);
	}


	@Override
	public List<ScheduleVO> getWeekSchedule(EmployeeVO vo) {
		return template.selectList("schedule.getWeekSchedule", vo);
	}


	@Override
	public void todayDelete(ScheduleVO vo) {
		template.delete("schedule.todayDelete", vo);
	}
	
}
