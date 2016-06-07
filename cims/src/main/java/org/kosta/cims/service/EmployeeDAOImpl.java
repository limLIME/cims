package org.kosta.cims.service;

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
}
