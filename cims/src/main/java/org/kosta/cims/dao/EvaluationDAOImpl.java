package org.kosta.cims.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.EvaluationVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class EvaluationDAOImpl implements EvaluationDAO {
	@Resource
	private SqlSessionTemplate template;
	
	/* (non-Javadoc)
	 * @see org.kosta.cims.dao.EvaluationDAO#getEvaluationList(int)
	 */
	@Override
	public List<Object> getEvaluationList(EvaluationVO evalVo){
		return template.selectList("evaluation.getEvaluationList",evalVo);
	}
	
	@Override
	public int totalContent(int deptNo){
		return template.selectOne("evaluation.totalContent",deptNo);
	}
	
	@Override
	public EvaluationVO showContent(int no){
		return template.selectOne("evaluation.showContent",no);
	}
	
	@Override
	public void writeContent(EvaluationVO vo){
		template.insert("evaluation.writeContent",vo);
	}
	
	@Override
	public void deleteContent(int no){
		template.delete("evaluation.deleteContent",no);
	}
	
	@Override
	public void updateContent(EvaluationVO evalVo){
		template.update("evaluation.updateContent",evalVo);
	}
	
	@Override
	public List<Object> getDayEvaluationList(int pageNo){
		System.out.println(template.selectList("evaluation.getDayEvaluationList",pageNo));
		return template.selectList("evaluation.getDayEvaluationList",pageNo);
	}
	
	@Override
	public int totalDayContent(int deptNo){
		return template.selectOne("evaluation.totalDayContent",deptNo);
	}
	
	@Override
	public List<Object> searchByTitle(String searchVar, int pageNo){
		EvaluationVO evalVo = new EvaluationVO(searchVar, pageNo);
		return template.selectList("evaluation.searchByTitle",evalVo);
	}
	
	@Override
	public int totalContentByTitle(String searchVar){
		return template.selectOne("evaluation.totalContentByTitle",searchVar);
	}
	
	@Override
	public List<Object> searchByContent(String searchVar, int pageNo){
		EvaluationVO evalVo = new EvaluationVO(searchVar, pageNo);
		return template.selectList("evaluation.searchByContent",evalVo);
	}
	
	@Override
	public int totalContentBycontent(String searchVar){
		return template.selectOne("evaluation.totalContentBycontent",searchVar);
	}
	
	@Override
	public List<Object> searchByTitleContent(String searchVar, int pageNo){
		EvaluationVO evalVo = new EvaluationVO(searchVar,searchVar,pageNo);
		return template.selectList("evaluation.searchByTitleContent",evalVo);
	}
	
	@Override
	public int totalContentByTitleContent(String searchVar){
		return template.selectOne("evaluation.totalContentByTitleContent",searchVar);
	}
	
	@Override
	public int totalContentByDept(){
		return template.selectOne("evaluation.totalContentByDept");
	}

	@Override
	public List<Object> getEvaluationListByDept(int pageNo) {
		// TODO Auto-generated method stub
		return template.selectList("evaluation.getEvaluationListByDept",pageNo);
	}

	@Override
	public int checkGetTodayCount(int deptNo) {
		return template.selectOne("evaluation.checkGetTodayCount",deptNo);
	}

	@Override
	public void createEmptyEvaluation(EvaluationVO evalVo) {
		template.insert("evaluation.createEmptyEvaluation",evalVo);
		
	}

	@Override
	public String findByEvaluationNo(int deptNo) {
		return template.selectOne("evaluation.findByEvaluationNo",deptNo);
	}
	

}
