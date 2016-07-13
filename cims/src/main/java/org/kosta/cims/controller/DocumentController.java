package org.kosta.cims.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.cims.model.DepartmentVO;
import org.kosta.cims.model.DocumentVO;
import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.ListVO;
import org.kosta.cims.service.DocumentService;
import org.kosta.cims.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DocumentController {
	@Resource
	private DocumentService documentService;

	@Resource
	private EmployeeService employeeService;

	@Resource(name = "documentPath")
	private String documentPath;

	@Resource(name = "signPath")
	private String signPath;
	
	//결재/반려 있는 공문보기
	@RequestMapping("doc_showdocument.do")
	public ModelAndView showdocument(int docNo, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		DocumentVO dvo = documentService.showdocument(docNo);
		List<String> empNoList = documentService.findEmpNo(docNo);
		List<String> positionList = documentService.findPosition(docNo);
		List<String> signList = documentService.findSign(docNo, empNoList);
		String flag = null;

		for (int i = 0; i < empNoList.size(); i++) {
			if (empNoList.get(i).equals(evo.getEmpNo())) {
				flag = evo.getEmpNo();
				break;

			}
		}
		session.setAttribute("flag", flag);
		ModelAndView mv = new ModelAndView();
		mv.addObject("dvo", dvo);
		mv.addObject("empNoList", empNoList);
		mv.addObject("positionList", positionList);
		mv.addObject("signList", signList);
		mv.setViewName("doc_showdocument");
		return mv;
	}

	//결재/반려 없는 공문보기
	@RequestMapping("doc_showdocument2.do")
	public ModelAndView showdocument2(int docNo, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		DocumentVO dvo = documentService.showdocument(docNo);
		List<String> empNoList = documentService.findEmpNo(docNo);
		List<String> positionList = documentService.findPosition(docNo);
		List<String> signList = documentService.findSign(docNo, empNoList);
		String flag = null;

		for (int i = 0; i < empNoList.size(); i++) {
			if (empNoList.get(i).equals(evo.getEmpNo())) {
				flag = evo.getEmpNo();
				break;

			}
		}
		session.setAttribute("flag", flag);

		ModelAndView mv = new ModelAndView();
		mv.addObject("dvo", dvo);
		mv.addObject("empNoList", empNoList);
		mv.addObject("positionList", positionList);
		mv.addObject("signList", signList);

		mv.setViewName("doc_showdocument2");
		return mv;
	}
	
	//결재대행 공문보기
		@RequestMapping("doc_showdocument3.do")
		public ModelAndView showdocument3(int docNo, HttpServletRequest request) {
			HttpSession session = request.getSession(false);
			EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
			DocumentVO dvo = documentService.showdocument(docNo);
			List<String> empNoList = documentService.findEmpNo(docNo);
			List<String> positionList = documentService.findPosition(docNo);
			List<String> signList = documentService.findSign(docNo, empNoList);
			String flag = null;

			for (int i = 0; i < empNoList.size(); i++) {
				if (empNoList.get(i).equals(evo.getEmpNo())) {
					flag = evo.getEmpNo();
					break;

				}
			}
			session.setAttribute("flag", flag);

			ModelAndView mv = new ModelAndView();
			mv.addObject("dvo", dvo);
			mv.addObject("empNoList", empNoList);
			mv.addObject("positionList", positionList);
			mv.addObject("signList", signList);

			mv.setViewName("doc_showdocument3");
			return mv;
		}

	
	//공문작성 폼으로 가기
	@RequestMapping("doc_writeForm.do")
	public String docWriteForm(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.setAttribute("left", 19);
		return "doc_write";
	}

	//공문작성 디비에 추가하기
	@RequestMapping("doc_write.do")
	public ModelAndView docWrite(HttpServletRequest request, DocumentVO dvo) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		// 파일업로드---------------------------------------------
		MultipartFile file = dvo.getMultipartFile();
		if (file.isEmpty() == false) {
			File uploadFile = new File(documentPath
					+ file.getOriginalFilename());
			try {
				file.transferTo(uploadFile); // 실제 디렉토리로 파일을 저장한다
				//System.out.println(documentPath + "에 파일업로드");
				dvo.setPath(file.getOriginalFilename());
			} catch (Exception e) {
		
				e.printStackTrace();
			}
		} else {
			dvo.setPath("1");
		}
		dvo.setEmployeeVO(evo);
		ArrayList<String> list = new ArrayList<String>();
		list.add(request.getParameter("approver1"));
		list.add(request.getParameter("approver2"));
		list.add(request.getParameter("approver3"));
		list.add(request.getParameter("approver4"));
		for (int i = 0; i < 4; i++) {
			if (!(list.get(i).equals(""))) {
				dvo.setApprover(list.get(i).substring(list.get(i).indexOf("(")+1, list.get(i).indexOf(")")));
				break;
			}
		}
		for (int i = 0; i < 4; i++) {
			if (!(list.get(i).equals(""))) {
				list.set(i,list.get(i).substring(list.get(i).indexOf("(")+1, list.get(i).indexOf(")")));
			}
		}
		// 공문작성하기 //결재 대상자 테이블에 결재 대상자 넣기
		documentService.write(dvo, list.get(0), list.get(1), list.get(2),
				list.get(3));

		return new ModelAndView("redirect:doc_showdocument.do?docNo="
				+ dvo.getDocNo());
	}

	// 파일 다운로드를 위한 메서드
	@RequestMapping("fileDownload.do")
	public ModelAndView fileDownload(String fileName) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("path", documentPath);
		return new ModelAndView("downloadView", map);
	}

	// 반려하기 버튼눌렀을시
	//공문 상태 '반려' 로 바구기
	@RequestMapping("doc_return.do")
	public ModelAndView docReturn(HttpServletRequest request, int docNo) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		documentService.docReturn(docNo, evo);
		return new ModelAndView("redirect:doc_showdocument2.do?docNo=" + docNo);
	}

	// 결재 버튼눌렀을시
	//정상결재시 doc 의 내 포지션에 내 사인 넣기
	@RequestMapping("doc_sign.do")
	public ModelAndView docSign(HttpServletRequest request, int docNo) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		String empSign = evo.getEmpSign();
		documentService.docSign(docNo, empNo, empSign);
		return new ModelAndView("redirect:doc_showdocument2.do?docNo=" + docNo);
	}
	
	// 결재대행 버튼눌렀을시
	//정상 결재시 doc 빈사인칸중 가장낮은것에 내 사인 넣기
	@RequestMapping("doc_substituteSign.do")
	public ModelAndView substituteSign(HttpServletRequest request, int docNo) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		String empSign = evo.getEmpSign();
		documentService.substituteSign(docNo, empNo, empSign);
		return new ModelAndView("redirect:doc_showdocument2.do?docNo=" + docNo);
	}
	
	
