package org.kosta.cims.service;

import java.util.List;

import org.kosta.cims.model.DocumentVO;
import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.ListVO;

public interface DocumentService {

	public abstract void write(DocumentVO dvo,String app1,String app2,String app3,String app4);
	public abstract DocumentVO showdocument(int docNo);
	public abstract List<String> findEmpNo(int docNo);
	public abstract List<String> findPosition(int docNo);
	public abstract List<String> findSign(int docNo,List<String> empNoList);
	public abstract void docReturn(int docNo,EmployeeVO evo);
	public abstract void docSign(int docNo,String empNo,String empSign);


	//반려-----------------------------------------------------------------------------------
	   public abstract ListVO returnMain(int page, String empNo, String empSign);
	   public abstract ListVO returnList(int page, String empNo, String empSign);
	   public abstract ListVO returnSign(int page,String empNo,String empSign);
	   public abstract ListVO returnMy(int page,String empNo);
	
	//결재중-----------------------------------------------------------------------------------
	public abstract ListVO  waiting(int page,String empNo,String empSign);
	public abstract ListVO waitingMy(int page,String empNo);
	public abstract ListVO waitingMain(int page,String empNo,String empSign,int positionNo);
	public abstract ListVO waitingMySign(int page, String empNo,int positionNo);
	public abstract ListVO waitingSubstitute(int page, String empNo,int positionNo);

	//결재완료-----------------------------------------------------------------------------------
	public abstract ListVO complete(int page,int positionNo);
	public abstract ListVO completeSign(int page,String empNo,String empSign,int positionNo);
	public abstract ListVO completeMy(int page,String empNo);
	public abstract ListVO completeMain(int page,String empNo,String empSign,int positionNo);
	
	//반려 검색-----------------------------------------------------------------------------------
	public abstract ListVO returnMainSearch(int page,String empNo,String empSign,String data);
	public abstract ListVO returnMySearch(int page,String empNo,String data);
	public abstract ListVO returnSignSearch(int page,String empNo,String empSign,String data);
	public abstract ListVO returnListSearch(int page,String empNo,String data);
	
	//완료 검색-----------------------------------------------------------------------------------
	public abstract ListVO completeSearch(int page,String empNo,int positionNo,String data);
	public abstract ListVO completeMainSearch(int page, String empNo, String empSign, int positionNo, String data);
	public abstract ListVO completeSignSearch(int page,String empSign,String empNo,int positionNo , String data);
	public abstract ListVO completeMySearch(int page,String empNo,String data);
	
	//결재중 검색-----------------------------------------------------------------------------------
	public abstract ListVO waitingListSearch(int page,String empNo,String empSign,String data);
	public abstract ListVO waitingMySearch(int page,String empNo,String data);
	public abstract ListVO waitingMainSearch(int page, String empNo, String empSign, int positionNo,String data);
	public abstract ListVO waitingMySignSearch(int page, String empNo, int positionNo,String data);
	
	//메인 페이지 갯수
	public abstract Integer countDoc(EmployeeVO vo);
}