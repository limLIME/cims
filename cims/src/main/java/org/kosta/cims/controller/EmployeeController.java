package org.kosta.cims.controller;

import java.io.File;
import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping("emp_updateSearch.do")
	public String deleteform(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		session.setAttribute("left", 17);
		return "emp_updateSearch";
	}
	
	
	@RequestMapping("emp_update.do")
	public String update(EmployeeVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.setAttribute("left", 0);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		List<MultipartFile> list=vo.getFile();
	      //view 화면에 업로드 된 파일 목록을 전달하기 위한 리스트 
	      ArrayList<String> nameList=new ArrayList<String>();
	      for(int i=0;i<list.size();i++){
	         //만약 업로드 파일이 없으면 파일명은 공란처리된다 
	         String fileName=list.get(i).getOriginalFilename();
	         //업로드 파일이 있으면 파일을 특정경로로 업로드한다
	         if(!fileName.equals("")){         
	            try {
	               list.get(i).transferTo(new File(signPath+fileName));
	            
	               nameList.add(fileName);
	            } catch (Exception e) {               
	               e.printStackTrace();
	            } 
	            if(i==0)
	            	vo.setEmpSign(list.get(i).getOriginalFilename());
	            if(i==1)
	            	vo.setEmpPath(list.get(i).getOriginalFilename());
	         }else{
	        	 vo.setEmpSign(evo.getEmpSign());
	        	 vo.setEmpPath(evo.getEmpPath());
	         }
	      }
	      vo.setDepartmentVO(new DepartmentVO(evo.getDepartmentVO().getDeptNo()));
	      vo.setPositionVO(new PositionVO(evo.getPositionVO().getPositionNo()));
		service.update(vo);
		evo.setPassword(vo.getPassword());
		evo.setEmpSign(vo.getEmpSign());
		evo.setEmpPath(vo.getEmpPath());
		
		return "emp_update_result";
	}
	

	@RequestMapping("emp_register.do")
	public String register(EmployeeVO evo, int deptNo, int positionNo,HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.setAttribute("left", 18);
		evo.setDepartmentVO(new DepartmentVO(deptNo));
		evo.setPositionVO(new PositionVO(positionNo));

		List<MultipartFile> list=evo.getFile();
	      //view 화면에 업로드 된 파일 목록을 전달하기 위한 리스트 
	      ArrayList<String> nameList=new ArrayList<String>();
	      for(int i=0;i<list.size();i++){
	         //만약 업로드 파일이 없으면 파일명은 공란처리된다 
	         String fileName=list.get(i).getOriginalFilename();
	         //업로드 파일이 있으면 파일을 특정경로로 업로드한다
	         if(!fileName.equals("")){         
	            try {
	               list.get(i).transferTo(new File(signPath+fileName));
	               nameList.add(fileName);
	            } catch (Exception e) {               
	               e.printStackTrace();
	            }
	            if(i==0)
	            	evo.setEmpSign(list.get(i).getOriginalFilename());
	            if(i==1)
	            	evo.setEmpPath(list.get(i).getOriginalFilename());
	         }else{
	        	 evo.setEmpPath("1");
	        	 evo.setEmpSign("1");
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
	      return "../../index2";
	   } 
	
	  @RequestMapping("emp_adminDeleteEmp.do")
       public String deleteEmp(String empNo){
         service.deleteEmp(empNo);
         return "emp_updateSearch";
      }

	  @RequestMapping("emp_findByName.do")
      @ResponseBody
      public List<EmployeeVO> findByName(String empName){
         List<EmployeeVO> list = service.findByName(empName);
         return list;
      }
	  
	  @RequestMapping("emp_adminUpdateEmp.do")
	  public ModelAndView adminUpdateEmp(String empNo) {
		  EmployeeVO vo = service.findByNo(empNo);
		return new ModelAndView("emp_adminUpdateEmp","vo",vo);
	  }
	   
	  @RequestMapping("emp_adminUpdate.do")
	  public String adminUpdateResult(EmployeeVO vo ,int deptNo, int positionNo) {
			EmployeeVO evo = service.findByNo(vo.getEmpNo());
			List<MultipartFile> list=vo.getFile();
			vo.setDepartmentVO(new DepartmentVO(deptNo));
			vo.setPositionVO(new PositionVO(positionNo));
		      //view 화면에 업로드 된 파일 목록을 전달하기 위한 리스트 
		      ArrayList<String> nameList=new ArrayList<String>();
		      for(int i=0;i<list.size();i++){
		         //만약 업로드 파일이 없으면 파일명은 공란처리된다 
		         String fileName=list.get(i).getOriginalFilename();
		         //업로드 파일이 있으면 파일을 특정경로로 업로드한다
		         if(!fileName.equals("")){         
		            try {
		               list.get(i).transferTo(new File(signPath+fileName));
		               nameList.add(fileName);
		            } catch (Exception e) {               
		               e.printStackTrace();
		            } 
		            if(i==0)
		            	vo.setEmpSign(list.get(i).getOriginalFilename());
		            if(i==1)
		            	vo.setEmpPath(list.get(i).getOriginalFilename());
		         }else{
		        	 if(evo.getEmpPath() == null){
		        		 vo.setEmpPath("1");
		        	 }else{
		        		 vo.setEmpPath(evo.getEmpPath());
		        	 }
		        	 if(evo.getEmpSign()==null){
		        		 vo.setEmpPath("1");
		        	 }else{
		        		 vo.setEmpSign(evo.getEmpSign());
		        	 }
		         }
		      }
		      System.out.println("업데이트"+vo);
			service.adminUpdate(vo);
			return "emp_adminUpdateEmp_result";
		}
	  
	  @RequestMapping("emp_updateMyState.do")
	  public String updateMyState(HttpServletRequest request,int state) {
		HttpSession session = request.getSession(false);

		EmployeeVO vo =(EmployeeVO) session.getAttribute("evo");
		String empNo=vo.getEmpNo();
		service.updateMyState(empNo,state);
		vo.setEmpState(state);
		return "redirect:home.do?pageNo=1";
	  }
	   @RequestMapping("emp_searchemp.do")
	     public ModelAndView searchemp(HttpServletRequest request){
		   HttpSession session = request.getSession(false);
		   session.setAttribute("left", 24);
	        List<DepartmentVO> list = service.deptList();
	        return new ModelAndView("emp_searchemp","deptList",list);
	     }

	   @RequestMapping("emp_updateform.do")
	     public String emp_updateform(HttpServletRequest request){
		   HttpSession session = request.getSession(false);
		   session.setAttribute("left", 0);
	        return "emp_updateform";
	     }
	     @RequestMapping("emp_seardBydeptName.do")
	      @ResponseBody
	     public List<EmployeeVO> seardBydeptName(String deptName){
	        List<EmployeeVO> list = service.seardBydeptName(deptName);
	        return list;
	     }
	     
	     
	  }
	  
	  


	