//--------------------------게시판&검색-----------------------
	//내가 쓴글 목록
	@RequestMapping("doc_myDocument.do")
	public ModelAndView myDocument(int page, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.setAttribute("left", 20);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		ListVO myDocument = documentService.myDocument(page, empNo);
		return new ModelAndView("doc_myDocument", "myDocument", myDocument);
	}
	
	// 리턴
	@RequestMapping("doc_returnMain.do")
	public ModelAndView returnMain(int page, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.setAttribute("left", 22);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		String empSign = evo.getEmpSign();
		ListVO returnMain = documentService.returnMain(page, empNo, empSign);
		return new ModelAndView("doc_returnmain", "returnMain", returnMain);
	}

	// 결재대기중
	@RequestMapping("doc_waitingMySign.do")
	public ModelAndView waitingMySign(int page, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		session.setAttribute("left", 21);
		String empNo = evo.getEmpNo();
		int positionNo = evo.getPositionVO().getPositionNo();
		ListVO waitingMySign = documentService.waitingMySign(page,empNo,positionNo);
		return new ModelAndView("doc_waitingmysign", "waitingMySign",waitingMySign);
	}
	
	//결재대행
	@RequestMapping("doc_waitingSubstitute.do")
	public ModelAndView waitingSubstitute(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.setAttribute("left", 24);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		int positionNo = evo.getPositionVO().getPositionNo();
		List<Object> waitingSubstitute = documentService.waitingSubstitute(empNo,positionNo);
		return new ModelAndView("doc_waitingSubstitute", "waitingSubstitute",waitingSubstitute);
	}

	// 내가관련된 완료목록 전체
	@RequestMapping("doc_completeMain.do")
	public ModelAndView completeMain(int page, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.setAttribute("left", 23);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		int positionNo = evo.getPositionVO().getPositionNo();
		String empSign = evo.getEmpSign();
		ListVO completeMain = documentService.completeMain(page, empNo,
				empSign, positionNo);
		return new ModelAndView("doc_completemain", "completeMain",
				completeMain);
	}

	
	//검색  

	//내글검색
		@RequestMapping("doc_myDocumentSearch.do")
		public ModelAndView myDocumentSearch(String data, int page,HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		ListVO list = documentService.myDocumentSearch(page, empNo,data);
		ModelAndView mv=new ModelAndView();
		mv.addObject("myDocumentSearchList",list);
		mv.addObject("data",data);
		mv.setViewName("doc_myDocumentSearch");
		return mv;
	}
		
	//반려검색
	@RequestMapping("doc_returnMainSearch")
	public ModelAndView returnMainSearch(String data, int page,
			HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		String empSign = evo.getEmpSign();
		ListVO list = documentService.returnMainSearch(page, empNo, empSign,data);
		ModelAndView mv =new ModelAndView();
		mv.setViewName("doc_returnmainsearch");
		mv.addObject("data",data);
		mv.addObject("returnMainSearchList",list);
		return mv;
	}


	// --------------------------완료검색--------------
	
	@RequestMapping("doc_completeMainSearch.do")
	public ModelAndView completeMainSearch(String data, int page,
			HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		String empSign = evo.getEmpSign();
		int positionNo = evo.getPositionVO().getPositionNo();
		ListVO list = documentService.completeMainSearch(page, empNo, empSign,positionNo, data);
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("doc_completemainsearch");
		mv.addObject("data",data);
		mv.addObject("completeMainSearchList",list);
		return mv;
	}

	// --------------------------결재중검색-------------------------

	// 결재대기중
	@RequestMapping("doc_waitingMySignSearch.do")
	public ModelAndView waitingMySignSearch(int page, String data,
			HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		int positionNo = evo.getPositionVO().getPositionNo();
		ListVO list = documentService.waitingMySignSearch(page, empNo,
				positionNo, data);

		ModelAndView mv=new ModelAndView();
		mv.setViewName("doc_waitingmysignsearch");
		mv.addObject("data",data);
		mv.addObject("waitingMySignSearchList",list);
		return mv;

	}
