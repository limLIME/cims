package org.kosta.cims.model;

public class ClubVO {
	private int clubNo;
	private String clubName;
	private String clubContent;
	private int clubConfirm;
	private EmployeeVO employeeVO;
	public ClubVO() {
		super();
	}
	public ClubVO(int clubNo, String clubName, String clubContent,
			int clubConfirm, EmployeeVO employeeVO) {
		super();
		this.clubNo = clubNo;
		this.clubName = clubName;
		this.clubContent = clubContent;
		this.clubConfirm = clubConfirm;
		this.employeeVO = employeeVO;
	}
	public int getClubNo() {
		return clubNo;
	}
	public void setClubNo(int clubNo) {
		this.clubNo = clubNo;
	}
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public String getClubContent() {
		return clubContent;
	}
	public void setClubContent(String clubContent) {
		this.clubContent = clubContent;
	}
	public int getClubConfirm() {
		return clubConfirm;
	}
	public void setClubConfirm(int clubConfirm) {
		this.clubConfirm = clubConfirm;
	}
	public EmployeeVO getEmployeeVO() {
		return employeeVO;
	}
	public void setEmployeeVO(EmployeeVO employeeVO) {
		this.employeeVO = employeeVO;
	}
	@Override
	public String toString() {
		return "ClubVO [clubNo=" + clubNo + ", clubName=" + clubName
				+ ", clubContent=" + clubContent + ", clubConfirm="
				+ clubConfirm + ", employeeVO=" + employeeVO + "]";
	}
	
	
}
