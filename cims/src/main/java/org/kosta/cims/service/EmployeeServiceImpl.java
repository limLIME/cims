package org.kosta.cims.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.dao.EmployeeDAO;
import org.kosta.cims.model.EmployeeVO;
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
	public void deleteEmp(int empNo) {
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
}
