package org.kosta.cims.model;

public class ClubMemberVO {
	private int clubNo;
	private EmployeeVO employeeVO;
	
	
	public ClubMemberVO() {
		super();
	}


	public ClubMemberVO(int clubNo, EmployeeVO employeeVO) {
		super();
		this.clubNo = clubNo;
		this.employeeVO = employeeVO;
	}


	public int getClubNo() {
		return clubNo;
	}


	public void setClubNo(int clubNo) {
		this.clubNo = clubNo;
	}


	public EmployeeVO getEmployeeVO() {
		return employeeVO;
	}


	public void setEmployeeVO(EmployeeVO employeeVO) {
		this.employeeVO = employeeVO;
	}


	@Override
	public String toString() {
		return "ClubMemberVO [clubNo=" + clubNo + ", employeeVO=" + employeeVO
				+ "]";
	}
	
	
}
