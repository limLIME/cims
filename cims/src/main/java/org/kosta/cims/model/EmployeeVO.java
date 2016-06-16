package org.kosta.cims.model;

import org.springframework.web.multipart.MultipartFile;

public class EmployeeVO {
   private String empNo;
   private String password;
   private String empName;
   private String empTel;
   private String empSign;
   private DepartmentVO departmentVO;
   private PositionVO positionVO;
   private MultipartFile multipartFile;  
   public EmployeeVO() {
      super();
   }
public EmployeeVO(String empNo, String password, String empName, String empTel,
		String empSign, DepartmentVO departmentVO, PositionVO positionVO,
		MultipartFile multipartFile) {
	super();
	this.empNo = empNo;
	this.password = password;
	this.empName = empName;
	this.empTel = empTel;
	this.empSign = empSign;
	this.departmentVO = departmentVO;
	this.positionVO = positionVO;
	this.multipartFile = multipartFile;
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
public MultipartFile getMultipartFile() {
	return multipartFile;
}
public void setMultipartFile(MultipartFile multipartFile) {
	this.multipartFile = multipartFile;
}
@Override
public String toString() {
	return "EmployeeVO [empNo=" + empNo + ", password=" + password
			+ ", empName=" + empName + ", empTel=" + empTel + ", empSign="
			+ empSign + ", departmentVO=" + departmentVO + ", positionVO="
			+ positionVO + ", multipartFile=" + multipartFile + "]";
}





   
}