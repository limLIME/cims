package org.kosta.cims.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.ListVO;
import org.kosta.cims.model.MailVO;
import org.kosta.cims.model.PagingBean;
import org.kosta.cims.service.MailService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MailController {
	@Resource
	private MailService mailService;
	
	@Resource(name="mailPath")
	private String mailPath;
	
	@RequestMapping("mail_sendForm.do")
	public String mail_sendForm(HttpServletRequest request){
		HttpSession session=request.getSession(false);
		session.setAttribute("left", 12);
		return "mail_sendForm";
	}
	//받은 메일리스트 받기
	@RequestMapping("mail_getReceiveList.do")
	public ModelAndView getReceiveList(int pageNo,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		session.setAttribute("left", 13);
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
			session.setAttribute("left", 14);
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
			session.setAttribute("left", 15);
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
	
	//메일 삭제
	@RequestMapping("mail_deleteMail.do")
	public ModelAndView deleteMail(int no){
		mailService.deleteMail(no);
		return new ModelAndView("redirect:mail.do?pageNo=1");
	}
	
	@RequestMapping("mail_sendMail.do")
	public ModelAndView sendMail(MailVO mailVO,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		mailVO.setEmployeeVO(evo);
		mailVO.setMailSender(evo.getEmpNo());

		MultipartFile file = mailVO.getFilePath(); // 파일
		if(file.isEmpty()==false){
			File uploadFile = new File(mailPath+file.getOriginalFilename());
			try {
				file.transferTo(uploadFile); 
				mailVO.setMailPath(file.getOriginalFilename());//케이윌
			} catch (IllegalStateException | IOException e) { 
				e.printStackTrace();
			}
		}else{
			mailVO.setMailPath("1");
		}

		mailService.sendMail(mailVO);
		return new ModelAndView("mail_ok");
	}

	
}
