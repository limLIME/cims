package org.kosta.cims.service;

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
}
