package org.kosta.cims.service;

import java.util.List;

import org.kosta.cims.model.DocumentVO;
import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.ListVO;

public interface DocumentService {

	public abstract void write(DocumentVO dvo, String app1, String app2,String app3, String app4);

	public abstract DocumentVO showdocument(int docNo);

	public abstract List<String> findEmpNo(int docNo);

	public abstract List<String> findPosition(int docNo);

	public abstract List<String> findSign(int docNo, List<String> empNoList);

	public abstract void docReturn(int docNo, EmployeeVO evo);

	public abstract void docSign(int docNo, String empNo, String empSign);

	public abstract void substituteSign(int docNo, String empNo, String empSign);

	// 내가쓴공문
	public abstract ListVO myDocument(int page, String empNo);

	public abstract ListVO myDocumentSearch(int page, String empNo, String data);

	// 반려-----------------------------------------------------------------------------------
	public abstract ListVO returnMain(int page, String empNo, String empSign);

	public abstract ListVO returnMainSearch(int page, String empNo,
			String empSign, String data);

	// 결재중-----------------------------------------------------------------------------------

	public abstract ListVO waitingMySign(int page, String empNo, int positionNo);

	public abstract ListVO waitingMySignSearch(int page, String empNo,
			int positionNo, String data);

	public abstract List<Object> waitingSubstitute(String empNo, int positionNo);

	public abstract List<Object> waitingSubstituteSearch(String empNo,
			int positionNo, String data);

	// 결재완료-----------------------------------------------------------------------------------
	public abstract ListVO completeMain(int page, String empNo, String empSign,
			int positionNo);

	public abstract ListVO completeMainSearch(int page, String empNo,
			String empSign, int positionNo, String data);

	// 메인 페이지 갯수
	public abstract Integer countDoc(EmployeeVO vo);
}