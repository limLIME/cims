package org.kosta.cims.dao;

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
	public EmployeeVO login(EmployeeVO vo) {
		return template.selectOne("employee.login", vo);
	}

	@Override
	public void update(EmployeeVO evo) {
		template.update("employee.update", evo);
	}

	@Override
	public void register(EmployeeVO evo) {
		System.out.println(evo);
		template.insert("employee.register", evo);
	}

	@Override
	public List<EmployeeVO> findByName(String empName) {
		return template.selectList("employee.findByName", empName);
	}

	@Override
	public void deleteEmp(int empNo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("empNo", "0" + empNo);
		System.out.println(map.toString());
		template.update("employee.deleteEmp", map);
	}

	@Override
	public EmployeeVO findByNo(String empNo) {
		// TODO Auto-generated method stub
		return template.selectOne("employee.findByNo", empNo);
	}

	@Override
	public void adminUpdate(EmployeeVO vo) {
		template.update("employee.adminUpdate", vo);
	}

	@Override
	public List<EmployeeVO> findApprover1(int deptNo) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("deptNo", deptNo);
		map.put("positionNo", 2);
		List<EmployeeVO> list = null;
		list = template.selectList("employee.findApprover", map);
		return list;
	}

	@Override
	public List<EmployeeVO> findApprover2(int deptNo) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("deptNo", deptNo);
		map.put("positionNo", 3);
		List<EmployeeVO> list = null;
		list = template.selectList("employee.findApprover", map);
		return list;
	}

	@Override
	public List<EmployeeVO> findApprover3(int deptNo) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("deptNo", deptNo);
		map.put("positionNo", 4);
		List<EmployeeVO> list = null;
		list = template.selectList("employee.findApprover", map);
		return list;
	}

	@Override
	public List<EmployeeVO> findApprover4(int deptNo) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("deptNo", deptNo);
		map.put("positionNo", 5);
		List<EmployeeVO> list = null;
		list = template.selectList("employee.findMaster", map);
		return list;
	}
}
