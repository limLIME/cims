package org.kosta.cims.model;

import java.util.List;

public interface MailDAO {


	public abstract int totalSendMailContent(String empNo);
	public abstract int totalReceiveMailContent(String empNo);
	public abstract MailVO showMailContent(int no);
	public abstract void deleteMail(int no);
	public abstract void sendMail(MailVO mailVO);
	public abstract List<Object> getSendMailList(String empNo,int pageNo);
	public abstract List<Object> getReceiveMailList(String empNo,int pageNo);

}