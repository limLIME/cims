package org.kosta.cims.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.model.DepartmentVO;
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
	public void deleteEmp(String empNo) {
			template.update("employee.deleteEmp", empNo);
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
	
	   @Override
	   public List<DepartmentVO> deptList() {
	      return template.selectList("employee.deptList");
	   }

	   @Override
	   public List<EmployeeVO> seardBydeptName(String deptName) {
	      return template.selectList("employee.seardBydeptName", deptName);
	   }
	   @Override
		public List<EmployeeVO> findSubstitute(String empNo,int deptNo,int positionNo){
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("deptNo", ""+deptNo);
			map.put("positionNo", ""+positionNo);
			map.put("empNo", empNo);
			
			
			return template.selectList("employee.findSubstitute",map);
		}
	@Override
		public EmployeeVO getMySubstitute(String empNo){
			String subNo = template.selectOne("employee.getMySubstitute",empNo);
			if(subNo==null){
				return null;
			}else{
				return template.selectOne("employee.subInfo",subNo);
			}

		}
	@Override
		public  void updateSubstitute(String empNo, String subNo){
			HashMap<String,String> map = new HashMap<String, String>();
			map.put("empNo",empNo);
			map.put("subNo",subNo);
			template.update("employee.updateSubstitute",map);
		}
	@Override
	public void updateMyState(String empNo,int state){
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("state", ""+state);
		map.put("empNo", empNo);
		template.update("employee.updateMyState",map);
	}
	@Override
	public List<EmployeeVO> getMyTeamList(int deptNo) {
		return template.selectList("employee.getMyTeamList", deptNo);
	}
}
