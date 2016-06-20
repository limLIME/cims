package org.kosta.cims.model;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class DocumentDAOImpl implements DocumentDAO {

	@Resource
	private SqlSessionTemplate template;

	@Override
	public void write(DocumentVO dvo) {
		System.out.println(dvo);
		template.insert("document.write", dvo);
	}

	@Override
	public DocumentVO showdocument(int no) {
		return template.selectOne("document.showdocument", no);
	}

	@Override
	public List<Object> mainList(int page) {
		return template.selectList("document.mainList", page);
	}

	@Override
	public int getTotalPage() {
		return template.selectOne("document.getTotalPage");
	}

	@Override
	public void docReturn(int docNo) {
		template.update("document.docReturn", docNo);
	}

	@Override
	public void docEnd(int docNo) {
		template.update("document.docEnd", docNo);
	}

	@Override
	public void docSign(String approver,int docNo, int positionNo, String sign) {
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("docNo", "" + docNo);
		map.put("sign", sign);
		map.put("approver", approver);

		if (positionNo == 3) {// 과장인경우
			template.update("document.docSign1", map);
		} else if (positionNo == 4) {// 부장인경우
			template.update("document.docSign2", map);
		} else if (positionNo == 5) {// 사장인경우
			template.update("document.docSign3", map);
		}else{
			template.update("document.docSign1", map);
		}
		
		template.update("document.next",map);
	}



	@Override
	public List<Object> myDocumentList(int page, int empNo) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("page", page);
		map.put("empNo", empNo);
		return template.selectList("document.myDocumentList", map);
	}

	@Override
	public int getMainTotalPage() {
		return template.selectOne("document.getMainTotalPage");
	}

//반려----------------------------------------
	  @Override
	   public List<Object> returnMain(int page, int empNo, String empSign, int positionNo) {
	      HashMap<String, String> map=new HashMap<String, String>();
	      System.out.println(page+empNo+empSign+positionNo);
	      map.put("page", ""+page);
	      map.put("empNo", ""+empNo);
	      map.put("empSign", empSign);
	      if(positionNo == 3){         
	         map.put("sno", "d.doc_sign1");
	      }else if(positionNo == 4){
	         map.put("sno", "d.doc_sign2");
	      }else if(positionNo == 5){
	         map.put("sno", "d.doc_sign3");
	      }else{
	         map.put("sno", "d.doc_sign1");
	      }
	      System.out.println("main"+map.toString());
	      return template.selectList("document.returnMain", map);
	   }
	   @Override
	   public List<Object> returnList(int page, int empNo, String empSign, int positionNo) {
	      HashMap<String, String> map=new HashMap<String, String>();
	      map.put("page", ""+page);
	      map.put("empNo", ""+empNo);
	      map.put("empSign", empSign);
	      if(positionNo == 3){         
	         map.put("sno", "d.doc_sign1");
	      }else if(positionNo == 4){
	         map.put("sno", "d.doc_sign2");
	      }else if(positionNo == 5){
	         map.put("sno", "d.doc_sign3");
	      }else{
	         map.put("sno", "d.doc_sign1");
	      }
	      System.out.println("list"+map.toString());
	      return template.selectList("document.returnList", map);
	   }
	   @Override
	   public List<Object> returnSign(int page,int empNo){
	      HashMap<String, String> map = new HashMap<String, String>();
	      map.put("page", ""+page);
	      map.put("empNo", ""+empNo);
	      return template.selectList("document.returnSign",map);
	   }
	   @Override
	   public List<Object> returnMy(int page, int empNo) {
	      HashMap<String, Integer> map = new HashMap<String, Integer>();
	      map.put("page", page);
	      map.put("empNo", empNo);
	      return template.selectList("document.returnMy", map);
	   }
	   @Override
	   public int getReturnSignTotalPage(int empNo) {
	      String empNo2 = ""+empNo;
	      System.out.println(empNo2);
	      return template.selectOne("document.getReturnSignTotalPage", empNo2);
	   }
	   @Override
	   public int getReturnMyTotalPage(int empNo) {
	      return template.selectOne("document.getReturnMyTotalPage", empNo);
	   }
	   @Override
	   public int getReturnListTotalPage(String empSign, int positionNo, int empNo) {
	      HashMap<String, String> map=new HashMap<String, String>();
	      map.put("empNo", ""+empNo);
	      map.put("empSign", empSign);
	      if(positionNo == 3){         
	         map.put("sno", "doc_sign1");
	      }else if(positionNo == 4){
	         map.put("sno", "doc_sign2");
	      }else if(positionNo == 5){
	         map.put("sno", "doc_sign3");
	      }else{
	         map.put("sno", "doc_sign1");
	      }
	      System.out.println("listtotal"+map.toString());
	      return template.selectOne("document.getReturnListTotalPage",map);
	   }
	   @Override
	   public int getReturnMainTotalPage(String empSign, int positionNo, int empNo) {
	      HashMap<String, String> map=new HashMap<String, String>();
	      map.put("empNo", ""+empNo);
	      map.put("empSign", empSign);
	      if(positionNo == 3){         
	         map.put("sno", "doc_sign1");
	      }else if(positionNo == 4){
	         map.put("sno", "doc_sign2");
	      }else if(positionNo == 5){
	         map.put("sno", "doc_sign3");
	      }else{
	         map.put("sno", "doc_sign1");
	      }
	      System.out.println("maintotal"+map.toString());
	      return template.selectOne("document.getReturnMainTotalPage",map);
	   }
	   
	
