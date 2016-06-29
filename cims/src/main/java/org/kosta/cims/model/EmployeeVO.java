package org.kosta.cims.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class EmployeeVO {
	private String empNo;
	private String password;
	private String empName;
	private String empTel;
	private String empSign;
	private int empState;
	private String substitute;
	private String empPhoto;
	private DepartmentVO departmentVO;
	private PositionVO positionVO;
	private List<MultipartFile> file;
	public int getEmpState() {
		return empState;
	}

	public void setEmpState(int empState) {
		this.empState = empState;
	}

	public String getSubstitute() {
		return substitute;
	}

	public void setSubstitute(String substitute) {
		this.substitute = substitute;
	}

	public String getEmpPhoto() {
		return empPhoto;
	}

	public void setEmpPhoto(String empPhoto) {
		this.empPhoto = empPhoto;
	}

	private String empPath;

	public EmployeeVO(String empNo, String password, String empName,
			String empTel, String empSign, DepartmentVO departmentVO,
			PositionVO positionVO, List<MultipartFile> file, String empPath) {
		super();
		this.empNo = empNo;
		this.password = password;
		this.empName = empName;
		this.empTel = empTel;
		this.empSign = empSign;
		this.departmentVO = departmentVO;
		this.positionVO = positionVO;
		this.file = file;
		this.empPath = empPath;
	}

	public EmployeeVO() {
		super();
	}

	public EmployeeVO(String empNo, String password, String empName,
			String empTel, String empSign, DepartmentVO departmentVO,
			PositionVO positionVO, List<MultipartFile> file) {
		super();
		this.empNo = empNo;
		this.password = password;
		this.empName = empName;
		this.empTel = empTel;
		this.empSign = empSign;
		this.departmentVO = departmentVO;
		this.positionVO = positionVO;
		this.file = file;
	}

	public String getEmpPath() {
		return empPath;
	}

	public void setEmpPath(String empPath) {
		this.empPath = empPath;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpTel() {
		return empTel;
	}

	public void setEmpTel(String empTel) {
		this.empTel = empTel;
	}

	public String getEmpSign() {
		return empSign;
	}

	public void setEmpSign(String empSign) {
		this.empSign = empSign;
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

	public List<MultipartFile> getFile() {
		return file;
	}

	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "EmployeeVO [empNo=" + empNo + ", password=" + password
				+ ", empName=" + empName + ", empTel=" + empTel + ", empSign="
				+ empSign + ", empState=" + empState + ", substitute="
				+ substitute + ", empPhoto=" + empPhoto + ", departmentVO="
				+ departmentVO + ", positionVO=" + positionVO + ", file="
				+ file + ", empPath=" + empPath + "]";
	}

}