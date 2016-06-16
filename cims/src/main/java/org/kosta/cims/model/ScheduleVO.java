package org.kosta.cims.model;

public class ScheduleVO {
	private int schNo;
	private String empNo;
	private String schContent;
	private String schDay;
	private String day;

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public ScheduleVO() {
		super();
	}

	public ScheduleVO(int schNo, String empNo, String schContent, String schDay,String day) {
		super();
		this.schNo = schNo;
		this.empNo = empNo;
		this.schContent = schContent;
		this.schDay = schDay;
		this.day=day;
	}

	public int getSchNo() {
		return schNo;
	}

	public void setSchNo(int schNo) {
		this.schNo = schNo;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getSchContent() {
		return schContent;
	}

	public void setSchContent(String schContent) {
		this.schContent = schContent;
	}

	public String getSchDay() {
		return schDay;
	}

	public void setSchDay(String schDay) {
		this.schDay = schDay;
	}

	@Override
	public String toString() {
		return "ScheduleVO [schNo=" + schNo + ", empNo=" + empNo
				+ ", schContent=" + schContent + ", schDay=" + schDay
				+ ", day=" + day + "]";
	}

}
