package org.kosta.cims.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.model.ApproverVO;
import org.kosta.cims.model.DocumentVO;
import org.kosta.cims.model.EmployeeVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class DocumentDAOImpl implements DocumentDAO {

	@Resource
	private SqlSessionTemplate template;

	@Override
	public void write(DocumentVO dvo, String app1, String app2, String app3,String app4) {
		template.insert("document.write", dvo);
		ArrayList<String> list = new ArrayList<String>();
		list.add(app1);
		list.add(app2);
		list.add(app3);
		list.add(app4);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("docNo",  dvo.getDocNo());
		map.put("empNo", dvo.getEmployeeVO().getEmpNo());
		
System.out.println(list);
		for (int i = 0; i <4; i++) {
			if (!(list.get(i).equals(""))){
				map.put("approver", list.get(i));
				map.put("positionNo",template.selectOne("document.findPositionNo",list.get(i)));
				template.insert("document.addApprover", map);
			}
		}
	}

	@Override
	public DocumentVO showdocument(int docNo) {
		return template.selectOne("document.showdocument", docNo);
	}
	@Override
	public List<String> findEmpNo(int docNo) {
		return  template.selectList("document.findEmpNo", docNo);
	}
	
	@Override
	public List<String> findPosition(int docNo) {
		List<String> empNoList = template.selectList("document.findEmpNo", docNo);
	
		List<String> positionList = new ArrayList<String>();
		for(int i=0;i<empNoList.size();i++){ 
			positionList.add(template.selectOne("document.findPositionName",empNoList.get(i)));
		}
		return positionList;
	}
	@Override
	public List<String> findSign(int docNo,List<String> empNoList) {
		List<String> signList = new ArrayList<String>();
		ApproverVO avo =new ApproverVO();
		DocumentVO dvo= new DocumentVO();
		EmployeeVO evo=new EmployeeVO();
		avo.setDocumentVO(dvo);
		avo.setEmployeeVO(evo);
		avo.getDocumentVO().setDocNo(docNo);
		for(int i=0;i<empNoList.size();i++){ 
			avo.getEmployeeVO().setEmpNo(empNoList.get(i).toString());
			System.out.println(avo);
			signList.add(template.selectOne("document.findSign",avo));
		
		}
		return signList;

	}

	@Override
	public void docReturn(int docNo,EmployeeVO evo) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("docNo", docNo);
		map.put("empNo", evo.getEmpNo());
		template.update("document.docReturn", map);
	}

	
	@Override
	public void  docSign(int docNo,String empNo,String empSign){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("docNo",docNo);
		map.put("empNo",empNo);
		map.put("empSign",empSign );
		template.update("document.docSign", map);
		int x=template.selectOne("document.docCheck",docNo);
		if(x==0){
			template.update("document.docEnd", docNo);
		}

	}

	// 반려----------------------------------------
	@Override
	public List<Object> returnMain(int page, String empNo, String empSign) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("empNo", empNo);
		map.put("empSign", empSign);
		return template.selectList("document.returnMain", map);
	}

	@Override
	public List<Object> returnList(int page, String empNo, String empSign) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("empNo", empNo);
		map.put("empSign", empSign);
		
		return template.selectList("document.returnList", map);
	}

	@Override
	public List<Object> returnSign(int page, String empNo,String empSign) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("empNo",empNo);
		map.put("empSign", empSign);
		return template.selectList("document.returnSign", map);
	}

	@Override
	public List<Object> returnMy(int page, String empNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("empNo", empNo);
		return template.selectList("document.returnMy", map);
	}

	@Override
	public int getReturnSignTotalPage(String empNo,String empSign) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empSign", empSign);
		map.put("empNo", empNo);
		return template.selectOne("document.getReturnSignTotalPage", map);
	}

	@Override
	public int getReturnMyTotalPage(String empNo) {
		return template.selectOne("document.getReturnMyTotalPage", empNo);
	}

	@Override
	public int getReturnListTotalPage( String empNo,String empSign) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("empSign", empSign);
		return template.selectOne("document.getReturnListTotalPage", map);
	}

	@Override
	public int getReturnMainTotalPage(String empNo,String empSign) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empNo",  empNo);
		map.put("empSign", empSign);
		return template.selectOne("document.getReturnMainTotalPage", map);
	}

	// 결재완료---------------------------
	@Override
	public List<Object> completeMain(int page, String empNo, String empSign,int positionNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("empNo", empNo);
		map.put("empSign", empSign);
		map.put("positionNo",positionNo);
		return template.selectList("document.completeMain", map);
	}

	@Override
	public List<Object> completeMy(int page, String empNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("empNo", empNo);
		return template.selectList("document.completeMy", map);
	}

	@Override
	public List<Object> completeSign(int page,String empNo, String empSign,int positionNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page",  page);
		map.put("empNo", empNo);
		map.put("empSign", empSign);
		map.put("positionNo", positionNo);
		return template.selectList("document.completeSign", map);
	}

	@Override
	public List<Object> complete(int page,int positionNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("positionNo",positionNo);
		return template.selectList("document.complete", map);
	}

	@Override
	public int getCompleteMyTotalPage(String empNo) {
		return template.selectOne("document.getCompleteMyTotalPage", empNo);
	}

	@Override
	public int getCompleteSignTotalPage(String empNo,String empSign,int positionNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empSign", empSign);
		map.put("empNo", empNo);
		map.put("positionNo",positionNo);
		return template.selectOne("document.getCompleteSignTotalPage", map);
	}

	@Override
	public int getCompleteMainTotalPage(String empNo, String empSign,
			int positionNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empSign", empSign);
		map.put("empNo", empNo);
		map.put("positionNo", positionNo);
		return template.selectOne("document.getCompleteMainTotalPage", map);
	}

	@Override
	public int getCompleteTotalPage(int positionNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("positionNo",positionNo);
		return template.selectOne("document.getCompleteTotalPage", map);
	}

	// 결재중---------------------------------
	@Override
	public List<Object> waitingMain(int page, String empNo, String empSign,int positionNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("empNo",empNo);
		map.put("empSign", empSign);
		map.put("positionNo", positionNo);
		return template.selectList("document.waitingMain", map);
	}

	public List<Object> waitingMy(int page, String empNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("empNo", empNo);
		return template.selectList("document.waitingMy", map);
	}

	@Override
	public List<Object> waiting(int page, String empNo, String empSign) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("empNo", empNo);
		map.put("empSign", empSign);
			return template.selectList("document.waiting", map);
	}

	@Override
	public List<Object> waitingMySign(int page, String empNo, int positionNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("empNo",empNo);
		map.put("positionNo", positionNo);
		return template.selectList("document.waitingMySign", map);
	}

	public int getWaitingMyTotalPage(String empNo) {
		return template.selectOne("document.getWaitingMyTotalPage", empNo);
	}

	@Override
	public int getWaitingMainTotalPage(String empNo, String empSign, int positionNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empSign", empSign);
		map.put("empNo", empNo);
		map.put("positionNo", positionNo);
		return template.selectOne("document.getWaitingMainTotalPage", map);
	}

	@Override
	public int getWaitingTotalPage(String empNo,String empSign) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("empNo", empNo);
		map.put("empSign", empSign);
		return template.selectOne("document.getWaitingTotalPage", map);
	}

	public int getWaitingMySignTotalPage(String empNo,int positionNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("positionNo", positionNo);
		return template.selectOne("document.getWaitingMySignTotalPage", map);
	}
	
	public List<Object> waitingSubstitute(int page, String empNo,int positionNo){
		List<EmployeeVO> list = template.selectList("document.findMySubstitute",empNo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("sub", empNo);
		List<Object> list3 = new ArrayList<Object>();

		for(int i=0;i<list.size();i++){
			map.put("empNo",list.get(i).getEmpNo());
			map.put("positionNo", list.get(i).getPositionVO().getPositionNo());
			List<Object> list2=template.selectList("document.waitingSubstitute", map);
			for(int j=0;j<list2.size();j++){
				list3.add(list2.get(j));
			}
		
		}
		return  list3;
	}

	public  int getWaitingSubstituteTotalPage(String empNo,int positionNo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("positionNo", positionNo);
		return template.selectOne("document.getWaitingSubstituteTotalPage", map);
		
	}

	//------------반려 검색----------------
	@Override
	public List<Object> returnMainSearch(int page,String empNo,String empSign,String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("data", data);
		map.put("empNo", empNo);
		map.put("empSign", empSign);
		return template.selectList("document.returnMainSearch", map);
	}
	@Override
	public int getReturnMainSearchTotalPage(String empNo,String empSign,String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();		
		map.put("data", data);
		map.put("empNo", empNo);
		map.put("empSign", empSign);
		return template.selectOne("document.getReturnMainSearchTotalPage", map);
	}

	@Override
	public List<Object> returnMySearch(int page, String empNo, String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("data", data);
		map.put("empNo", empNo);
		return template.selectList("document.returnMySearch", map);
	}

	@Override
	public int getReturnMySearchTotalPage(String empNo, String data) {
	HashMap<String, Object> map = new HashMap<String, Object>();		
	map.put("data", data);
	map.put("empNo", empNo);
	return template.selectOne("document.getReturnMySearchTotalPage", map);
	}

	@Override
	public List<Object> returnSignSearch(int page, String empNo, String empSign, String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("data", data);
		map.put("empNo", empNo);
		map.put("empSign", empSign);
		return template.selectList("document.returnSignSearch", map);
	}

	@Override
	public int getReturnSignSearchTotalPage(String empNo, String empSign, String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();		
		map.put("data", data);
		map.put("empNo", empNo);
		map.put("empSign", empSign);
		return template.selectOne("document.getReturnSignSearchTotalPage", map);
	}

	@Override
	public List<Object> returnListSearch(int page, String empNo, String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("data", data);
		map.put("empNo", empNo);
		return template.selectList("document.returnListSearch", map);
	}

	@Override
	public int getReturnListSearchTotalPage(String empNo, String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();		
		map.put("data", data);
		map.put("empNo", empNo);
		return template.selectOne("document.getReturnListSearchTotalPage", map);
	}
	// 완료 검색--------------------------------------------------------------------------
	@Override
	public List<Object> completeSearch(int page, String empNo, int positionNo, String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("data", data);
		map.put("empNo", empNo);
		map.put("positionNo", positionNo);
		return template.selectList("document.completeSearch", map);
	}

	@Override
	public int getCompleteSearchTotalPage(String empNo,int positionNo, String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();		
		map.put("data", data);
		map.put("empNo", empNo);
		map.put("positionNo", positionNo);
		return template.selectOne("document.getCompleteSearchTotalPage", map);
	}

	@Override
	public List<Object> completeMainSearch(int page, String empNo, String empSign, int positionNo, String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();		
		map.put("page", page);
		map.put("empNo", empNo);
		map.put("positionNo", positionNo);
		map.put("empSign", empSign);
		map.put("data", data);
		return template.selectList("document.completeMainSearch", map);
	}

	@Override
	public int getCompleteMainSearchTotalPage(String empNo, String empSign, int positionNo, String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();				
		map.put("empNo", empNo);
		map.put("positionNo", positionNo);
		map.put("empSign", empSign);
		map.put("data", data);
		return template.selectOne("document.getCompleteMainSearchTotalPage", map);
	}

	@Override
	public List<Object> completeSignSearch(int page, String empNo,String empSign,int positionNo, String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("empNo", empNo);
		map.put("empSign", empSign);
		map.put("positionNo",positionNo);
		map.put("data", data);
		return template.selectList("document.completeSignSearch", map);
	}
	@Override
	public int getCompleteSignSearchTotalPage(String empNo, String empSign, int positionNo, String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empSign", empSign);
		map.put("empNo", empNo);
		map.put("positionNo",positionNo);
		map.put("data", data);
		return template.selectOne("document.getCompleteSignSearchTotalPage", map);
	}

	@Override
	public List<Object> completeMySearch(int page, String empNo, String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("empNo", empNo);
		map.put("data", data);
		return template.selectList("document.completeMySearch", map);
	}

	@Override
	public int getCompleteMySearchTotalPage(String empNo, String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("data", data);
		return template.selectOne("document.getCompleteMySearchTotalPage", map);
	}

	//-------------------결재중 검색---------------------
	
	@Override
	public List<Object> waitingListSearch(int page, String empNo,String empSign, String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page",  page);
		map.put("empNo", empNo);
		map.put("empSign", empSign);
		map.put("data", data);
		return template.selectList("document.waitingSearch", map);
	}

	@Override
	public List<Object> waitingMySearch(int page, String empNo, String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("empNo", empNo);
		map.put("data", data);
		return template.selectList("document.waitingMySearch", map);
	}

	@Override
	public List<Object> waitingMainSearch(int page, String empNo,String empSign, int positionNo, String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("empNo", empNo);
		map.put("empSign", empSign);
		map.put("positionNo", positionNo);
		map.put("data", data);
		return template.selectList("document.waitingMainSearch", map);
	}

	@Override
	public List<Object> waitingMySignSearch(int page, String empNo,int positionNo, String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("empNo", empNo);
		map.put("positionNo",  positionNo);
		map.put("data", data);
		return template.selectList("document.waitingMySignSearch", map);
	}

	@Override
	public int getWaitingListSearchTotalPage(String empNo, String empSign,String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("data", data);
		map.put("empSign", empSign);
		return template.selectOne("document.getWaitingSearchTotalPage", map);
	}

	@Override
	public int getWaitingMySearchTotalPage(String empNo, String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("data", data);
		return template.selectOne("document.getWaitingMySearchTotalPage", map);
	}

	@Override
	public int getWaitingMainSearchTotalPage(String empNo, String empSign,int positionNo, String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("data", data);
		map.put("empSign", empSign);
		map.put("positionNo",positionNo);
		return template.selectOne("document.getWaitingMainSearchTotalPage", map);
	}

	@Override
	public int getWaitingMySignSearchTotalPage(String empNo, int positionNo,String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("data", data);
		map.put("positionNo", positionNo);
		return template.selectOne("document.getWaitingMySignSearchTotalPage", map);
	}
	
	@Override
	public Integer countDoc(EmployeeVO vo) {
		return template.selectOne("document.countDoc", vo);
	}
}
