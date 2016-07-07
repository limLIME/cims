package org.kosta.cims.service;

import java.util.List;

import org.kosta.cims.model.DepartmentVO;
import org.kosta.cims.model.EmployeeVO;

public interface EmployeeService {

	public abstract EmployeeVO login(EmployeeVO vo);

	public abstract void update(EmployeeVO evo);

	public abstract void register(EmployeeVO evo);

	public abstract List<EmployeeVO> findByName(String empName);

	public abstract void deleteEmp(String empNo);

	public abstract EmployeeVO findByNo(String empNo);

	public abstract void adminUpdate(EmployeeVO vo);

	public abstract List<EmployeeVO> findApprover1(int deptNo);

	public abstract List<EmployeeVO> findApprover2(int deptNo);

	public abstract List<EmployeeVO> findApprover3(int deptNo);

	public abstract List<EmployeeVO> findApprover4(int deptNo);

	public abstract List<DepartmentVO> deptList();

	public abstract List<EmployeeVO> seardBydeptName(String deptName);

	public abstract List<EmployeeVO> findSubstitute(String empNo, int deptNo,
			int positionNo);

	public abstract EmployeeVO getMySubstitute(String empNo);

	public abstract void updateSubstitute(String empNo, String subNo);

	public abstract void updateMyState(String empNo,int state);
	
	public abstract List<Object> getMyTeamList(int deptNo,int pageNo);
	
	public abstract int getTeamCount(int deptNo);
}