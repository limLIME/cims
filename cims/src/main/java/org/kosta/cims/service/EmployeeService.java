package org.kosta.cims.service;

import java.util.List;

import org.kosta.cims.model.EmployeeVO;

public interface EmployeeService {

	public abstract EmployeeVO login(EmployeeVO vo);
	public abstract void update(EmployeeVO evo);
	public abstract void register(EmployeeVO evo);
	public abstract List<EmployeeVO> findApprover(int deptNo, int positionNo);
	public abstract List<EmployeeVO> findByName(String empName);
	public abstract void deleteEmp(int empNo);
}