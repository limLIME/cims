package org.kosta.cims.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.MailVO;
import org.kosta.cims.service.BoardService;
import org.kosta.cims.service.DocumentService;
import org.kosta.cims.service.EmployeeService;
import org.kosta.cims.service.MailService;
import org.kosta.cims.service.NoticeService;
import org.kosta.cims.service.ScheduleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	private EmployeeService empService;
	
	@Resource
	private MailService mailService;
	
	@Resource
	private ScheduleService schService;
	
	@Resource
	private DocumentService docService;
	
	@Resource
	private NoticeService notService;
	
	@Resource
	private BoardService borService;
	
	@RequestMapping("{viewId}.do")
	public String showView(@PathVariable String viewId) {
		System.out.println("@PathVariable:" + viewId);
		return viewId;
	}
	
	@RequestMapping("home.do")
	public String home(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("left", 1);
		EmployeeVO vo = (EmployeeVO) session.getAttribute("evo");
		String empNo = vo.getEmpNo();
		int deptNo = vo.getDepartmentVO().getDeptNo();
		List<EmployeeVO> tlist = empService.getMyTeamList(deptNo);
		List<MailVO> list = mailService.getMyMailList(empNo);
		ArrayList<Integer> list2 = new ArrayList<Integer>();
		list2.add(0, mailService.countMail(empNo));
		list2.add(1, schService.countSch(empNo));
		list2.add(2, docService.countDoc(vo));
		list2.add(3, notService.countNot());
		list2.add(4, borService.countBor());
		session.setAttribute("mainList", list2);
		session.setAttribute("mlist", list);
		session.setAttribute("tlist", tlist);
		return "home";
	}
	
	   @RequestMapping(value = "homeCheck.do", method = RequestMethod.POST)
	   public ModelAndView homeView(EmployeeVO vo, HttpServletRequest request, HttpServletResponse response) {
	      HttpSession session = request.getSession();
	      session.setAttribute("left", 1);
	      EmployeeVO evo = empService.login(vo);
	      System.out.println(evo);
	       if(evo==null){
	          return new ModelAndView("loginFail");
	         }else{
	            Cookie kc = new Cookie("memberNo", null) ;
	            kc.setMaxAge(0) ;
	            response.addCookie(kc) ;
	           session.setAttribute("evo", evo);
	            return new ModelAndView("redirect:home.do");
	         }
	   }
	   
	@RequestMapping("lock_lock_screen.do")
	   public String lockScreen(HttpServletResponse response){
	       // 회원번호
	       String memberNo = "1" ;

	       Cookie c = new Cookie("memberNo", memberNo) ;
	        
	       // 쿠키에 설명을 추가한다
	       c.setMaxAge(60*60*24) ;   
	       response.addCookie(c) ;
	      return "lock_lock_screen";
	   }
}
