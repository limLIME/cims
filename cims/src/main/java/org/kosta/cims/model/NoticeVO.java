package org.kosta.cims.model;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeDate;
	private EmployeeVO employeeVO;
	private MultipartFile filePath;
	private String noticePath;
	private int pageNo;
	
	public NoticeVO() {
		super();
	}

	public NoticeVO(int noticeNo, String noticeTitle, String noticeContent,
			String noticeDate, EmployeeVO employeeVO, MultipartFile filePath,
			String noticePath, int pageNo) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.employeeVO = employeeVO;
		this.filePath = filePath;
		this.noticePath = noticePath;
		this.pageNo = pageNo;
	}



	public NoticeVO(String noticeTitle, int pageNo) {
		super();
		this.noticeTitle = noticeTitle;
		this.pageNo = pageNo;
	}

	public NoticeVO(String noticeTitle, String noticeContent, int pageNo) {
		super();
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.pageNo = pageNo;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
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

	public String getNoticePath() {
		return noticePath;
	}

	public void setNoticePath(String noticePath) {
		this.noticePath = noticePath;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", noticeTitle="
				+ noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeDate=" + noticeDate + ", employeeVO=" + employeeVO
				+ ", filePath=" + filePath + ", noticePath=" + noticePath
				+ ", pageNo=" + pageNo + "]";
	}
}
