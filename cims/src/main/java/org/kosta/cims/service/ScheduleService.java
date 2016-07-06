package org.kosta.cims.service;

import java.util.List;

import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.ScheduleVO;

public interface ScheduleService {

	public abstract List<ScheduleVO> getTodaySchedule(EmployeeVO vo);

	public abstract ScheduleVO getSelectTodaySchedule(ScheduleVO vo);

	public abstract List<ScheduleVO> getWeekSchedule(EmployeeVO vo);

	public abstract void todayDelete(ScheduleVO vo);

	public abstract List<ScheduleVO> getMonthSchedule(String month, String empNo);

	public abstract void weeklyUpdateList(List<String> monNo,
			List<String> monCon, String evoNo);

	public abstract void todayInsertSchedule(ScheduleVO vo);

	public abstract Integer countSch(String empNo);

	public abstract void insertMonthWrite(ScheduleVO vo);

	public abstract void monthDelete(int schNo);

	public abstract ScheduleVO findScheduleByNo(int schNo);

	public abstract void monthUpdate(ScheduleVO vo);

}