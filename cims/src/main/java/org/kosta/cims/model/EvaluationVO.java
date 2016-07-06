package org.kosta.cims.model;

public class EvaluationVO {
	private int evaluationNo;
	private String evaluationTitle;
	private String evaluationContent;
	private String evaluationDate;
	private EmployeeVO employeeVO;
	private DepartmentVO departmentVO;
	private PositionVO positionVO;
	private int pageNo;
	
	public EvaluationVO() {
		super();
	}

	
	public EvaluationVO(DepartmentVO departmentVO, int pageNo) {
		super();
		this.departmentVO = departmentVO;
		this.pageNo = pageNo;
	}


	public EvaluationVO(EmployeeVO employeeVO, DepartmentVO departmentVO) {
		super();
		this.employeeVO = employeeVO;
		this.departmentVO = departmentVO;
	}


	public EvaluationVO(int evaluationNo, String evaluationTitle,
			String evaluationContent, String evaluationDate,
			EmployeeVO employeeVO, DepartmentVO departmentVO,
			PositionVO positionVO, int pageNo) {
		super();
		this.evaluationNo = evaluationNo;
		this.evaluationTitle = evaluationTitle;
		this.evaluationContent = evaluationContent;
		this.evaluationDate = evaluationDate;
		this.employeeVO = employeeVO;
		this.departmentVO = departmentVO;
		this.positionVO = positionVO;
		this.pageNo = pageNo;
	}

	public EvaluationVO(String evaluationTitle, int pageNo) {
		super();
		this.evaluationTitle = evaluationTitle;
		this.pageNo = pageNo;
	}

	public EvaluationVO(String evaluationTitle, String evaluationContent, int pageNo) {
		super();
		this.evaluationTitle = evaluationTitle;
		this.evaluationContent = evaluationContent;
		this.pageNo = pageNo;
	}


	public int getEvaluationNo() {
		return evaluationNo;
	}

	public void setEvaluationNo(int evaluationNo) {
		this.evaluationNo = evaluationNo;
	}

	public String getEvaluationTitle() {
		return evaluationTitle;
	}

	public void setEvaluationTitle(String evaluationTitle) {
		this.evaluationTitle = evaluationTitle;
	}

	public String getEvaluationContent() {
		return evaluationContent;
	}

	public void setEvaluationContent(String evaluationContent) {
		this.evaluationContent = evaluationContent;
	}

	public String getEvaluationDate() {
		return evaluationDate;
	}

	public void setEvaluationDate(String evaluationDate) {
		this.evaluationDate = evaluationDate;
	}

	public EmployeeVO getEmployeeVO() {
		return employeeVO;
	}

	public void setEmployeeVO(EmployeeVO employeeVO) {
		this.employeeVO = employeeVO;
	}

	public DepartmentVO getDepartmentVO() {
		return departmentVO;
	}

	public void setDepartmentVO(DepartmentVO departmentVO) {
		this.departmentVO = departmentVO;
	}

	public PositionVO getPositionVO() {
		return positionVO;
	}

	public void setPositionVO(PositionVO positionVO) {
		this.positionVO = positionVO;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	@Override
	public String toString() {
		return "EvaluationVO [evaluationNo=" + evaluationNo
				+ ", evaluationTitle=" + evaluationTitle
				+ ", evaluationContent=" + evaluationContent
				+ ", evaluationDate=" + evaluationDate + ", employeeVO="
				+ employeeVO + ", departmentVO=" + departmentVO
				+ ", positionVO=" + positionVO + ", pageNo=" + pageNo + "]";
	}

}