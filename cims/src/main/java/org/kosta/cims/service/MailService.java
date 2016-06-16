package org.kosta.cims.service;

import java.util.List;

import org.kosta.cims.model.MailVO;

public interface MailService {


	public abstract MailVO showMailContent(int no);
	public abstract void deleteMail(int no);
	public abstract void sendMail(MailVO mailVO);
	
	public abstract int totalReceiveMailContent(String empNo);
	public abstract int totalSendMailContent(String empNo);
	
	public abstract List<Object> getSendMailList(String empNo,int pageNo);
	public abstract List<Object> getReceiveMailList(String empNo,int pageNo);

}