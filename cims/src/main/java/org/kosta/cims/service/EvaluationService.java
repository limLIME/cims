package org.kosta.cims.service;

import java.util.List;

import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.EvaluationVO;

public interface EvaluationService {

	public abstract List<Object> getEvaluationList(EvaluationVO evalVo);
	public abstract EvaluationVO showContent(int no);
	public abstract void writeContent(EvaluationVO vo);
	public abstract void deleteContent(int no);
	public abstract void updateContent(EvaluationVO evalVo);
	public abstract List<Object> getDayEvaluationList(int pageNo);
	public abstract List<Object> searchByTitle(String searchVar, int pageNo);
	public abstract int totalContentByTitle(String searchVar);
	public abstract List<Object> searchByContent(String searchVar, int pageNo);
	public abstract int totalContentBycontent(String searchVar);
	public abstract List<Object> searchByTitleContent(String searchVar, int pageNo);
	public abstract int totalContentByTitleContent(String searchVar);
	public abstract int totalContent(int deptNo);
	public abstract int totalDayContent(int deptNo);
	public abstract int totalContentByDept();
	public abstract List<Object> getEvaluationListByDept(int pageNo);
	public abstract int checkGetTodayCount(int deptNo);
	public abstract void createEmptyEvaluation(EvaluationVO evalVo);
	public abstract String findByEvaluationNo(int deptNo);

}