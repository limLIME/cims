package org.kosta.cims.model;

import org.springframework.web.multipart.MultipartFile;

public class DocumentVO {

	private int docNo;
	private String title;
	private String content;
	private String path;
	private String state;
	private String timePosted;
	private MultipartFile multipartFile;  
	private String approver;	
	private String sign1;
	private String sign2;
	private String sign3;
	private EmployeeVO employeeVO;
	public DocumentVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public DocumentVO(int docNo, String title, String content, String path,
			String state, String timePosted, MultipartFile multipartFile,
			String approver, String sign1, String sign2, String sign3,
			EmployeeVO employeeVO) {
		super();
		this.docNo = docNo;
		this.title = title;
		this.content = content;
		this.path = path;
		this.state = state;
		this.timePosted = timePosted;
		this.multipartFile = multipartFile;
		this.approver = approver;
		this.sign1 = sign1;
		this.sign2 = sign2;
		this.sign3 = sign3;
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
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getTimePosted() {
		return timePosted;
	}
	public void setTimePosted(String timePosted) {
		this.timePosted = timePosted;
	}
	public String getApprover() {
		return approver;
	}
	public void setApprover(String approver) {
		this.approver = approver;
	}
	public String getSign1() {
		return sign1;
	}
	public void setSign1(String sign1) {
		this.sign1 = sign1;
	}
	public String getSign2() {
		return sign2;
	}
	public void setSign2(String sign2) {
		this.sign2 = sign2;
	}
	public String getSign3() {
		return sign3;
	}
	public void setSign3(String sign3) {
		this.sign3 = sign3;
	}
	public EmployeeVO getEmployeeVO() {
		return employeeVO;
	}
	public void setEmployeeVO(EmployeeVO employeeVO) {
		this.employeeVO = employeeVO;
	}
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}
	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}

	@Override
	public String toString() {
		return "DocumentVO [docNo=" + docNo + ", title=" + title + ", content="
				+ content + ", path=" + path + ", state=" + state
				+ ", timePosted=" + timePosted + ", multipartFile="
				+ multipartFile + ", approver=" + approver + ", sign1=" + sign1
				+ ", sign2=" + sign2 + ", sign3=" + sign3 + ", employeeVO="
				+ employeeVO + "]";
	}
	
	
}

