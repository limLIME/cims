package org.kosta.cims.model;

public class RecCommentVO {
	private int commentNo;
	private int recNo;
	private EmployeeVO employeeVO;
	private String commentContent;
	private String commentDate;
	public RecCommentVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RecCommentVO(int commentNo, int recNo, EmployeeVO employeeVO,
			String commentContent, String commentDate) {
		super();
		this.commentNo = commentNo;
		this.recNo = recNo;
		this.employeeVO = employeeVO;
		this.commentContent = commentContent;
		this.commentDate = commentDate;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
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
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	@Override
	public String toString() {
		return "RecCommentVO [commentNo=" + commentNo + ", rec_no=" + recNo
				+ ", employeeVO=" + employeeVO + ", commentContent="
				+ commentContent + ", commentDate=" + commentDate + "]";
	}
	
	
}
