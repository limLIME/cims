package org.kosta.cims.model;

import org.springframework.web.multipart.MultipartFile;

public class DocumentVO {

	private int docNo;
	private String title;
	private String content;
	private String path;
	private String timePosted;
	private String state;
	private MultipartFile multipartFile;  
	private String returner;
	private String approver;
	private EmployeeVO employeeVO;
	public DocumentVO() {
		super();
	}
	public DocumentVO(int docNo, String title, String content, String path,
			String timePosted, String state, MultipartFile multipartFile,
			String returner, String approver, EmployeeVO employeeVO) {
		super();
		this.docNo = docNo;
		this.title = title;
		this.content = content;
		this.path = path;
		this.timePosted = timePosted;
		this.state = state;
		this.multipartFile = multipartFile;
		this.returner = returner;
		this.approver = approver;
		this.employeeVO = employeeVO;
	}
	public int getDocNo() {
		return docNo;
	}
	public void setDocNo(int docNo) {
		this.docNo = docNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getTimePosted() {
		return timePosted;
	}
	public void setTimePosted(String timePosted) {
		this.timePosted = timePosted;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}
	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}
	public String getReturner() {
		return returner;
	}
	public void setReturner(String returner) {
		this.returner = returner;
	}
	public String getApprover() {
		return approver;
	}
	public void setApprover(String approver) {
		this.approver = approver;
	}
	public EmployeeVO getEmployeeVO() {
		return employeeVO;
	}
	public void setEmployeeVO(EmployeeVO employeeVO) {
		this.employeeVO = employeeVO;
	}
	@Override
	public String toString() {
		return "DocumentVO [docNo=" + docNo + ", title=" + title + ", content="
				+ content + ", path=" + path + ", timePosted=" + timePosted
				+ ", state=" + state + ", multipartFile=" + multipartFile
				+ ", returner=" + returner + ", approver=" + approver
				+ ", employeeVO=" + employeeVO + "]";
	}

	
}