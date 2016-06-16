package org.kosta.cims.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.cims.model.DepartmentVO;
import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.PositionVO;
import org.kosta.cims.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class EmployeeController {
	/*
	 * @PathVariable : 요청 url 정보를 변수로 할당 받는다 요청 url 과 일치하는 url 매핑 정보가 있으면 ( 즉
	 * 별도의 메서드가 있으면 ) 그 메서드가 실행되고 없으면
	 * 
	 * @PathVariable 적용 메서드가 실행된다
	 */
	@Resource
	private EmployeeService service;

	@Resource(name = "signPath")
	private String signPath;

	@RequestMapping("emp_update.do")
	public String update(EmployeeVO evo, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO vo = (EmployeeVO) session.getAttribute("evo");
		System.out.println(evo);
		MultipartFile file = evo.getMultipartFile(); // 파일
		if (file.isEmpty() == false) {
			File uploadFile = new File(signPath + file.getOriginalFilename());
			try {
				file.transferTo(uploadFile); // 실제 디렉토리로 파일을 저장한다
				System.out.println(signPath + "에 파일업로드");
				vo.setEmpSign(file.getOriginalFilename());
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		vo.setPassword(evo.getPassword());
		vo.setEmpTel(evo.getEmpTel());
		service.update(vo);

		session.setAttribute("evo", vo);
		return "emp_update_result";
	}

	@RequestMapping("emp_register.do")
	public String register(EmployeeVO evo, int deptNo, int positionNo) {
		evo.setDepartmentVO(new DepartmentVO(deptNo, ""));
		evo.setPositionVO(new PositionVO(positionNo, ""));

		MultipartFile file = evo.getMultipartFile(); // 파일
		if (file.isEmpty() == false) {
			File uploadFile = new File(signPath + file.getOriginalFilename());
			try {
				file.transferTo(uploadFile); // 실제 디렉토리로 파일을 저장한다
				System.out.println(signPath + "에 파일업로드");
				evo.setEmpSign(file.getOriginalFilename());
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		service.register(evo);

		return "emp_register_result";
	}
	@RequestMapping("emp_logout.do")
	   public String logout(HttpServletRequest request) {
	      HttpSession session = request.getSession(false);
	      if (session != null)
	         session.invalidate();
	      return "../../index";
	   } 
	
	  @RequestMapping("emp_deleteEmp.do")
      @ResponseBody
      public List<EmployeeVO> delete(int empNo, String empName){
         service.deleteEmp(empNo);
         List<EmployeeVO> list = service.findByName(empName);
         return list;
      }

	  @RequestMapping("emp_findByName.do")
      @ResponseBody
      public List<EmployeeVO> findByName(String empName){
         List<EmployeeVO> list = service.findByName(empName);
         return list;
      }
}
