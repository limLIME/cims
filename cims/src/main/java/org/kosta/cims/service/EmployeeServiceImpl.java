package org.kosta.cims.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.dao.EmployeeDAO;
import org.kosta.cims.model.DepartmentVO;
import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.PositionVO;
import org.springframework.stereotype.Service;


@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Resource
	private EmployeeDAO dao;

	@Override
	public EmployeeVO login(EmployeeVO vo) {
		return dao.login(vo);
	}

	@Override
	public void update(EmployeeVO evo) {
		dao.update(evo);
	}

	@Override
	public void register(EmployeeVO evo) {
		dao.register(evo);
	}

	@Override
	public List<EmployeeVO> findByName(String empName) {
		return dao.findByName(empName);
	}

	@Override
	public void deleteEmp(String empNo) {
		dao.deleteEmp(empNo);
	}

	@Override
	public EmployeeVO findByNo(String empNo) {
		// TODO Auto-generated method stub
		return dao.findByNo(empNo);
	}

	@Override
	public void adminUpdate(EmployeeVO vo) {
		dao.adminUpdate(vo);

	}
	
	@Override
	   public List<EmployeeVO> findApprover1(int deptNo) {
	      return dao.findApprover1(deptNo);
	   }
	   @Override
	   public List<EmployeeVO> findApprover2(int deptNo) {
	      return dao.findApprover2(deptNo);
	   }
	   @Override
	   public List<EmployeeVO> findApprover3(int deptNo) {
	      return dao.findApprover3(deptNo);
	   }
	   @Override
	   public List<EmployeeVO> findApprover4(int deptNo) {
	      return dao.findApprover4(deptNo);
	   }
	   @Override
	   public List<DepartmentVO> deptList() {
	      return dao.deptList();
	   }
	   @Override
	   public List<PositionVO> positionList() {
	      return dao.positionList();
	   }

	   @Override
	   public List<EmployeeVO> seardBydeptName(String deptName) {
	      return dao.seardBydeptName(deptName);
	   }
	   @Override
		public List<EmployeeVO> findSubstitute(String empNo,int deptNo,int positionNo){
	   return dao.findSubstitute(empNo,deptNo,positionNo);
	   }
	   @Override
	   public EmployeeVO getMySubstitute(String empNo){
		   return dao.getMySubstitute(empNo);
	   }
	   
	   @Override
	   public void updateSubstitute(String empNo,String subNo){
		   dao.updateSubstitute(empNo,subNo);
	   }
	   @Override
	   public  void updateMyState(String empNo,int state){
		   dao.updateMyState(empNo,state);
		   }
	   @Override
		public List<Object> getMyTeamList(int deptNo,int pageNo) {
			return dao.getMyTeamList(deptNo,pageNo);
		}
	   @Override
	   public int getTeamCount(int deptNo) {
	          return dao.getTeamCount(deptNo);
	   }
	   
}
