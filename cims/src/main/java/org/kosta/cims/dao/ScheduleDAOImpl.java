package org.kosta.cims.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.ScheduleVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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


	 @Override
	   public List<ScheduleVO> getMonthSchedule(String month,String empNo) {
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      System.out.println(empNo);
	      map.put("empNo", empNo);
	      map.put("month", Integer.parseInt(month));
	      return template.selectList("schedule.getMonthSchedule", map);
	   }

	@Transactional
	@Override
	public void weeklyUpdateList(List<String> monNo, List<String> monCon,
			String evoNo) {
		HashMap<String, String>map = new HashMap<String, String>();
		for(int i =0; i<monNo.size(); i++){
			if(i==0){
				map.put("monNo", monNo.get(i));
				map.put("monCon", monCon.get(i));
				map.put("evoNo", evoNo);
			}else{
				map.replace("monNo", monNo.get(i));
				map.replace("monCon", monCon.get(i));
			}
			template.update("schedule.weeklyUpdateList",map);
		}
	}


	@Override
	public void todayInsertSchedule(ScheduleVO vo) {
		template.insert("schedule.todayInsertSchedule",vo);
	}


	@Override
	public Integer countSch(String empNo) {
		return template.selectOne("schedule.countSch", empNo);
	}
	
	 @Override
	   public void insertMonthWrite(ScheduleVO vo) {
	      template.insert("schedule.insertMonthWrite", vo);
	   }


	   @Override
	   public void monthDelete(int schNo) {
	      template.delete("schedule.monthDelete", schNo);
	   }


	   @Override
	   public ScheduleVO findScheduleByNo(int schNo) {
	      return template.selectOne("schedule.findScheduleByNo", schNo);
	   }


	   @Override
	   public void monthUpdate(ScheduleVO vo) {
	      template.update("schedule.monthUpdate", vo);
	   }
}
