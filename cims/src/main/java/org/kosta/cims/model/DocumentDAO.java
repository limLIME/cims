package org.kosta.cims.model;

import java.util.List;

public interface DocumentDAO {

	public abstract void write(DocumentVO dvo);
	public abstract DocumentVO showdocument(int no);
	public abstract List<Object> mainList(int page);
	public abstract int getTotalPage();
	public abstract void docReturn(int docNo);
	public abstract void docEnd(int docNo);
	public abstract void docSign(String approver,int docNo,int positionNo,String sign);
	public abstract List<Object> myDocumentList(int page,int empNo);


	//반려----------------
	public abstract List<Object> returnMain(int page, int empNo,String empSign, int positionNo);
	public abstract List<Object> returnList(int page, int empNo, String empSign, int positionNo);
	public abstract List<Object> returnMy(int page,int empNo);
	public abstract List<Object> returnSign(int page,int empNo);
	public abstract int getReturnMainTotalPage(String empSign, int positionNo,int empNo);
	public abstract int getReturnListTotalPage(String empSign, int empNo, int positionNo);
	public abstract int getReturnMyTotalPage(int empNo);
	public abstract int getReturnSignTotalPage(int empNo);
	
	//결제중-------------
	public abstract List<Object> waitingMy(int page,int empNo);
	public abstract List<Object> waitingMain(int page,int empNo,String empSign,int positionNo);
	public abstract List<Object> waiting(int page,int empNo,String empSign,int positionNo);
	public abstract List<Object> waitingMySign(int page, int empNo,String empSign);
	public abstract int getWaitingMyTotalPage(int empNo);
	public abstract int getWaitingMainTotalPage(int empNo,String empSign,int positionNo);
	public abstract int getWaitingTotalPage(String empSign, int positionNo);
	public abstract int getWaitingMySignTotalPage(String empSign, int empNo);
	
	//결제완료-----------
	public abstract List<Object> completeMy(int page,int empNo);
	public abstract List<Object> completeSign(int page,String empSign,int empNo,int positionNo);
	public abstract List<Object> completeMain(int page,int empNo,String empSign,int positionNo);
	public abstract List<Object> complete(int page,int empNo,String empSign,int positionNo);
	public abstract int getCompleteMyTotalPage(int empNo);
	public abstract int getCompleteSignTotalPage(int empNo,String empSign, int positionNo);
	public abstract int getCompleteMainTotalPage(int empNo,String empSign,int positionNo);
	public abstract int getCompleteTotalPage(String empSign, int positionNo);
	
	public abstract int getMainTotalPage();
	public abstract int getMyDocumentListTotalPage(int empNo);


	
	

}