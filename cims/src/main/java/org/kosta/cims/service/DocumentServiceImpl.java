package org.kosta.cims.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.model.DocumentDAO;
import org.kosta.cims.model.DocumentVO;
import org.kosta.cims.model.ListVO;
import org.kosta.cims.model.PagingBean;
import org.springframework.stereotype.Service;

@Service
public class DocumentServiceImpl implements DocumentService {

	@Resource
	private DocumentDAO dao;

	@Override
	public void write(DocumentVO dvo) {
		dao.write(dvo);
	}

	@Override
	public DocumentVO showdocument(int no) {
		return dao.showdocument(no);
	}

	@Override
	public ListVO mainList(int page) {
		int getTotalPage = dao.getTotalPage();
		List<Object> list = dao.mainList(page);
		PagingBean pb = new PagingBean(getTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}

	@Override
	public void docReturn(int docNo) {
		dao.docReturn(docNo);

	}

	@Override
	public void docEnd(int docNo) {
		dao.docEnd(docNo);
	}

	@Override
	public void docSign(String approver,int docNo, int positionNo, String sign) {
		dao.docSign(approver,docNo, positionNo, sign);

	}


	@Override
	public ListVO myDocumentList(int page, int empNo) {
		int getMyDocumentTotalPage = dao.getMyDocumentListTotalPage(empNo);
		List<Object> list = dao.myDocumentList(page, empNo);
		PagingBean pb = new PagingBean(getMyDocumentTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}

	
	//반려---------------------------------------------------- 
   @Override
   public ListVO returnMy(int page,int empNo){ 
      int getReturnMyTotalPage = dao.getReturnMyTotalPage(empNo);
      List<Object> list =dao.returnMy(page,empNo);
      PagingBean pb=new PagingBean(getReturnMyTotalPage, page);
      ListVO lvo = new ListVO(list,pb);
      return lvo;
   }      
   @Override
   public ListVO returnSign(int page,int empNo){ 
         int getReturnSignTotalPage = dao.getReturnSignTotalPage(empNo);
         List<Object> list =dao.returnSign(page,empNo);
         PagingBean pb=new PagingBean(getReturnSignTotalPage, page);
         ListVO lvo = new ListVO(list,pb);
         return lvo;
      }
   @Override
   public ListVO returnList(int page, int empNo, String empSign, int positionNo) {
         int getReturnListTotalPage = dao.getReturnListTotalPage(empSign,positionNo, empNo);
            List<Object> list =dao.returnList(page,empNo, empSign,positionNo);
            PagingBean pb=new PagingBean(getReturnListTotalPage, page);
            ListVO lvo = new ListVO(list,pb);
      return lvo;
   }
   @Override
   public ListVO returnMain(int page, int empNo, String empSign, int positionNo) {
         int getReturnMainTotalPage = dao.getReturnMainTotalPage(empSign,positionNo, empNo);
            List<Object> list =dao.returnMain(page,empNo, empSign,positionNo);
            PagingBean pb=new PagingBean(getReturnMainTotalPage, page);
            ListVO lvo = new ListVO(list,pb);
      return lvo;
   }
	

	//결재중---------------------------------------------------
	@Override
	public ListVO waitingMain(int page, int empNo, String empSign,int positionNo) {
		int getWaitingMainTotalPage = dao.getWaitingMainTotalPage(empNo,empSign,
				positionNo);
		List<Object> list = dao.waitingMain(page,empNo,empSign, positionNo);
		PagingBean pb = new PagingBean(getWaitingMainTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}
	@Override
	public ListVO waitingMy(int page, int empNo) {
		int getWaitingMyTotalPage = dao.getWaitingMyTotalPage(empNo);
		List<Object> list = dao.waitingMy(page, empNo);
		PagingBean pb = new PagingBean(getWaitingMyTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}
	@Override
	public ListVO waiting(int page, int empNo, String empSign, int positionNo) {
		int getWaitingTotalPage = dao
				.getWaitingTotalPage(empSign, positionNo);
		List<Object> list = dao.waiting(page, empNo, empSign, positionNo);
		PagingBean pb = new PagingBean(getWaitingTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}
	@Override
	public ListVO waitingMySign(int page, int empNo, String empSign) {
	      int getWaitingMySignTotalPage = dao.getWaitingMySignTotalPage(empSign, empNo);
	            List<Object> list =dao.waitingMySign(page,empNo, empSign);
	            PagingBean pb=new PagingBean(getWaitingMySignTotalPage, page);
	            ListVO lvo = new ListVO(list,pb);
	      return lvo;
	   }


	
	//결재완료--------------------------------------------------
	
	@Override
	public ListVO completeMain(int page, int empNo, String empSign,
			int positionNo) {
		int getCompleteMainTotalPage = dao.getCompleteMainTotalPage(empNo,empSign,
				positionNo);
		List<Object> list = dao.completeMain(page,empNo,empSign, positionNo);
		PagingBean pb = new PagingBean(getCompleteMainTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}

	@Override
	public ListVO completeMy(int page, int empNo) {
		int getCompleteMyTotalPage = dao.getCompleteMyTotalPage(empNo);
		List<Object> list = dao.completeMy(page, empNo);
		PagingBean pb = new PagingBean(getCompleteMyTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}

	@Override
	public ListVO complete(int page, int empNo, String empSign, int positionNo) {
		int getCompleteTotalPage = dao
				.getCompleteTotalPage(empSign, positionNo);
		List<Object> list = dao.complete(page, empNo, empSign, positionNo);
		PagingBean pb = new PagingBean(getCompleteTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}

	@Override
	public ListVO completeSign(int page,String empSign,int empNo,int positionNo) {
		int getCompleteSignTotalPage = dao.getCompleteSignTotalPage( empNo, empSign, positionNo);
		List<Object> list = dao.completeSign(page,empSign,empNo,positionNo);
		PagingBean pb = new PagingBean(getCompleteSignTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}



}
