package org.kosta.cims.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	/*
	 * @PathVariable : 요청 url 정보를 변수로 할당 받는다 요청 url 과 일치하는 url 매핑 정보가 있으면 ( 즉
	 * 별도의 메서드가 있으면 ) 그 메서드가 실행되고 없으면
	 * 
	 * @PathVariable 적용 메서드가 실행된다
	 */
	@Resource
	private EmployeeService service;

	@RequestMapping("{viewId}.do")
	public String showView(@PathVariable String viewId) {
		System.out.println("@PathVariable:" + viewId);
		return viewId;
	}

	@RequestMapping("home.do")
	public String homeView(String emp_no, String password, HttpSession session,
			HttpServletRequest request) {
		EmployeeVO vo = new EmployeeVO();
		vo.setEmp_no(emp_no);
		vo.setPassword(password);
		session = request.getSession(false);
		vo = service.login(vo);
		session.setAttribute("mvo", vo);
		return "home";
	}
}
