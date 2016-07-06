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


	
	//반려---------------------------------------------------- 
   @Override
   public ListVO returnMy(int page,String empNo){ 
      int getReturnMyTotalPage = dao.getReturnMyTotalPage(empNo);
      List<Object> list =dao.returnMy(page,empNo);
      PagingBean pb=new PagingBean(getReturnMyTotalPage, page);
      ListVO lvo = new ListVO(list,pb);
      return lvo;
   }      
   @Override
   public ListVO returnSign(int page,String empNo,String empSign){ 
         int getReturnSignTotalPage = dao.getReturnSignTotalPage(empNo,empSign);
         List<Object> list =dao.returnSign(page,empNo,empSign);
         PagingBean pb=new PagingBean(getReturnSignTotalPage, page);
         ListVO lvo = new ListVO(list,pb);
         return lvo;
      }
   @Override
   public ListVO returnList(int page, String empNo, String empSign) {
         int getReturnListTotalPage = dao.getReturnListTotalPage(empNo,empSign);
            List<Object> list =dao.returnList(page,empNo, empSign);
            PagingBean pb=new PagingBean(getReturnListTotalPage, page);
            ListVO lvo = new ListVO(list,pb);
      return lvo;
   }
   @Override
   public ListVO returnMain(int page, String empNo, String empSign) {
         int getReturnMainTotalPage = dao.getReturnMainTotalPage(empNo,empSign);
            List<Object> list =dao.returnMain(page,empNo, empSign);
            PagingBean pb=new PagingBean(getReturnMainTotalPage, page);
            ListVO lvo = new ListVO(list,pb);
      return lvo;
   }
	

	//결재중---------------------------------------------------
   
  

	@Override
	public ListVO waitingMain(int page,String empNo,String empSign,int positionNo) {
		int getWaitingMainTotalPage = dao.getWaitingMainTotalPage(empNo,empSign,positionNo);
		List<Object> list = dao.waitingMain(page,empNo,empSign, positionNo);
		PagingBean pb = new PagingBean(getWaitingMainTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}
	@Override
	public ListVO waitingMy(int page,String empNo) {
		int getWaitingMyTotalPage = dao.getWaitingMyTotalPage(empNo);
		List<Object> list = dao.waitingMy(page, empNo);
		PagingBean pb = new PagingBean(getWaitingMyTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}
	@Override
	public ListVO waiting(int page,String empNo,String empSign) {
		int getWaitingTotalPage = dao.getWaitingTotalPage(empNo,empSign);
		List<Object> list = dao.waiting(page, empNo, empSign);
		PagingBean pb = new PagingBean(getWaitingTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}
	@Override
	public ListVO waitingMySign(int page,String empNo,int positionNo) {
	      int getWaitingMySignTotalPage = dao.getWaitingMySignTotalPage(empNo,positionNo);
	            List<Object> list = dao.waitingMySign(page,empNo,positionNo);
	            PagingBean pb = new PagingBean(getWaitingMySignTotalPage, page);
	            ListVO lvo = new ListVO(list,pb);
	
	      return lvo;
	   }
	
	@Override
	public ListVO waitingSubstitute(int page, String empNo,int positionNo){
	      int getWaitingSubstituteTotalPage = dao.getWaitingSubstituteTotalPage(empNo,positionNo);
	            List<Object> list = dao.waitingSubstitute(page,empNo,positionNo);
	            PagingBean pb = new PagingBean(getWaitingSubstituteTotalPage, page);
	            ListVO lvo = new ListVO(list,pb);
	
	      return lvo;
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
	public ListVO completeMy(int page, String empNo) {
		int getCompleteMyTotalPage = dao.getCompleteMyTotalPage(empNo);
		List<Object> list = dao.completeMy(page, empNo);
		PagingBean pb = new PagingBean(getCompleteMyTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}

	@Override
	public ListVO complete(int page,int positionNo) {
		int getCompleteTotalPage = dao.getCompleteTotalPage(positionNo);
		List<Object> list = dao.complete(page,positionNo);
		PagingBean pb = new PagingBean(getCompleteTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}

	@Override
	public ListVO completeSign(int page,String empNo,String empSign,int positionNo) {
		int getCompleteSignTotalPage = dao.getCompleteSignTotalPage(empNo,empSign, positionNo);
		List<Object> list = dao.completeSign(page,empNo,empSign,positionNo);
		PagingBean pb = new PagingBean(getCompleteSignTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}

	//------------- 반려 검색---------------------
	@Override
	public ListVO returnMainSearch(int page,String empNo,String empSign,String data) {
		int getReturnMainSearchTotalPage = dao.getReturnMainSearchTotalPage(empNo,empSign,data);
		List<Object> list = dao.returnMainSearch(page,empNo,empSign,data);
		PagingBean pb = new PagingBean(getReturnMainSearchTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}

	@Override
	public ListVO returnMySearch(int page, String empNo, String data) {
		int getReturnMySearchTotalPage = dao.getReturnMySearchTotalPage(empNo,data);
		List<Object> list = dao.returnMySearch(page,empNo,data);
		PagingBean pb = new PagingBean(getReturnMySearchTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}


	@Override
	public ListVO returnSignSearch(int page, String empNo, String empSign, String data) {
		int getReturnSignSearchTotalPage = dao.getReturnSignSearchTotalPage(empNo,empSign,data);
		List<Object> list = dao.returnSignSearch(page,empNo,empSign,data);
		PagingBean pb = new PagingBean(getReturnSignSearchTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}


	@Override
	public ListVO returnListSearch(int page, String empNo, String data) {
		int getReturnListSearchTotalPage = dao.getReturnListSearchTotalPage(empNo,data);
		List<Object> list = dao.returnListSearch(page,empNo,data);
		PagingBean pb = new PagingBean(getReturnListSearchTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}

	// -------------- 완료 검색 --------------------
	@Override
	public ListVO completeSearch(int page, String empNo, int positionNo, String data) {
		int getCompleteSearchTotalPage = dao.getCompleteSearchTotalPage(empNo,positionNo,data);
		List<Object> list = dao.completeSearch(page,empNo,positionNo,data);
		PagingBean pb = new PagingBean(getCompleteSearchTotalPage, page);
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
	public ListVO completeSignSearch(int page, String empSign, String empNo, int positionNo, String data) {
		int getCompleteSignSearchTotalPage = dao.getCompleteSignSearchTotalPage(empNo,empSign, positionNo,data);
		List<Object> list = dao.completeSignSearch(page,empNo,empSign,positionNo,data);
		PagingBean pb = new PagingBean(getCompleteSignSearchTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}


	@Override
	public ListVO completeMySearch(int page, String empNo, String data) {
		int getCompleteMySearchTotalPage = dao.getCompleteMySearchTotalPage(empNo,data);
		List<Object> list = dao.completeMySearch(page, empNo,data);
		PagingBean pb = new PagingBean(getCompleteMySearchTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}

	//-----------------------결재중 검색------------------------
	
	@Override
	public ListVO waitingListSearch(int page, String empNo, String empSign, String data) {
		int getWaitingListSearchTotalPage = dao.getWaitingListSearchTotalPage(empNo,empSign,data);
		List<Object> list = dao.waitingListSearch(page, empNo, empSign,data);
		PagingBean pb = new PagingBean(getWaitingListSearchTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}


	@Override
	public ListVO waitingMySearch(int page, String empNo, String data) {
		int getWaitingMySearchTotalPage = dao.getWaitingMySearchTotalPage(empNo,data);
		List<Object> list = dao.waitingMySearch(page, empNo,data);
		PagingBean pb = new PagingBean(getWaitingMySearchTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}


	@Override
	public ListVO waitingMainSearch(int page, String empNo, String empSign, int positionNo, String data) {
		int getWaitingMainSearchTotalPage = dao.getWaitingMainSearchTotalPage(empNo,empSign,positionNo,data);
		List<Object> list = dao.waitingMainSearch(page,empNo,empSign, positionNo,data);
		PagingBean pb = new PagingBean(getWaitingMainSearchTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
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
	public Integer countDoc(EmployeeVO vo) {
		return dao.countDoc(vo);
	}

}
