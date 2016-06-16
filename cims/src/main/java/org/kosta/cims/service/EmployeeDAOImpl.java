package org.kosta.cims.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.model.EmployeeVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeeDAOImpl implements EmployeeDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public EmployeeVO login(EmployeeVO vo){
		return template.selectOne("employee.login",vo);
	}
	@Override
	public void update(EmployeeVO evo){
		template.update("employee.update",evo);
	}
	@Override
	public void register(EmployeeVO evo){
		template.insert("employee.register",evo);
	}
	@Override
	public List<EmployeeVO> findApprover(int deptNo, int positionNo) {
	HashMap<String, Integer> map =new HashMap<String, Integer>();
	map.put("deptNo", deptNo);
	map.put("positionNo", positionNo);
	List<EmployeeVO> list = null;
	list = template.selectList("employee.findApprover",map);
	return list;
	}
	  @Override
      public List<EmployeeVO> findByName(String empName) {
         return template.selectList("employee.findByName",empName);
      }
      @Override
      public void deleteEmp(int empNo) {
         HashMap<String, String> map = new HashMap<String, String>();
         map.put("empNo", "0"+empNo);
         System.out.println(map.toString());
         template.update("employee.deleteEmp", map);
      }
}











