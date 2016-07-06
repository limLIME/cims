package org.kosta.cims.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.dao.MailDAO;
import org.kosta.cims.model.MailVO;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService {
	@Resource
	private MailDAO mailDAO;

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.kosta.cims.model.MailService#getMailList(int)
	 */
	@Override
	public List<Object> getSendMailList(String empNo, int pageNo) {
		return mailDAO.getSendMailList(empNo, pageNo);
	}

	@Override
	public List<Object> getReceiveMailList(String empNo, int pageNo) {
		return mailDAO.getReceiveMailList(empNo, pageNo);
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
		return mailDAO.showMailContent(no);
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
