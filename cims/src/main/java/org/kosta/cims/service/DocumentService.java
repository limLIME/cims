package org.kosta.cims.service;

import org.kosta.cims.model.DocumentVO;
import org.kosta.cims.model.ListVO;

public interface DocumentService {

	public abstract void write(DocumentVO dvo);
	public abstract DocumentVO showdocument(int no);
	public abstract ListVO mainList(int page);
	public abstract void docReturn(int docNo);
	public abstract void docEnd(int docNo);
	public abstract void docSign(String approver,int docNo,int positionNo,String sign);
	public abstract ListVO myDocumentList(int page,int empNo);

	//반려
	   public abstract ListVO returnMain(int page, int empNo, String empSign, int positionNo);
	   public abstract ListVO returnList(int page, int empNo, String empSign, int positionNo);
	   public abstract ListVO returnSign(int page,int empNo);
	   public abstract ListVO returnMy(int page,int empNo);
	
	//결재중
	public abstract ListVO waiting(int page,int empNo,String empSign,int positionNo);
	public abstract ListVO waitingMy(int page,int empNo);
	public abstract ListVO waitingMain(int page,int empNo,String empSign,int positionNo);
	public abstract ListVO waitingMySign(int page, int empNo, String empSign);
	//결재완료
	public abstract ListVO complete(int page,int empNo,String empSign,int positionNo);
	public abstract ListVO completeSign(int page,String empSign,int empNo,int positionNo);
	public abstract ListVO completeMy(int page,int empNo);
	public abstract ListVO completeMain(int page,int empNo,String empSign,int positionNo);
	
	
}