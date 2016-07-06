package org.kosta.cims.model;

public class ClubApplicantVO {
	private int clubBoardNo;
	private EmployeeVO employeeVO;
	public ClubApplicantVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ClubApplicantVO(int clubBoardNo, EmployeeVO employeeVO) {
		super();
		this.clubBoardNo = clubBoardNo;
		this.employeeVO = employeeVO;
	}
	public int getClubBoardNo() {
		return clubBoardNo;
	}
	public void setClubBoardNo(int clubBoardNo) {
		this.clubBoardNo = clubBoardNo;
	}
	public EmployeeVO getEmployeeVO() {
		return employeeVO;
	}
	public void setEmployeeVO(EmployeeVO employeeVO) {
		this.employeeVO = employeeVO;
	}
	@Override
	public String toString() {
		return "ClubApplicantVO [clubBoardNo=" + clubBoardNo + ", employeeVO="
				+ employeeVO + "]";
	}
	
	
}
