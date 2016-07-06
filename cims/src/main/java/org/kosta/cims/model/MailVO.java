package org.kosta.cims.model;

import org.springframework.web.multipart.MultipartFile;

public class MailVO {
	private int mailNo;
	private String mailTitle;
	private String mailContent;
	private String mailDate;
	private String mailSender;
	private String mailReceiver;
	private MultipartFile filePath;
	private String mailPath;
	private int mailConfirm;
	private int mailSdelete;
	private int mailRdelete;
	private int pageNo;
	public MailVO(int mailNo, String mailTitle, String mailContent,
			String mailDate, String mailSender, String mailReceiver,
			MultipartFile filePath, String mailPath, int mailConfirm,
			int mailSdelete, int mailRdelete, int pageNo) {
		super();
		this.mailNo = mailNo;
		this.mailTitle = mailTitle;
		this.mailContent = mailContent;
		this.mailDate = mailDate;
		this.mailSender = mailSender;
		this.mailReceiver = mailReceiver;
		this.filePath = filePath;
		this.mailPath = mailPath;
		this.mailConfirm = mailConfirm;
		this.mailSdelete = mailSdelete;
		this.mailRdelete = mailRdelete;
		this.pageNo = pageNo;
	}
	public MailVO() {
		super();
		// TODO Auto-generated constructor stub
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
	public int getMailConfirm() {
		return mailConfirm;
	}
	public void setMailConfirm(int mailConfirm) {
		this.mailConfirm = mailConfirm;
	}
	public int getMailSdelete() {
		return mailSdelete;
	}
	public void setMailSdelete(int mailSdelete) {
		this.mailSdelete = mailSdelete;
	}
	public int getMailRdelete() {
		return mailRdelete;
	}
	public void setMailRdelete(int mailRdelete) {
		this.mailRdelete = mailRdelete;
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
				+ mailReceiver + ", filePath=" + filePath + ", mailPath="
				+ mailPath + ", mailConfirm=" + mailConfirm + ", mailSdelete="
				+ mailSdelete + ", mailRdelete=" + mailRdelete + ", pageNo="
				+ pageNo + "]";
	}


}