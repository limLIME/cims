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

	@RequestMapping("doc_writeForm.do")
	public String docWriteForm(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.setAttribute("left", 8);
		return "doc_write";
	}

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
				System.out.println(documentPath + "에 파일업로드");
				dvo.setPath(file.getOriginalFilename());
			} catch (IllegalStateException | IOException e) {
		
				e.printStackTrace();
			}
		} else {
			dvo.setPath("1");
		}
		// dvo에다 evo 넣어줌
		dvo.setEmployeeVO(evo);
		// ""이면 결재대상자 없음
		ArrayList<String> list = new ArrayList<String>();
		list.add(request.getParameter("approver1"));
		list.add(request.getParameter("approver2"));
		list.add(request.getParameter("approver3"));
		list.add(request.getParameter("approver4"));

		for (int i = 0; i < 4; i++) {
			if (!(list.get(i).equals(""))) {
				dvo.setApprover(list.get(i));
				break;
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
	@RequestMapping("doc_return.do")
	public ModelAndView docReturn(HttpServletRequest request, int docNo) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		documentService.docReturn(docNo, evo);
		return new ModelAndView("redirect:doc_showdocument.do?docNo=" + docNo);
	}

	// 결재 버튼눌렀을시
	@RequestMapping("doc_sign.do")
	public ModelAndView docSign(HttpServletRequest request, int docNo) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		String empSign = evo.getEmpSign();
		documentService.docSign(docNo, empNo, empSign);
		return new ModelAndView("redirect:doc_showdocument.do?docNo=" + docNo);
	}

	// 반려--------------------------------------------------
	// 내가 쓴 공문중 반려된 리스트
	@RequestMapping("doc_returnMy.do")
	public ModelAndView returnMy(int page, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		ListVO returnMy = documentService.returnMy(page, empNo);
		return new ModelAndView("doc_returnmy", "returnMy", returnMy);
	}

	// 내가 반려 시킨 공문 리스트
	@RequestMapping("doc_returnSign.do")
	public ModelAndView returnSign(int page, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		String empSign = evo.getEmpSign();

		ListVO returnSign = documentService.returnSign(page, empNo, empSign);
		return new ModelAndView("doc_returnsign", "returnSign", returnSign);
	}

	// 반려된 공문중 내가 관련된 리스트
	@RequestMapping("doc_returnList.do")
	public ModelAndView returnList(int page, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		String empSign = evo.getEmpSign();
		ListVO returnList = documentService.returnList(page, empNo, empSign);

		return new ModelAndView("doc_returnlist", "returnList", returnList);
	}

	// 리턴 전체 리스트
	@RequestMapping("doc_returnMain.do")
	public ModelAndView returnMain(int page, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.setAttribute("left", 10);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		String empSign = evo.getEmpSign();
		ListVO returnMain = documentService.returnMain(page, empNo, empSign);
		return new ModelAndView("doc_returnmain", "returnMain", returnMain);
	}

	// 결재중---------------------------------------------------

	// 내가 사인했는데 아직결재중인문서
	@RequestMapping("doc_waiting.do")
	public ModelAndView waitingList(int page, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		String empSign = evo.getEmpSign();
		ListVO waiting = documentService.waiting(page, empNo, empSign);
		return new ModelAndView("doc_waiting", "waiting", waiting);
	}

	// 내가쓴것중 결재중인문서
	@RequestMapping("doc_waitingMy.do")
	public ModelAndView myWaitingList(int page, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		ListVO waitingMy = documentService.waitingMy(page, empNo);
		return new ModelAndView("doc_waitingmy", "waitingMy", waitingMy);
	}

	// 결재중 메인 ( 나와관련된 모든 결재중문서)
	@RequestMapping("doc_waitingMain.do")
	public ModelAndView waitingMain(int page, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.setAttribute("left", 9);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		String empSign = evo.getEmpSign();
		int positionNo = evo.getPositionVO().getPositionNo();
		ListVO waitingMain = documentService.waitingMain(page, empNo, empSign,
				positionNo);
		return new ModelAndView("doc_waitingmain", "waitingMain", waitingMain);
	}

	// 결재대기중
	@RequestMapping("doc_waitingMySign.do")
	public ModelAndView waitingMySign(int page, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		int positionNo = evo.getPositionVO().getPositionNo();
		ListVO waitingMySign = documentService.waitingMySign(page,empNo,positionNo);
		return new ModelAndView("doc_waitingmysign", "waitingMySign",waitingMySign);
	}
	
	@RequestMapping("doc_waitingSubstitute.do")
	public ModelAndView waitingSubstitute(int page, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		int positionNo = evo.getPositionVO().getPositionNo();
		ListVO waitingSubstitute = documentService.waitingSubstitute(page,empNo,positionNo);
		return new ModelAndView("doc_waitingsubstitute", "waitingSubstitute",waitingSubstitute);
	}
	
	// -----------결재완료-----------------------------------------------

	// 내가 쓴 문서중 완료된것
	@RequestMapping("doc_completeMy.do")
	public ModelAndView completeMy(int page, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		ListVO completeMy = documentService.completeMy(page, empNo);
		return new ModelAndView("doc_completemy", "completeMy", completeMy);
	}

	// 내가결재했는데 완료된것
	@RequestMapping("doc_complete.do")
	public ModelAndView complete(int page, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		int positionNo = evo.getPositionVO().getPositionNo();
		ListVO complete = documentService.complete(page, positionNo);
		return new ModelAndView("doc_complete", "complete", complete);
	}

	// 내가 결재완료한것(사장)
	@RequestMapping("doc_completeSign.do")
	public ModelAndView completeSign(int page, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empSign = evo.getEmpSign();
		String empNo = evo.getEmpNo();
		int positionNo = evo.getPositionVO().getPositionNo();
		ListVO completeSign = documentService.completeSign(page, empNo,
				empSign, positionNo);
		return new ModelAndView("doc_completesign", "completeSign",
				completeSign);
	}

	// 내가관련된 완료목록 전체
	@RequestMapping("doc_completeMain.do")
	public ModelAndView completeMain(int page, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.setAttribute("left", 11);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		int positionNo = evo.getPositionVO().getPositionNo();
		String empSign = evo.getEmpSign();
		ListVO completeMain = documentService.completeMain(page, empNo,
				empSign, positionNo);
		return new ModelAndView("doc_completemain", "completeMain",
				completeMain);
	}

	// --------------------------반려
	// 검색-------------------------------------------------

	@RequestMapping("doc_returnMainSearch")
	public ModelAndView returnMainSearch(String data, int page,
			HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		String empSign = evo.getEmpSign();
		ListVO list = documentService.returnMainSearch(page, empNo, empSign,
				data);
		return new ModelAndView("doc_returnmainsearch", "returnMainSearchList",
				list);
	}

	@RequestMapping("doc_returnMySearch")
	public ModelAndView returnMySearch(String data, int page,
			HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		ListVO list = documentService.returnMySearch(page, empNo, data);
		return new ModelAndView("doc_returnmysearch", "returnMySearchList",
				list);
	}

	@RequestMapping("doc_returnSignSearch.do")
	public ModelAndView returnSignSearch(String data, int page,
			HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		String empSign = evo.getEmpSign();
		ListVO list = documentService.returnSignSearch(page, empNo, empSign,
				data);
		return new ModelAndView("doc_returnsignsearch", "returnSignSearchList",
				list);
	}

	@RequestMapping("doc_returnListSearch.do")
	public ModelAndView returnListSearch(String data, int page,
			HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		ListVO list = documentService.returnListSearch(page, empNo, data);
		return new ModelAndView("doc_returnlistsearch", "returnListSearchList",
				list);
	}

	// --------------------------완료
	// 검색-------------------------------------------------
	@RequestMapping("doc_completeSearch.do")
	public ModelAndView completeSearch(String data, int page,
			HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		int positionNo = evo.getPositionVO().getPositionNo();
		ListVO list = documentService.completeSearch(page, empNo, positionNo,
				data);
		return new ModelAndView("doc_completesearch", "completeSearchList",
				list);
	}

	@RequestMapping("doc_completeMainSearch.do")
	public ModelAndView completeMainSearch(String data, int page,
			HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		String empSign = evo.getEmpSign();
		int positionNo = evo.getPositionVO().getPositionNo();
		ListVO list = documentService.completeMainSearch(page, empNo, empSign,
				positionNo, data);
		return new ModelAndView("doc_completemainsearch",
				"completeMainSearchList", list);
	}

	@RequestMapping("doc_completeSignSearch.do")
	public ModelAndView completeSignSearch(String data, int page,
			HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		String empSign = evo.getEmpSign();
		int positionNo = evo.getPositionVO().getPositionNo();
		ListVO list = documentService.completeSignSearch(page, empSign, empNo,
				positionNo, data);

		return new ModelAndView("doc_completesignsearch",
				"completeSignSearchList", list);
	}

	@RequestMapping("doc_completeMySearch")
	public ModelAndView completeMySearch(String data, int page,
			HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		ListVO list = documentService.completeMySearch(page, empNo, data);
		return new ModelAndView("doc_completemysearch", "completeMySearchList",
				list);
	}

	// --------------------------결재중
	// 검색-------------------------------------------------

	// 내가 사인했는데 아직결재중인문서
	@RequestMapping("doc_waitingSearch.do")
	public ModelAndView waitingListSearch(int page, String data,
			HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		String empSign = evo.getEmpSign();
		ListVO list = documentService.waitingListSearch(page, empNo, empSign,
				data);
		return new ModelAndView("doc_waitingsearch", "waitingListSearchList",
				list);
	}

	// 내가쓴것중 결재중인문서
	@RequestMapping("doc_waitingMySearch.do")
	public ModelAndView myWaitingListSearch(int page, String data,
			HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		ListVO list = documentService.waitingMySearch(page, empNo, data);
		return new ModelAndView("doc_waitingmysearch", "waitingMySearchList",
				list);
	}

	// 결재중 메인 ( 나와관련된 모든 결재중문서)
	@RequestMapping("doc_waitingMainSearch.do")
	public ModelAndView waitingMainSearch(int page, String data,
			HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		String empSign = evo.getEmpSign();
		int positionNo = evo.getPositionVO().getPositionNo();
		ListVO list = documentService.waitingMainSearch(page, empNo, empSign,
				positionNo, data);
		return new ModelAndView("doc_waitingmainsearch",
				"waitingMainSearchList", list);
	}

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

		return new ModelAndView("doc_waitingmysignsearch",
				"waitingMySignSearchList", list);
	}

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
		session.setAttribute("left", 19);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		int deptNo = evo.getDepartmentVO().getDeptNo();
		int positionNo = evo.getPositionVO().getPositionNo();

		List<EmployeeVO> list = employeeService.findSubstitute(empNo, deptNo,
				positionNo);
		EmployeeVO mysub = employeeService.getMySubstitute(empNo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("sub", list);
		mv.addObject("mysub", mysub);
		mv.setViewName("doc_substitute");

		return mv;
	}

	@RequestMapping("doc_updateSubstitute.do")
	public String updateSubstitute(HttpServletRequest request,String subNo) {
		HttpSession session = request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		String empNo = evo.getEmpNo();
		System.out.println(subNo);
		employeeService.updateSubstitute(empNo, subNo);

		return "redirect:doc_setSubstitute.do";
	}

	
	
}
