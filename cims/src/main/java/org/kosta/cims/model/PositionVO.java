package org.kosta.cims.model;

public class PositionVO {
   private int positionNo;
   private String positionName;
   public PositionVO() {
      super();
      // TODO Auto-generated constructor stub
   }
   public PositionVO(int positionNo, String positionName) {
      super();
      this.positionNo = positionNo;
      this.positionName = positionName;
   }
   
   public PositionVO(int positionNo) {
	super();
	this.positionNo = positionNo;
}
public int getPositionNo() {
      return positionNo;
   }
   public void setPositionNo(int positionNo) {
      this.positionNo = positionNo;
   }
   public String getPositionName() {
      return positionName;
   }
   public void setPositionName(String positionName) {
      this.positionName = positionName;
   }
   @Override
   public String toString() {
      return "PositionVO [positionNo=" + positionNo + ", positionName="
            + positionName + "]";
   }
   
   
}