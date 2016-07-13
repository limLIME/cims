package org.kosta.cims.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.dao.DocumentDAO;
import org.kosta.cims.model.DocumentVO;
import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.ListVO;
import org.kosta.cims.model.PagingBean;
import org.springframework.stereotype.Service;

@Service
public class DocumentServiceImpl implements DocumentService {

	@Resource
	private DocumentDAO dao;

	@Override
	public void write(DocumentVO dvo,String app1,String app2,String app3,String app4) {
		dao.write(dvo,app1,app2,app3,app4);
	}
	

	@Override
	public DocumentVO showdocument(int docNo) {
		return dao.showdocument(docNo);
	}
	@Override
	public List<String> findEmpNo(int docNo){
		return dao.findEmpNo(docNo);
	}
	@Override
	public List<String> findPosition(int docNo){
		return dao.findPosition(docNo);
	}
	@Override
	public List<String> findSign(int docNo, List<String> empNoList){
		return dao.findSign(docNo,empNoList);
	}
	
	//-----상태관련 --------------------------------
	@Override
	public void docReturn(int docNo,EmployeeVO evo) {
		dao.docReturn(docNo,evo);

	}
	@Override
	public void docSign(int docNo,String empNo,String empSign){
		dao.docSign(docNo,empNo,empSign);

	}
	@Override
	public void substituteSign(int docNo,String empNo,String empSign){
		dao.substituteSign(docNo,empNo,empSign);
	}

	
	//내가쓴공문-----------------------------------------------
	public  ListVO myDocument(int page, String empNo){
		int getMyTotalPage = dao.getMyTotalPage(empNo);
	      List<Object> list =dao.myDocument(page,empNo);
	      PagingBean pb=new PagingBean(getMyTotalPage, page);
	      ListVO lvo = new ListVO(list,pb);
	      return lvo;
		
	}
	public  ListVO myDocumentSearch(int page, String empNo,String data){
		int getMyDocumentSearchTotalPage = dao.getMyDocumentSearchTotalPage(empNo,data);
		List<Object> list = dao.myDocumentSearch(page,empNo,data);
		PagingBean pb = new PagingBean(getMyDocumentSearchTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}
 
	
	//반려---------------------------------------------------- 
   
   @Override
   public ListVO returnMain(int page, String empNo, String empSign) {
         int getReturnMainTotalPage = dao.getReturnMainTotalPage(empNo,empSign);
            List<Object> list =dao.returnMain(page,empNo, empSign);
            PagingBean pb=new PagingBean(getReturnMainTotalPage, page);
            ListVO lvo = new ListVO(list,pb);
      return lvo;
   }
	
   @Override
	public ListVO returnMainSearch(int page,String empNo,String empSign,String data) {
		int getReturnMainSearchTotalPage = dao.getReturnMainSearchTotalPage(empNo,empSign,data);
		List<Object> list = dao.returnMainSearch(page,empNo,empSign,data);
		PagingBean pb = new PagingBean(getReturnMainSearchTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}
   
	//결재중---------------------------------------------------
   
  

	@Override
	public ListVO waitingMySign(int page,String empNo,int positionNo) {
	      int getWaitingMySignTotalPage = dao.getWaitingMySignTotalPage(empNo,positionNo);
	            List<Object> list = dao.waitingMySign(page,empNo,positionNo);
	            PagingBean pb = new PagingBean(getWaitingMySignTotalPage, page);
	            ListVO lvo = new ListVO(list,pb);
	
	      return lvo;
	   }
	@Override
	public List<Object> waitingSubstitute(String empNo,int positionNo){
	       return dao.waitingSubstitute(empNo,positionNo);
	   }
	@Override
	public ListVO waitingMySignSearch(int page, String empNo, int positionNo,String data) {
	      int getWaitingMySignSearchTotalPage = dao.getWaitingMySignSearchTotalPage(empNo,positionNo,data);
          List<Object> list =dao.waitingMySignSearch(page,empNo, positionNo,data);
          PagingBean pb=new PagingBean(getWaitingMySignSearchTotalPage, page);
          ListVO lvo = new ListVO(list,pb);
          return lvo;
	}
	
	@Override
	public List<Object> waitingSubstituteSearch(String empNo, int positionNo,String data) {
		return dao.waitingSubstituteSearch(empNo, positionNo,data);
	}
	//결재완료--------------------------------------------------
	
	@Override
	public ListVO completeMain(int page, String empNo, String empSign,int positionNo) {
		int getCompleteMainTotalPage = dao.getCompleteMainTotalPage(empNo,empSign,positionNo);
		List<Object> list = dao.completeMain(page,empNo,empSign, positionNo);
		PagingBean pb = new PagingBean(getCompleteMainTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}

	@Override
	public ListVO completeMainSearch(int page, String empNo, String empSign, int positionNo, String data) {
		int getCompleteMainSearchTotalPage = dao.getCompleteMainSearchTotalPage(empNo,empSign,positionNo,data);
		List<Object> list = dao.completeMainSearch(page,empNo,empSign,positionNo,data);
		PagingBean pb = new PagingBean(getCompleteMainSearchTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}
	
	@Override
	public Integer countDoc(EmployeeVO vo) {
		return dao.countDoc(vo);
	}

}
