package org.kosta.cims.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.ScheduleVO;
import org.kosta.cims.service.ScheduleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ScheduleController {
	@Resource
	private ScheduleService service;
	
	@RequestMapping("sch_home.do")
	public ModelAndView sch_home(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		session.setAttribute("head", 3);
		EmployeeVO vo = (EmployeeVO) session.getAttribute("evo");
		List<ScheduleVO> list = service.getTodaySchedule(vo);
		return new ModelAndView("sch_home", "list" ,list);
	}
	
	@RequestMapping("sch_todayUpdate.do")
	@ResponseBody
	public ScheduleVO test(ScheduleVO vo){
		vo =service.getSelectTodaySchedule(vo);
		return vo;
	}
	
	@RequestMapping("sch_week.do")
	public ModelAndView sch_week(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		EmployeeVO vo = (EmployeeVO) session.getAttribute("evo");
		List<ScheduleVO> list = service.getWeekSchedule(vo);
		return new ModelAndView("sch_week", "wlist" ,list);
	}
	
	@RequestMapping("sch_todayDelete.do")
	@ResponseBody
	public void sch_todayDelete(ScheduleVO vo){
		service.todayDelete(vo);
	}
	@RequestMapping("sch_month.do")
	public void sch_month(){
	}
	
}







