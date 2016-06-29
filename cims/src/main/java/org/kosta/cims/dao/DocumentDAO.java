package org.kosta.cims.dao;

import java.util.List;

import org.kosta.cims.model.DocumentVO;
import org.kosta.cims.model.EmployeeVO;

public interface DocumentDAO {

	public abstract void write(DocumentVO dvo,String app1,String app2,String app3,String app4);
	public abstract DocumentVO showdocument(int docNo);
	public List<String> findEmpNo(int docNo);
	public List<String> findPosition(int docNo);
	public List<String> findSign(int docNo,List<String> empNoList);

	// 공문 상태관련-------------------------------------------
	public abstract void docReturn(int docNo,EmployeeVO evo);
	public abstract void docSign(int docNo,String empNo,String empSign);



	//반려----------------
	public abstract List<Object> returnMain(int page, String empNo,String empSign);
	public abstract List<Object> returnList(int page, String empNo, String empSign);
	public abstract List<Object> returnMy(int page,String empNo);
	public abstract List<Object> returnSign(int page,String empNo,String empSign);
	public abstract int getReturnMainTotalPage(String empNo,String empSign);
	public abstract int getReturnListTotalPage( String empNo,String empSign);
	public abstract int getReturnMyTotalPage(String empNo);
	public abstract int getReturnSignTotalPage(String empNo,String empSign);
	
	//결제중-------------
	public abstract List<Object> waitingMy(int page,String empNo);
	public abstract List<Object> waitingMain(int page,String empNo,String empSign,int positionNo);
	public abstract List<Object> waiting(int page,String empNo,String empSign);
	public abstract List<Object> waitingMySign(int page, String empNo,int positionNo);
	
	public abstract int getWaitingMyTotalPage(String empNo);
	public abstract int getWaitingMainTotalPage(String empNo,String empSign,int positionNo);
	public abstract int getWaitingTotalPage(String empNo,String empSign);
	public abstract int getWaitingMySignTotalPage(String empNo,int positionNo);
	
	//결제완료-----------
	public abstract List<Object> completeMy(int page,String empNo);
	public abstract List<Object> completeSign(int page,String empNo,String empSign,int positionNo);
	public abstract List<Object> completeMain(int page,String empNo,String empSign,int positionNo);
	public abstract List<Object> complete(int page,int positionNo);
	public abstract int getCompleteMyTotalPage(String empNo);
	public abstract int getCompleteSignTotalPage(String empNo,String empSign, int positionNo);
	public abstract int getCompleteMainTotalPage(String empNo,String empSign,int positionNo);
	public abstract int getCompleteTotalPage(int positionNo);
	



	//반려 검색---------
	public abstract List<Object> returnMainSearch(int page,String empNo,String empSign,String data);
	public abstract List<Object> returnMySearch(int page,String empNo,String data);
	public abstract List<Object> returnSignSearch(int page,String empNo,String empSign,String data);
	public abstract List<Object> returnListSearch(int page,String empNo,String data);
	public abstract int getReturnMainSearchTotalPage(String empNo,String empSign,String data);
	public abstract int getReturnMySearchTotalPage(String empNo,String data);
	public abstract int getReturnSignSearchTotalPage(String empNo,String empSign,String data);
	public abstract int getReturnListSearchTotalPage(String empNo,String data);

	//완료 검색--------
	public abstract List<Object> completeSearch(int page,String empNo,int positionNo,String data);
	public abstract List<Object> completeMainSearch(int page, String empNo, String empSign,int positionNo,String data);
	public abstract List<Object> completeSignSearch(int page,String empSign,String empNo,int positionNo,String data);
	public abstract List<Object> completeMySearch(int page,String empNo,String data);
	public abstract int getCompleteSearchTotalPage(String empNo,int positionNo,String data);
	public abstract int getCompleteMainSearchTotalPage(String empNo, String empSign,int positionNo,String data);
	public abstract int getCompleteSignSearchTotalPage(String empNo,String empSign, int positionNo,String data);
	public abstract int getCompleteMySearchTotalPage(String empNo,String data);
	
	//결재중 검색-----------
	public abstract List<Object> waitingListSearch(int page,String empNo,String empSign,String data);
	public abstract List<Object> waitingMySearch(int page,String empNo,String data);
	public abstract List<Object> waitingMainSearch(int page, String empNo, String empSign, int positionNo,String data);
	public abstract List<Object> waitingMySignSearch(int page, String empNo, int positionNo,String data);
	public abstract int getWaitingListSearchTotalPage(String empNo,String empSign,String data);
	public abstract int getWaitingMySearchTotalPage(String empNo,String data);
	public abstract int getWaitingMainSearchTotalPage(String empNo, String empSign, int positionNo,String data);
	public abstract int getWaitingMySignSearchTotalPage(String empNo, int positionNo,String data);
}