package org.kosta.cims.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.dao.EvaluationDAO;
import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.EvaluationVO;
import org.springframework.stereotype.Service;

@Service
public class EvaluationServiceImpl implements EvaluationService {
	@Resource
	private EvaluationDAO evaluationDAO;
	
	/* (non-Javadoc)
	 * @see org.kosta.cims.service.EvaluationService#getEvaluationList(int)
	 */
	@Override
	public List<Object> getEvaluationList(EvaluationVO evalVo){
		return evaluationDAO.getEvaluationList(evalVo);
	}
	
	@Override
	public int totalContent(int deptNo){
		return evaluationDAO.totalContent(deptNo);
	}
	
	@Override
	public EvaluationVO showContent(int no){
		return evaluationDAO.showContent(no);
	}
	
	@Override
	public void writeContent(EvaluationVO vo){
		evaluationDAO.writeContent(vo);
	}
	
	@Override
	public void deleteContent(int no){
		evaluationDAO.deleteContent(no);
	}
	
	@Override
	public void updateContent(EvaluationVO evalVo){
		evaluationDAO.updateContent(evalVo);
	}
	
	@Override
	public List<Object> getDayEvaluationList(int pageNo){
		return evaluationDAO.getDayEvaluationList(pageNo);
	}
	
	@Override
	public int totalDayContent(int deptNo){
		return evaluationDAO.totalDayContent(deptNo);
	}
	
	@Override
	public List<Object> searchByTitle(String searchVar, int pageNo){
		return evaluationDAO.searchByTitle(searchVar, pageNo);
	}
	
	@Override
	public int totalContentByTitle(String searchVar){
		return evaluationDAO.totalContentByTitle(searchVar);
	}
	
	@Override
	public List<Object> searchByContent(String searchVar, int pageNo){
		return evaluationDAO.searchByContent(searchVar, pageNo);
	}
	
	@Override
	public int totalContentBycontent(String searchVar){
		return evaluationDAO.totalContentBycontent(searchVar);
	}
	
	@Override
	public List<Object> searchByTitleContent(String searchVar, int pageNo){
		return evaluationDAO.searchByTitleContent(searchVar, pageNo);
	}
	
	@Override
	public int totalContentByTitleContent(String searchVar){
		return evaluationDAO.totalContentByTitleContent(searchVar);
	}
	
	@Override
	public int totalContentByDept(){
		return evaluationDAO.totalContentByDept();
	}

	@Override
	public List<Object> getEvaluationListByDept(int pageNo) {
		// TODO Auto-generated method stub
		return evaluationDAO.getEvaluationListByDept(pageNo);
	}

	@Override
	public int checkGetTodayCount(int deptNo) {
		return evaluationDAO.checkGetTodayCount(deptNo);
	}

	@Override
	public void createEmptyEvaluation(EvaluationVO evalVo) {
		evaluationDAO.createEmptyEvaluation(evalVo);
		
	}

	@Override
	public String findByEvaluationNo(int deptNo) {
		return evaluationDAO.findByEvaluationNo(deptNo);
	}
}
