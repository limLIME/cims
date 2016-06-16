package org.kosta.cims.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.model.EmployeeVO;
import org.springframework.stereotype.Service;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Resource
	private EmployeeDAO dao;
	
	@Override
	public EmployeeVO login(EmployeeVO vo){
		return dao.login(vo);
	}
	@Override
	public void update(EmployeeVO evo){
		dao.update(evo);
	}

	@Override
	public void register(EmployeeVO evo){
		dao.register(evo);
	}
	@Override
	public List<EmployeeVO> findApprover(int deptNo, int positionNo) {
		return dao.findApprover(deptNo,positionNo);
	}
	@Override
	   public List<EmployeeVO> findByName(String empName) {
	      return dao.findByName(empName);
	   }

	   @Override
	   public void deleteEmp(int empNo) {
	      dao.deleteEmp(empNo);
	   }
	
}
