package org.kosta.cims.model;

public class EmployeeVO {
	private String emp_no;
	private int dept_no;
	private int position_no;
	private String password;
	private String emp_name;
	private String emp_tel;
	private String emp_sign;

	public EmployeeVO() {
		super();
	}

	public EmployeeVO(String emp_no, int dept_no, int position_no,
			String password, String emp_name, String emp_tel, String emp_sign) {
		super();
		this.emp_no = emp_no;
		this.dept_no = dept_no;
		this.position_no = position_no;
		this.password = password;
		this.emp_name = emp_name;
		this.emp_tel = emp_tel;
		this.emp_sign = emp_sign;
	}

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}

	public int getDept_no() {
		return dept_no;
	}

	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}

	public int getPosition_no() {
		return position_no;
	}

	public void setPosition_no(int position_no) {
		this.position_no = position_no;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getEmp_tel() {
		return emp_tel;
	}

	public void setEmp_tel(String emp_tel) {
		this.emp_tel = emp_tel;
	}

	public String getEmp_sign() {
		return emp_sign;
	}

	public void setEmp_sign(String emp_sign) {
		this.emp_sign = emp_sign;
	}

	@Override
	public String toString() {
		return "EmployeeVO [emp_no=" + emp_no + ", dept_no=" + dept_no
				+ ", position_no=" + position_no + ", password=" + password
				+ ", emp_name=" + emp_name + ", emp_tel=" + emp_tel
				+ ", emp_sign=" + emp_sign + "]";
	}
	
}
