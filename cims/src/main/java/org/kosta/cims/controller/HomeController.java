package org.kosta.cims.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.MailVO;
import org.kosta.cims.service.EmployeeService;
import org.kosta.cims.service.MailService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	/*
	 * @PathVariable : 요청 url 정보를 변수로 할당 받는다 요청 url 과 일치하는 url 매핑 정보가 있으면 ( 즉
	 * 별도의 메서드가 있으면 ) 그 메서드가 실행되고 없으면
	 * 
	 * @PathVariable 적용 메서드가 실행된다
	 */
	@Resource
	private EmployeeService empService;

	@RequestMapping("{viewId}.do")
	public String showView(@PathVariable String viewId) {
		System.out.println("@PathVariable:" + viewId);
		return viewId;
	}
	
	@RequestMapping("home.do")
	public String home(HttpSession session) {
		return "home";
	}

	@RequestMapping("homeCheck.do")
	@ResponseBody
	public String homeView(EmployeeVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("left", 1);
		String result=null;
		EmployeeVO evo = empService.login(vo);
		System.out.println(vo);
		 if(evo==null){
	         result = "fail";
	         System.out.println("실패");
	      }else{
	    	 session.setAttribute("evo", evo);
	         result = "success";
	         System.out.println(result);
	      }
		/*List<MailVO> mlist = mailService.currentMail(vo.getEmpNo());*/
		return result;
	}
}
