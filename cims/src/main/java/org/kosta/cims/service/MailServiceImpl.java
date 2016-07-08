package org.kosta.cims.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.dao.MailDAO;
import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.MailVO;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService {
	@Resource
	private MailDAO mailDAO;


	@Override
	public List<Object> getSendMailList(String empNo, int pageNo) {
				
		List<MailVO> mail=mailDAO.getSendMailList(empNo, pageNo);
		List<Object> smail=new ArrayList<Object>();
		if(mail!=null){
		for(int i=0;i<mail.size();i++){
			EmployeeVO e1= mailDAO.findById(mail.get(i).getMailReceiver());
			EmployeeVO e2= mailDAO.findById(mail.get(i).getMailSender());
			String receiver =e1.getDepartmentVO().getDeptName()+" "+e1.getPositionVO().getPositionName()+" "+e1.getEmpName()+" ("+e1.getEmpNo()+")";
			String sender = e2.getDepartmentVO().getDeptName()+" "+e2.getPositionVO().getPositionName()+" "+e2.getEmpName()+" ("+e2.getEmpNo()+")";
			mail.get(i).setMailReceiver(receiver);
			mail.get(i).setMailSender(sender);
			smail.add(mail.get(i));
		}
		}
		return smail;
	}

	@Override
	public List<Object> getReceiveMailList(String empNo, int pageNo) {
	
		List<MailVO> mail=mailDAO.getReceiveMailList(empNo, pageNo);
		List<Object> rmail=new ArrayList<Object>();
		if(mail!=null){
		for(int i=0;i<mail.size();i++){
		EmployeeVO e1= mailDAO.findById(mail.get(i).getMailReceiver());
		EmployeeVO e2= mailDAO.findById(mail.get(i).getMailSender());
		String receiver =e1.getDepartmentVO().getDeptName()+" "+e1.getPositionVO().getPositionName()+" "+e1.getEmpName()+" ("+e1.getEmpNo()+")";
		String sender = e2.getDepartmentVO().getDeptName()+" "+e2.getPositionVO().getPositionName()+" "+e2.getEmpName()+" ("+e2.getEmpNo()+")";
		mail.get(i).setMailReceiver(receiver);
		mail.get(i).setMailSender(sender);
		rmail.add(mail.get(i));
		}
		}
		return rmail;
	}

	@Override
	public int totalSendMailContent(String empNo) {
		return mailDAO.totalSendMailContent(empNo);
	}

	@Override
	public int totalReceiveMailContent(String empNo) {
		return mailDAO.totalReceiveMailContent(empNo);
	}

	@Override
	public MailVO showMailContent(int no, String empNo) {
		mailDAO.checkMail(no, empNo);
	MailVO mvo =	mailDAO.showMailContent(no);
	EmployeeVO e1 = mailDAO.findById(mvo.getMailReceiver());
	EmployeeVO e2 =mailDAO.findById(mvo.getMailSender());
	String receiver=e1.getDepartmentVO().getDeptName()+" "+e1.getPositionVO().getPositionName()+" "+e1.getEmpName()+" ("+e1.getEmpNo()+")";
	String sender = e2.getDepartmentVO().getDeptName()+" "+e2.getPositionVO().getPositionName()+" "+e2.getEmpName()+" ("+e2.getEmpNo()+")";
	mvo.setMailReceiver(receiver);
	mvo.setMailSender(sender);
	return mvo;
	}

	@Override
	public void sDeleteMail(int no) {
		mailDAO.sDeleteMail(no);
	}

	@Override
	public void rDeleteMail(int no) {
		mailDAO.rDeleteMail(no);
	}

	@Override
	public void sendMail(MailVO mailVO) {
		mailDAO.sendMail(mailVO);
	}

	@Override
	public Integer countMail(String empNo) {
		return mailDAO.countMail(empNo);
	}

	@Override
	public List<MailVO> getMyMailList(String empNo) {
		return mailDAO.getMyMailList(empNo);
	}
}