//결재완료---------------------------
	@Override
	public List<Object> completeMain(int page,int empNo,String empSign,int positionNo) {
			HashMap<String, String> map = new HashMap<String, String>();
		map.put("page", ""+page);
		map.put("empNo", ""+empNo);
		map.put("empSign", empSign);
		if(positionNo == 3){			
			map.put("sno", "d.doc_sign1");
		}else if(positionNo == 4){
			map.put("sno", "d.doc_sign2");
		}else if(positionNo == 5){
			map.put("sno", "d.doc_sign3");
		}else{
			map.put("sno", "d.doc_sign1");
		}

		return template.selectList("document.completeMain",map);
	}
	@Override
	public List<Object> completeMy(int page, int empNo) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("page", page);
		map.put("empNo", empNo);
		return template.selectList("document.completeMy", map);
	}
	@Override
	public List<Object> completeSign(int page,String empSign, int empNo,int positionNo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("page", ""+page);
		map.put("empNo", ""+empNo);
		map.put("empSign", empSign);
		if(positionNo == 3){			
			map.put("sno", "d.doc_sign1");
		}else if(positionNo == 4){
			map.put("sno", "d.doc_sign2");
		}else if(positionNo == 5){
			map.put("sno", "d.doc_sign3");
		}else{
			map.put("sno", "d.doc_sign1");
		}
		return template.selectList("document.completeSign", map);
	}
	@Override
	public List<Object> complete(int page,int empNo,String empSign,int positionNo) {
			HashMap<String, String> map = new HashMap<String, String>();
		map.put("page", ""+page);
		map.put("empNo",""+empNo);
		map.put("empSign", empSign);
		if(positionNo == 3){			
			map.put("sno", "d.doc_sign1");
		}else if(positionNo == 4){
			map.put("sno", "d.doc_sign2");
		}else if(positionNo == 5){
			map.put("sno", "d.doc_sign3");
		}else{
			map.put("sno", "d.doc_sign1");
		}

		return template.selectList("document.complete",map);
	}
	@Override
	public int getCompleteMyTotalPage(int empNo) {
		return template.selectOne("document.getCompleteMyTotalPage", empNo);
	}
	@Override
	public int getCompleteSignTotalPage(int empNo,String empSign, int positionNo) {
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("empSign", empSign);
		map.put("empNo", ""+empNo);
		if(positionNo == 3){			
			map.put("sno", "doc_sign1");
		}else if(positionNo == 4){
			map.put("sno", "doc_sign2");
		}else if(positionNo == 5){
			map.put("sno", "doc_sign3");
		}else{
			map.put("sno", "doc_sign1");
		}
		return template.selectOne("document.getCompleteSignTotalPage", map);
	}
	@Override
	public int getCompleteMainTotalPage(int empNo,String empSign, int positionNo) {
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("empSign", empSign);
		map.put("empNo", ""+empNo);
		if(positionNo == 3){			
			map.put("sno", "doc_sign1");
		}else if(positionNo == 4){
			map.put("sno", "doc_sign2");
		}else if(positionNo == 5){
			map.put("sno", "doc_sign3");
		}else{
			map.put("sno", "doc_sign1");
		}
		
		return template.selectOne("document.getCompleteMainTotalPage", map);
	}
	@Override
	public int getCompleteTotalPage(String empSign, int positionNo) {
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("empSign", empSign);
		if(positionNo == 3){			
			map.put("sno", "doc_sign1");
		}else if(positionNo == 4){
			map.put("sno", "doc_sign2");
		}else if(positionNo == 5){
			map.put("sno", "doc_sign3");
		}else{
			map.put("sno", "doc_sign1");
		}
		
		return template.selectOne("document.getCompleteTotalPage", map);
	}
	
	
	//결재중---------------------------------
	@Override
	public List<Object> waitingMain(int page,int empNo,String empSign,int positionNo) {
			HashMap<String, String> map = new HashMap<String, String>();
		map.put("page", ""+page);
		map.put("empNo", ""+empNo);
		map.put("empSign", empSign);
		if(positionNo == 3){			
			map.put("sno", "d.doc_sign1");
		}else if(positionNo == 4){
			map.put("sno", "d.doc_sign2");
		}else if(positionNo == 5){
			map.put("sno", "d.doc_sign3");
		}else{
			map.put("sno", "d.doc_sign1");
		}

		return template.selectList("document.waitingMain",map);
	}
	public List<Object> waitingMy(int page, int empNo) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("page", page);
		map.put("empNo", empNo);
		return template.selectList("document.completeMy", map);
	}
	@Override
	public List<Object> waiting(int page,int empNo,String empSign,int positionNo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("page", ""+page);
		map.put("empNo",""+empNo);
		map.put("empSign", empSign);
		if(positionNo == 3){			
			map.put("sno", "d.doc_sign1");
		}else if(positionNo == 4){
			map.put("sno", "d.doc_sign2");
		}else if(positionNo == 5){
			map.put("sno", "d.doc_sign3");
		}else{
			map.put("sno", "d.doc_sign1");
		}

		return template.selectList("document.waiting",map);
	}
	@Override
	public List<Object> waitingMySign(int page, int empNo, String empSign) {
	      HashMap<String, String> map=new HashMap<String, String>();
	      map.put("page", ""+page);
	      map.put("empNo", ""+empNo);
	      map.put("empSign", empSign);
	      return template.selectList("document.waitingMySign", map);
	   }	
	public int getWaitingMyTotalPage(int empNo) {
		return template.selectOne("document.getWaitingMyTotalPage", empNo);
	}
	@Override
	public int getWaitingMainTotalPage(int empNo,String empSign, int positionNo) {
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("empSign", empSign);
		map.put("empNo", ""+empNo);
		if(positionNo == 3){			
			map.put("sno", "doc_sign1");
		}else if(positionNo == 4){
			map.put("sno", "doc_sign2");
		}else if(positionNo == 5){
			map.put("sno", "doc_sign3");
		}else{
			map.put("sno", "doc_sign1");
		}
		
		return template.selectOne("document.getWaitingMainTotalPage", map);
	}
	@Override
	public int getWaitingTotalPage(String empSign, int positionNo) {
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("empSign", empSign);
		if(positionNo == 3){			
			map.put("sno", "doc_sign1");
		}else if(positionNo == 4){
			map.put("sno", "doc_sign2");
		}else if(positionNo == 5){
			map.put("sno", "doc_sign3");
		}else{
			map.put("sno", "doc_sign1");
		}
		
		return template.selectOne("document.getWaitingTotalPage", map);
	}
	public int getWaitingMySignTotalPage(String empSign, int empNo) {
	      HashMap<String, String> map=new HashMap<String, String>();
	      map.put("empNo", ""+empNo);
	      map.put("empSign", empSign);
	      return template.selectOne("document.getWaitingMySignTotalPage",map);
	   }
		
	
	
	//내가쓴글 전체리스트 
	@Override
	public int getMyDocumentListTotalPage(int empNo) {
		return template.selectOne("document.getMyDocumentListTotalPage", empNo);
	}





}













