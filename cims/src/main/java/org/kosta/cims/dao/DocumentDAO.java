package org.kosta.cims.dao;

import java.util.List;

import org.kosta.cims.model.DocumentVO;
import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.PagingBean;

public interface DocumentDAO {

	public abstract void write(DocumentVO dvo,String app1,String app2,String app3,String app4);
	public abstract DocumentVO showdocument(int docNo);
	public List<String> findEmpNo(int docNo);
	public List<String> findPosition(int docNo);
	public List<String> findSign(int docNo,List<String> empNoList);

	// 공문 상태관련-------------------------------------------
	public abstract void docReturn(int docNo,EmployeeVO evo);
	public abstract void docSign(int docNo,String empNo,String empSign);
	public abstract void substituteSign(int docNo,String empNo,String empSign);

	//내가쓴글
	public abstract List<Object> myDocument(int page,String empNo);
	public abstract int getMyTotalPage(String empNo);
	public abstract List<Object> myDocumentSearch(int page,String empNo,String data);
	public abstract int getMyDocumentSearchTotalPage(String empNo,String data);

	//반려----------------
	public abstract List<Object> returnMain(int page, String empNo,String empSign);
	public abstract int getReturnMainTotalPage(String empNo,String empSign);
	
	public abstract List<Object> returnMainSearch(int page,String empNo,String empSign,String data);
	public abstract int getReturnMainSearchTotalPage(String empNo,String empSign,String data);
	
	
	//결제중-------------
	
	public abstract List<Object> waitingMySign(int page, String empNo,int positionNo);
	public abstract int getWaitingMySignTotalPage(String empNo,int positionNo);
	public abstract List<Object> waitingMySignSearch(int page,String empNo, int positionNo,String data);
	public abstract int getWaitingMySignSearchTotalPage(String empNo, int positionNo,String data);
	
	
	public abstract List<Object> waitingSubstitute(String empNo,int positionNo);
	public abstract List<Object> waitingSubstituteSearch(String empNo,int positionNo,String data);
	
	//결제완료-----------
	public abstract List<Object> completeMain(int page,String empNo,String empSign,int positionNo);
	public abstract int getCompleteMainTotalPage(String empNo,String empSign,int positionNo);

	public abstract List<Object> completeMainSearch(int page, String empNo, String empSign,int positionNo,String data);
	public abstract int getCompleteMainSearchTotalPage(String empNo, String empSign,int positionNo,String data);

	//메인 페이지 갯수
	public abstract Integer countDoc(EmployeeVO vo);
}