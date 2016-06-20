package org.kosta.cims.model;

import org.springframework.web.multipart.MultipartFile;

public class MailVO {
	private int mailNo;
	private String mailTitle;
	private String mailContent;
	private String mailDate;
	private String mailSender;
	private String mailReceiver;
	private EmployeeVO employeeVO;
	private MultipartFile filePath;
	private String mailPath;
	private int mailConfirm;
	private int mailState;
	private int pageNo;

	public MailVO() {
		super();
	}

	public MailVO(int mailNo, String mailTitle, String mailContent,
			String mailDate, String mailSender, String mailReceiver,
			EmployeeVO employeeVO, MultipartFile filePath, String mailPath,
			int mailConfirm, int mailState, int pageNo) {
		super();
		this.mailNo = mailNo;
		this.mailTitle = mailTitle;
		this.mailContent = mailContent;
		this.mailDate = mailDate;
		this.mailSender = mailSender;
		this.mailReceiver = mailReceiver;
		this.employeeVO = employeeVO;
		this.filePath = filePath;
		this.mailPath = mailPath;
		this.mailConfirm = mailConfirm;
		this.mailState = mailState;
		this.pageNo = pageNo;
	}

	public int getMailNo() {
		return mailNo;
	}

	public void setMailNo(int mailNo) {
		this.mailNo = mailNo;
	}

	public String getMailTitle() {
		return mailTitle;
	}

	public void setMailTitle(String mailTitle) {
		this.mailTitle = mailTitle;
	}

	public String getMailContent() {
		return mailContent;
	}

	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}

	public String getMailDate() {
		return mailDate;
	}

	public void setMailDate(String mailDate) {
		this.mailDate = mailDate;
	}

	public String getMailSender() {
		return mailSender;
	}

	public void setMailSender(String mailSender) {
		this.mailSender = mailSender;
	}

	public String getMailReceiver() {
		return mailReceiver;
	}

	public void setMailReceiver(String mailReceiver) {
		this.mailReceiver = mailReceiver;
	}

	public EmployeeVO getEmployeeVO() {
		return employeeVO;
	}

	public void setEmployeeVO(EmployeeVO employeeVO) {
		this.employeeVO = employeeVO;
	}

	public MultipartFile getFilePath() {
		return filePath;
	}

	public void setFilePath(MultipartFile filePath) {
		this.filePath = filePath;
	}

	public String getMailPath() {
		return mailPath;
	}

	public void setMailPath(String mailPath) {
		this.mailPath = mailPath;
	}

	public int getmailConfirm() {
		return mailConfirm;
	}

	public void setmailConfirm(int mailConfirm) {
		this.mailConfirm = mailConfirm;
	}

	public int getmailState() {
		return mailState;
	}

	public void setmailState(int mailState) {
		this.mailState = mailState;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	@Override
	public String toString() {
		return "MailVO [mailNo=" + mailNo + ", mailTitle=" + mailTitle
				+ ", mailContent=" + mailContent + ", mailDate=" + mailDate
				+ ", mailSender=" + mailSender + ", mailReceiver="
				+ mailReceiver + ", employeeVO=" + employeeVO + ", filePath="
				+ filePath + ", mailPath=" + mailPath + ", mailConfirm=" + mailConfirm
				+ ", mailState=" + mailState + ", pageNo=" + pageNo + "]";
	}

}