package org.kosta.cims.service;

import java.util.List;

import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.ScheduleVO;

public interface ScheduleDAO {

	public abstract List<ScheduleVO> getTodaySchedule(EmployeeVO vo);

	public abstract void updateTodaySchedule(ScheduleVO vo);

	public abstract ScheduleVO getSelectTodaySchedule(ScheduleVO vo);

	public abstract List<ScheduleVO> getWeekSchedule(EmployeeVO vo);

	public abstract void todayDelete(ScheduleVO vo);

}