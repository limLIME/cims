package org.kosta.cims.model;

public class ApproverVO {
	private String sign;
	private DocumentVO documentVO;
	private EmployeeVO employeeVO;
	private PositionVO positionVO;
	public ApproverVO() {
		super();
	}
	public ApproverVO(String sign, DocumentVO documentVO,
			EmployeeVO employeeVO, PositionVO positionVO) {
		super();
		this.sign = sign;
		this.documentVO = documentVO;
		this.employeeVO = employeeVO;
		this.positionVO = positionVO;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public DocumentVO getDocumentVO() {
		return documentVO;
	}
	public void setDocumentVO(DocumentVO documentVO) {
		this.documentVO = documentVO;
	}
	public EmployeeVO getEmployeeVO() {
		return employeeVO;
	}
	public void setEmployeeVO(EmployeeVO employeeVO) {
		this.employeeVO = employeeVO;
	}
	public PositionVO getPositionVO() {
		return positionVO;
	}
	public void setPositionVO(PositionVO positionVO) {
		this.positionVO = positionVO;
	}
	@Override
	public String toString() {
		return "ApproverVO [sign=" + sign + ", documentVO=" + documentVO
				+ ", employeeVO=" + employeeVO + ", positionVO=" + positionVO
				+ "]";
	}
	
	
}
