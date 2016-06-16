package org.kosta.cims.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.model.MailDAO;
import org.kosta.cims.model.MailVO;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService {
	@Resource
	private MailDAO mailDAO;
	
	
	/* (non-Javadoc)
	 * @see org.kosta.cims.model.MailService#getMailList(int)
	 */
	@Override
	public List<Object> getSendMailList(String empNo,int pageNo){
		return mailDAO.getSendMailList(empNo,pageNo);
	}
	@Override
	public List<Object> getReceiveMailList(String empNo,int pageNo){
		return mailDAO.getReceiveMailList(empNo,pageNo);
	}
	
	@Override
	public int totalSendMailContent(String empNo){
		return mailDAO.totalSendMailContent(empNo);
	}@Override
	public int totalReceiveMailContent(String empNo){
		return mailDAO.totalReceiveMailContent(empNo);
	}
	
	@Override
	public MailVO showMailContent(int no){
		return mailDAO.showMailContent(no);
	}
	
	@Override
	public void deleteMail(int no){
		mailDAO.deleteMail(no);
	}
	
	@Override
	public void sendMail(MailVO mailVO){
		mailDAO.sendMail(mailVO);
	}
}