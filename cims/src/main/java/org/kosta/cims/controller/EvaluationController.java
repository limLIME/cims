package org.kosta.cims.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.cims.model.DepartmentVO;
import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.EvaluationVO;
import org.kosta.cims.model.ListVO;
import org.kosta.cims.model.PagingBean2;
import org.kosta.cims.service.EvaluationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EvaluationController {
	@Resource
	private EvaluationService evaluationService;
	
	@RequestMapping("evaluation_evaluationList.do")
	public ModelAndView getEvaluationList(int pageNo,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO)session.getAttribute("evo");
		session.setAttribute("left", 2);
		session.setAttribute("map", null);
		int deptNo = evo.getDepartmentVO().getDeptNo();
		EvaluationVO evalVo = new EvaluationVO(new DepartmentVO(evo.getDepartmentVO().getDeptNo()),pageNo);
		List<Object> eList = evaluationService.getEvaluationList(evalVo); 
		int totalContent = evaluationService.totalContent(deptNo);
		PagingBean2 pb = new PagingBean2(totalContent,pageNo);
		ListVO list =new ListVO(eList,pb);
		return new ModelAndView("evaluation_evaluationList","lvo",list);
	}	 
	
	@RequestMapping("evaluation_showContent.do")
	public ModelAndView showContent(int no,HttpServletRequest request){
		EvaluationVO evalVo = evaluationService.showContent(no);
		return new ModelAndView("evaluation_showContent","evalVo",evalVo);
	}
	
	@RequestMapping("evaluation_write.do")
	public String write(){
		return "evaluation_write";
	}
	
	@RequestMapping("evaluation_write_result.do")
	public ModelAndView writeContent(HttpSession session, EvaluationVO vo){
		EmployeeVO evo = (EmployeeVO)session.getAttribute("evo");
		vo.setEmployeeVO(evo);
		evaluationService.writeContent(vo);
		return  new ModelAndView("redirect:evaluation_showContent.do?no="+vo.getEvaluationNo());
	}
	
	@RequestMapping("evaluation_deleteContent.do")
	public ModelAndView deleteContent(int no){
		evaluationService.deleteContent(no);
		return new ModelAndView("redirect:evaluation_evaluationList.do?pageNo=1");
	}
	
	@RequestMapping("evaluation_update.do")
	public ModelAndView update(int no){
		EvaluationVO evalVo = evaluationService.showContent(no);
		return new ModelAndView("evaluation_update","evalVo",evalVo);	
	}
	
	@RequestMapping("evaluation_updateContent.do")
	public ModelAndView updateContent(EvaluationVO evalVo, HttpServletRequest request){
		HttpSession session = request.getSession();
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		evalVo.setEmployeeVO(evo);
		evaluationService.updateContent(evalVo);
		return new ModelAndView("redirect:evaluation_showContent.do?no="+evalVo.getEvaluationNo());	
	}
	
	@RequestMapping("evaluation_dayEvaluation.do")
	public ModelAndView getDayEvaluationList(int pageNo,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO)session.getAttribute("evo");
		session.setAttribute("left", 2);
		session.setAttribute("map", null);
		int deptNo = evo.getDepartmentVO().getDeptNo();
		List<Object> eList = evaluationService.getDayEvaluationList(pageNo);
		int totalContent = evaluationService.totalDayContent(deptNo);
		PagingBean2 pb = new PagingBean2(totalContent,pageNo);
		ListVO list =new ListVO(eList,pb);
		return new ModelAndView("evaluation_dayEvaluationList","lvo",list);
	}
	
	@RequestMapping("evaluationSearchList.do")
	public ModelAndView searchByTitle(String search, String searchVar, int pageNo, HttpServletRequest request){
		HttpSession session = request.getSession(false);
	    if(searchVar.equals("")){
		         session.setAttribute("map", null);
		         return new ModelAndView("redirect:evaluation_evaluationList.do?pageNo=1");
		 }
	    ModelAndView mv = new ModelAndView("evaluation_evaluationList");
	    HashMap<String, String> map = new HashMap<String, String>();
	    map.put("search", search);
	    map.put("searchVar", searchVar);
		List<Object> searchList = null;
		int totalContent = 0;			
		if(search.equals("title")){
			searchList = evaluationService.searchByTitle(searchVar, pageNo);
			totalContent = evaluationService.totalContentByTitle(searchVar);
		}else if(search.equals("content")){
			searchList = evaluationService.searchByContent(searchVar, pageNo);
			totalContent = evaluationService.totalContentBycontent(searchVar);
		}else if(search.equals("titleContent")){
			searchList = evaluationService.searchByTitleContent(searchVar, pageNo);
			totalContent = evaluationService.totalContentByTitleContent(searchVar);
		}
		PagingBean2 pb = new PagingBean2(totalContent,pageNo);
		ListVO list =new ListVO(searchList,pb);
		session.setAttribute("map", map);
		mv.addObject("lvo",list);
		return mv;
	}
	
	
	@RequestMapping("evaluation_evaluationListByDept.do")
	public ModelAndView getEvaluationListByDept(int pageNo,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO)session.getAttribute("evo");
		session.setAttribute("left", 2);
		session.setAttribute("map", null);
		List<Object> eList = evaluationService.getEvaluationListByDept(pageNo); 
		int totalContent = evaluationService.totalContentByDept();
		PagingBean2 pb = new PagingBean2(totalContent,pageNo);
		ListVO list =new ListVO(eList,pb);
		return new ModelAndView("evaluation_evaluationList","lvo",list);
	}	 
	
	
	@RequestMapping("evaluation_evaluationListSearchDept.do")
	public ModelAndView getEvaluationListSearchDept(int pageNo,int deptNo,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO)session.getAttribute("evo");
		session.setAttribute("left", 2);
		session.setAttribute("map", null);
		EvaluationVO evalVo = new EvaluationVO(new DepartmentVO(deptNo),pageNo);
		List<Object> eList = evaluationService.getEvaluationList(evalVo); 
		int totalContent = evaluationService.totalContent(deptNo);
		PagingBean2 pb = new PagingBean2(totalContent,pageNo);
		ListVO list =new ListVO(eList,pb);
		return new ModelAndView("evaluation_evaluationListByDept","lvo",list);
	}	 
	
	
	@RequestMapping("evaluation_todayEvaluationPage.do")
	public ModelAndView getTodayEvaluationPage(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO)session.getAttribute("evo");
		int deptNo=evo.getDepartmentVO().getDeptNo();
		int positionNo = evo.getPositionVO().getPositionNo();
		int count = evaluationService.checkGetTodayCount(deptNo);
		EvaluationVO evalVo = new EvaluationVO(new EmployeeVO(evo.getEmpNo()),new DepartmentVO(deptNo));
		if(positionNo != 4 && count == 0){
			return new ModelAndView("evaluation_evaluationEmpty");
		}
		if(count == 0){
			evaluationService.createEmptyEvaluation(evalVo);		
		}
		String evalNo = evaluationService.findByEvaluationNo(deptNo);
		return new ModelAndView("redirect:evaluation_showContent.do?no="+evalNo);
	}
}
