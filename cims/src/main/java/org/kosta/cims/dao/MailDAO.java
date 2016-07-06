package org.kosta.cims.dao;

import java.util.List;

import org.kosta.cims.model.MailVO;

public interface MailDAO {

	public abstract int totalSendMailContent(String empNo);

	public abstract int totalReceiveMailContent(String empNo);

	public abstract MailVO showMailContent(int no);

	public abstract int checkMail(int no, String empNo);

	public abstract void sDeleteMail(int no);

	public abstract void rDeleteMail(int no);

	public abstract void sendMail(MailVO mailVO);

	public abstract List<Object> getSendMailList(String empNo, int pageNo);

	public abstract List<Object> getReceiveMailList(String empNo, int pageNo);

	public abstract Integer countMail(String empNo);

	public abstract List<MailVO> getMyMailList(String empNo);

}