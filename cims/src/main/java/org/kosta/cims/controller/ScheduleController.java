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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ScheduleController {
	@Resource
	private ScheduleService service;

	@RequestMapping("sch_home.do")
	public ModelAndView sch_home(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.setAttribute("left", 12);
		System.out.println(session.getAttribute("left"));
		EmployeeVO vo = (EmployeeVO) session.getAttribute("evo");
		List<ScheduleVO> list = service.getTodaySchedule(vo);
		return new ModelAndView("sch_home", "list", list);
	}

	@RequestMapping("sch_todayUpdate.do")
	@ResponseBody
	public ScheduleVO sch_todayUpdate(ScheduleVO vo) {
		vo = service.getSelectTodaySchedule(vo);
		return vo;
	}
	
	@RequestMapping("sch_todayInsert.do")
	@ResponseBody
	public ScheduleVO sch_todayInsert(ScheduleVO vo) {
		service.todayInsertSchedule(vo);
		vo = service.getSelectTodaySchedule(vo);
		return vo;
	}
	
	
	   @RequestMapping("sch_monthList.do")
	   public ModelAndView sch_monthList(HttpServletRequest request) {
	      ModelAndView mv =  new ModelAndView("sch_monthList");
	      HttpSession session = request.getSession(false);
	      session.setAttribute("head", 3);
	      EmployeeVO vo = (EmployeeVO) session.getAttribute("evo");
	      String empNo = vo.getEmpNo();
	      String month=request.getParameter("month");
	      List<ScheduleVO> list = service.getMonthSchedule(month,empNo);
	      mv.addObject("mlist",    list);
	      mv.addObject("month", month);
	      return mv;
	   }

	@RequestMapping("sch_week.do")
	public ModelAndView sch_week(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.setAttribute("left", 4);
		EmployeeVO vo = (EmployeeVO) session.getAttribute("evo");
		List<ScheduleVO> list = service.getWeekSchedule(vo);
		System.out.println(list);
		return new ModelAndView("sch_week", "wlist", list);
	}

	@RequestMapping("sch_todayDelete.do")
	@ResponseBody
	public void sch_todayDelete(ScheduleVO vo) {
		service.todayDelete(vo);
	}

	@RequestMapping("sch_month.do")
	public void sch_month(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.setAttribute("left", 13);
	}

	@RequestMapping("sch_weeklyList.do")
	@ResponseBody
	public List<ScheduleVO> sch_weeklyList(EmployeeVO vo) {
		List<ScheduleVO> list = service.getWeekSchedule(vo);
	
		return list;
	}

	@RequestMapping("sch_weeklyUpdateList.do")
	@ResponseBody
	public List<ScheduleVO> sch_weeklyUpdateList(
			@RequestParam(value = "monNo[]") List<String> monNo,
			@RequestParam(value = "monCon[]") List<String> monCon,
			@RequestParam(value = "tuesNo[]") List<String> tuesNo,
			@RequestParam(value = "tuesCon[]") List<String> tuesCon,
			@RequestParam(value = "wedNo[]") List<String> wedNo,
			@RequestParam(value = "wedCon[]") List<String> wedCon,
			@RequestParam(value = "evoNo") String evoNo) {
		EmployeeVO vo = new EmployeeVO();
		if(evoNo.length()==3)
			evoNo = "0" +evoNo;
		vo.setEmpNo(evoNo);
		
		service.weeklyUpdateList(monNo, monCon, evoNo);
		service.weeklyUpdateList(tuesNo, tuesCon, evoNo);
		service.weeklyUpdateList(wedNo, wedCon, evoNo);
		
		List<ScheduleVO> list = service.getWeekSchedule(vo);
		return list;
	}
	
	@RequestMapping("sch_monthWriteForm.do")
	   public String monthWriteForm(){
	      return "sch_monthwrite";
	   }
	   
	   @RequestMapping(value="sch_monthWrite.do", method=RequestMethod.POST)
	   public ModelAndView sch_monthWrite(HttpServletRequest request, ScheduleVO scvo){
	      HttpSession session = request.getSession(false);
	      EmployeeVO evo = (EmployeeVO)session.getAttribute("evo");
	      String empNo = evo.getEmpNo();
	      scvo.setEmpNo(empNo);   
	      service.insertMonthWrite(scvo);
	      return new ModelAndView("redirect:sch_monthwriteok.do");
	   }
	   
	   @RequestMapping("sch_monthDelete.do")
	   public String sch_monthDelete(int schNo,String month){         
	         service.monthDelete(schNo);
	      return "redirect:sch_monthList.do?month="+month;
	   }
	   
	   @RequestMapping("sch_monthUpdateForm.do")
	   public ModelAndView sch_monthUpdateForm(int schNo, String month){
	      ModelAndView mv = new ModelAndView("sch_monthupdateform");
	      ScheduleVO vo = service.findScheduleByNo(schNo);
	      mv.addObject("scvo", vo);
	      mv.addObject("month", month);
	      return mv;
	   }
	   
	   @RequestMapping(value="sch_monthUpdate.do", method=RequestMethod.POST)
	   public String sch_monthUpdate(String month, ScheduleVO vo){
	      service.monthUpdate(vo);            
	      return "redirect:sch_monthList.do?month="+month;
	   }
	  
}
