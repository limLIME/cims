package org.kosta.cims.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.cims.model.DepartmentVO;
import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.ListVO;
import org.kosta.cims.model.MailVO;
import org.kosta.cims.model.PagingBean;
import org.kosta.cims.service.EmployeeService;
import org.kosta.cims.service.MailService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MailController {
	@Resource
	private MailService mailService;
	@Resource
	private EmployeeService employeeService;
	
	@Resource(name="mailPath")
	private String mailPath;
	
	@RequestMapping("mail_sendForm.do")
	public String sendForm(HttpServletRequest request){
		HttpSession session=request.getSession(false);
		session.setAttribute("left", 3);
		return "mail_sendForm";
	}
	
	//답장하기
	@RequestMapping("mail_replyMail.do")
	public ModelAndView replyMail(String receiver,HttpServletRequest request){
		HttpSession session=request.getSession(false);
		session.setAttribute("left", 3);
		return new ModelAndView("mail_sendForm","receiver",receiver);
	}
	
	//받은 메일리스트 받기
	@RequestMapping("mail_getReceiveList.do")
	public ModelAndView getReceiveList(int pageNo,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		session.setAttribute("left", 4);
		EmployeeVO evo = (EmployeeVO)session.getAttribute("evo");
		List<Object> list = mailService.getReceiveMailList(evo.getEmpNo(),pageNo);
		int totalReceiveContent = mailService.totalReceiveMailContent(evo.getEmpNo());
		PagingBean pb = new PagingBean(totalReceiveContent,pageNo);
		ListVO lvo =new ListVO(list,pb);
		return new ModelAndView("mail_receivemail","lvo",lvo);
	}
	//보낸 메일리스트 받기
		@RequestMapping("mail_getSendList.do")
		public ModelAndView getSendList(int pageNo,HttpServletRequest request){
			HttpSession session = request.getSession(false);
			session.setAttribute("left", 5);
			EmployeeVO evo = (EmployeeVO)session.getAttribute("evo");
			List<Object> list = mailService.getSendMailList(evo.getEmpNo(),pageNo);
			int totalSendContent = mailService.totalSendMailContent(evo.getEmpNo());
			PagingBean pb = new PagingBean(totalSendContent,pageNo);
			ListVO lvo =new ListVO(list,pb);
			return new ModelAndView("mail_sendmail","lvo",lvo);
		}
		//수신확인리스트
		@RequestMapping("mail_getCheckList.do")
		public ModelAndView getCheckList(int pageNo,HttpServletRequest request){
			HttpSession session = request.getSession(false);
			session.setAttribute("left", 6);
			EmployeeVO evo = (EmployeeVO)session.getAttribute("evo");
			List<Object> list = mailService.getSendMailList(evo.getEmpNo(),pageNo);
			int totalSendContent = mailService.totalSendMailContent(evo.getEmpNo());
			PagingBean pb = new PagingBean(totalSendContent,pageNo);
			ListVO lvo =new ListVO(list,pb);
			return new ModelAndView("mail_checkmail","lvo",lvo);
		}
		
		
	//메일본문보기
	@RequestMapping("mail_showMailContent.do")
	public ModelAndView showMailContent(int no, HttpServletRequest request){
		HttpSession session=request.getSession(false);
		EmployeeVO vo=(EmployeeVO)session.getAttribute("evo");
		
		MailVO mailVO = mailService.showMailContent(no,vo.getEmpNo());
		return new ModelAndView("mail_showMailContent","mailVO",mailVO);
	}
	//보낸메일함,수신확인 에서 메일보기
	@RequestMapping("mail_showMailContent2.do")
	public ModelAndView showMailContent2(int no, HttpServletRequest request){
		HttpSession session=request.getSession(false);
		EmployeeVO vo=(EmployeeVO)session.getAttribute("evo");
		
		MailVO mailVO = mailService.showMailContent(no,vo.getEmpNo());
		return new ModelAndView("mail_showMailContent2","mailVO",mailVO);
	}
	//메일 삭제
	@RequestMapping("mail_deleteMail.do")
	public ModelAndView deleteMail(HttpServletRequest request,String receiver,String sender,int no){
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		sender=sender.substring(sender.indexOf("(")+1, sender.indexOf(")"));
		receiver=receiver.substring(receiver.indexOf("(")+1, receiver.indexOf(")"));
		
		if(receiver.equals(sender)){//보낸이와 받은이가같다면 즉 내가보낸것이라면
			mailService.sDeleteMail(no);
			mailService.rDeleteMail(no);
		}else if(evo.getEmpNo().equals(sender)){//보낸이가 나라면 sdelete 보낸메시지함
			mailService.sDeleteMail(no);
		}else if(evo.getEmpNo().equals(receiver)){//받은이가 내가아니라면 rdelete 받은메시지함
			mailService.rDeleteMail(no);
		}
		
		return new ModelAndView("mail_deleteResult");
	}
	
	@RequestMapping("mail_sendMail.do")
	public ModelAndView sendMail(MailVO mailVO,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		mailVO.setMailReceiver(mailVO.getMailReceiver().substring(mailVO.getMailReceiver().indexOf("(")+1, mailVO.getMailReceiver().indexOf(")")));
		mailVO.setMailSender(evo.getEmpNo());

		MultipartFile file = mailVO.getFilePath(); // 파일
		if(file.isEmpty()==false){
			File uploadFile = new File(mailPath+file.getOriginalFilename());
			try {
				file.transferTo(uploadFile); 
				mailVO.setMailPath(file.getOriginalFilename());//케이윌
			} catch (Exception e) { 
				e.printStackTrace();
			}
		}else{
			mailVO.setMailPath("1");
		}

		mailService.sendMail(mailVO);
		return new ModelAndView("mail_ok");
	}
	
		
	@RequestMapping("mail_popup.do")
	public ModelAndView popup(HttpServletRequest request, String txt) {
		List<DepartmentVO> list = employeeService.deptList();
		ModelAndView mv = new ModelAndView();

		mv.addObject("deptList", list);
		mv.setViewName("mail/search");

		return mv;
	}

	@RequestMapping("mail_seardBydeptName.do")
	@ResponseBody
	public List<EmployeeVO> seardBydeptName(String deptName) {
		List<EmployeeVO> list = employeeService.seardBydeptName(deptName);
		return list;
	}

	@RequestMapping("mail_findByName.do")
	@ResponseBody
	public List<EmployeeVO> findByName(String empName) {
		List<EmployeeVO> list = employeeService.findByName(empName);
		return list;
	}
}
