package org.kosta.cims.model;

public class CommentVO {
	private int commentNo;
	private int boardNo;
	private EmployeeVO employeeVO;
	private String commentContent;
	private String commentDate;
	public CommentVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentVO(int commentNo, int boardNo, EmployeeVO employeeVO,
			String commentContent, String commentDate) {
		super();
		this.commentNo = commentNo;
		this.boardNo = boardNo;
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
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
		return "CommentVO [commentNo=" + commentNo + ", boardNo=" + boardNo
				+ ", employeeVO=" + employeeVO + ", commentContent="
				+ commentContent + ", commentDate=" + commentDate + "]";
	}

}
