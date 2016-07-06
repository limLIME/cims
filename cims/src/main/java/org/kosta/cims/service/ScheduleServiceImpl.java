package org.kosta.cims.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.dao.ScheduleDAO;
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


	  @Override
	   public List<ScheduleVO> getMonthSchedule(String month,String empNo) {
	      return dao.getMonthSchedule(month,empNo);
	   }


	@Override
	public void weeklyUpdateList(List<String> monNo, List<String> monCon,
			String evoNo) {
			dao.weeklyUpdateList(monNo, monCon, evoNo);
		}


	@Override
	public void todayInsertSchedule(ScheduleVO vo) {
		dao.todayInsertSchedule(vo);
		
	}


	@Override
	public Integer countSch(String empNo) {
		return dao.countSch(empNo);
	}

	@Override
	   public void insertMonthWrite(ScheduleVO vo) {
	      dao.insertMonthWrite(vo);
	   }


	   @Override
	   public void monthDelete(int schNo) {
	      dao.monthDelete(schNo);
	   }

	   @Override
	   public ScheduleVO findScheduleByNo(int schNo) {
	      return dao.findScheduleByNo(schNo);
	   }


	   @Override
	   public void monthUpdate(ScheduleVO vo) {
	      dao.monthUpdate(vo);
	   }
}
