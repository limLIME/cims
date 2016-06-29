package org.kosta.cims.model;

import org.springframework.web.multipart.MultipartFile;

public class RecommendVO {
	private int recNo;
	private EmployeeVO employeeVO;
	private String recTitle;
	private String recContent;
	private String recDate;
	private MultipartFile recUploadFile;
	private String recPath;
	private int pageNo;
	public RecommendVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RecommendVO(int recNo, EmployeeVO employeeVO, String recTitle,
			String recContent, String recDate, MultipartFile recUploadFile,
			String recPath) {
		super();
		this.recNo = recNo;
		this.employeeVO = employeeVO;
		this.recTitle = recTitle;
		this.recContent = recContent;
		this.recDate = recDate;
		this.recUploadFile = recUploadFile;
		this.recPath = recPath;
	}
	
	public RecommendVO(String recTitle, int pageNo) {
		super();
		this.recTitle = recTitle;
		this.pageNo = pageNo;
	}
	
	public RecommendVO(String recTitle, String recContent, int pageNo) {
		super();
		this.recTitle = recTitle;
		this.recContent = recContent;
		this.pageNo = pageNo;
	}
	public int getRecNo() {
		return recNo;
	}
	public void setRecNo(int recNo) {
		this.recNo = recNo;
	}
	public EmployeeVO getEmployeeVO() {
		return employeeVO;
	}
	public void setEmployeeVO(EmployeeVO employeeVO) {
		this.employeeVO = employeeVO;
	}
	public String getRecTitle() {
		return recTitle;
	}
	public void setRecTitle(String recTitle) {
		this.recTitle = recTitle;
	}
	public String getRecContent() {
		return recContent;
	}
	public void setRecContent(String recContent) {
		this.recContent = recContent;
	}
	public String getRecDate() {
		return recDate;
	}
	public void setRecDate(String recDate) {
		this.recDate = recDate;
	}
	public MultipartFile getRecUploadFile() {
		return recUploadFile;
	}
	public void setRecUploadFile(MultipartFile recUploadFile) {
		this.recUploadFile = recUploadFile;
	}
	public String getRecPath() {
		return recPath;
	}
	public void setRecPath(String recPath) {
		this.recPath = recPath;
	}
	@Override
	public String toString() {
		return "RecommendVO [recNo=" + recNo + ", employeeVO=" + employeeVO
				+ ", recTitle=" + recTitle + ", recContent=" + recContent
				+ ", recDate=" + recDate + ", recUploadFile=" + recUploadFile
				+ ", recPath=" + recPath + ", pageNo=" + pageNo + "]";
	}
	
	
}
