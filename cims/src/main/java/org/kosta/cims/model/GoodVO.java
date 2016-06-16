package org.kosta.cims.model;

public class GoodVO {
	private int boardNo;
	private String empNo;
	public GoodVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public GoodVO(int boardNo, String empNo) {
		super();
		this.boardNo = boardNo;
		this.empNo = empNo;
	}

	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	@Override
	public String toString() {
		return "GoodVO [boardNo=" + boardNo + ", empNo=" + empNo + "]";
	}
	
	
}
