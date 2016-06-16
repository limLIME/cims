package org.kosta.cims.model;

public class DepartmentVO {
   private int deptNo;
   private String deptName;
   
   public DepartmentVO() {
      super();
   }

   public DepartmentVO(int deptNo, String deptName) {
      super();
      this.deptNo = deptNo;
      this.deptName = deptName;
   }

   public int getDeptNo() {
      return deptNo;
   }

   public void setDeptNo(int deptNo) {
      this.deptNo = deptNo;
   }

   public String getDeptName() {
      return deptName;
   }

   public void setDeptName(String deptName) {
      this.deptName = deptName;
   }

   @Override
   public String toString() {
      return "DepartmentVO [deptNo=" + deptNo + ", deptName=" + deptName
            + "]";
   }
   
}