//------------결재대행 검색----------------------------
	@RequestMapping("doc_waitingSubstituteSearch.do")
	public ModelAndView waitingSubstituteSearch(String data, int page,
			HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		int positionNo = evo.getPositionVO().getPositionNo();
		List<Object> list = documentService.waitingSubstituteSearch(empNo,positionNo,data);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("doc_waitingSubstituteSearch");
		mv.addObject("data",data);
		mv.addObject("waitingSubstituteSearchList",list);
		return mv;
			
	}
	

	//결재자 지정 팝업띄우기 
		@RequestMapping("doc_popup.do")
	public ModelAndView popup(HttpServletRequest request, String txt) {
		List<DepartmentVO> list = employeeService.deptList();
		ModelAndView mv = new ModelAndView();

		mv.addObject("app", "#" + txt);
		mv.addObject("deptList", list);
		mv.setViewName("document/search");

		return mv;
	}

	
	@RequestMapping("doc_seardBydeptName.do")
	@ResponseBody
	public List<EmployeeVO> seardBydeptName(String deptName) {
		List<EmployeeVO> list = employeeService.seardBydeptName(deptName);
		return list;
	}

	@RequestMapping("doc_findByName.do")
	@ResponseBody
	public List<EmployeeVO> findByName(String empName) {
		List<EmployeeVO> list = employeeService.findByName(empName);
		return list;
	}

	@RequestMapping("doc_setSubstitute.do")
	public ModelAndView setSubstitute(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.setAttribute("left", 25);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		int deptNo = evo.getDepartmentVO().getDeptNo();
		int positionNo = evo.getPositionVO().getPositionNo();
		List<EmployeeVO> list = employeeService.findSubstitute(empNo, deptNo,positionNo);
		EmployeeVO mysub = employeeService.getMySubstitute(empNo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("sub", list);
		mv.addObject("mysub", mysub);
		mv.setViewName("doc_substitute");
		return mv;
	}
	//내결재대행 바꾸기
	@RequestMapping("doc_updateSubstitute.do")
	public String updateSubstitute(HttpServletRequest request,String subNo) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		employeeService.updateSubstitute(empNo, subNo);

		return "redirect:doc_setSubstitute.do";
	}

	
	
}
