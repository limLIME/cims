package org.kosta.cims.dao;

import java.util.List;

import org.kosta.cims.model.EmployeeVO;

public interface EmployeeDAO {

	public abstract EmployeeVO login(EmployeeVO vo);

	public abstract void update(EmployeeVO evo);

	public abstract void register(EmployeeVO evo);

	public abstract List<EmployeeVO> findByName(String empName);

	public abstract void deleteEmp(int empNo);

	public abstract EmployeeVO findByNo(String empNo);

	public abstract void adminUpdate(EmployeeVO vo);

	public abstract List<EmployeeVO> findApprover1(int deptNo);

	public abstract List<EmployeeVO> findApprover2(int deptNo);

	public abstract List<EmployeeVO> findApprover3(int deptNo);

	public abstract List<EmployeeVO> findApprover4(int deptNo);

}