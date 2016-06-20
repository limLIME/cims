package org.kosta.cims.controller;



import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.cims.model.DocumentVO;
import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.ListVO;
import org.kosta.cims.service.DocumentService;
import org.kosta.cims.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DocumentController {
	@Resource
	private DocumentService documentService;

	@Resource
	private EmployeeService employeeService;
	
	@Resource(name="documentPath")
	private String documentPath;

	@Resource(name="signPath")
	private String signPath;
	
	@RequestMapping("doc_showdocument.do")
	public ModelAndView showdocument(int docNo,HttpServletRequest request){
		DocumentVO dvo= documentService.showdocument(docNo);
		System.out.println(dvo);
		HttpSession session=request.getSession(false);
		EmployeeVO evo=(EmployeeVO)session.getAttribute("evo");
		//나의 상위 결재자를 찾기위해선 나의 부서와 나의 직책번호가 필요함
		List<EmployeeVO> list=employeeService.findApprover(evo.getDepartmentVO().getDeptNo(),evo.getPositionVO().getPositionNo());
		ModelAndView mv =new ModelAndView();
		mv.addObject("dvo",dvo);
		mv.addObject("list",list);
		mv.setViewName("doc_showdocument");
		return mv;
	}
	
	
	@RequestMapping("doc_writeForm.do")
	public ModelAndView docWriteForm(HttpServletRequest request){
		HttpSession session=request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		
		List<EmployeeVO> list=employeeService.findApprover(evo.getDepartmentVO().getDeptNo(),evo.getPositionVO().getPositionNo());
		ModelAndView mv =new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("doc_write");
		
		return mv;
	}
	
	@RequestMapping("doc_write.do")
	public ModelAndView docWrite(HttpServletRequest request,DocumentVO dvo){
		HttpSession session=request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		
		MultipartFile file =dvo.getMultipartFile() ; // 파일
	        if(file.isEmpty()==false){
	              File uploadFile = new File(documentPath+file.getOriginalFilename());
	         try {
	            file.transferTo(uploadFile); // 실제 디렉토리로 파일을 저장한다
	            System.out.println(documentPath+"에 파일업로드");
	            dvo.setPath(file.getOriginalFilename());
	         } catch (IllegalStateException | IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }	
	      }else{
	          dvo.setPath("1");
	      }
		dvo.setEmployeeVO(evo);
		documentService.write(dvo);

		  return new ModelAndView("redirect:doc_showdocument.do?docNo="+dvo.getDocNo());
	}
	
	//파일 다운로드를 위한 메서드 
	@RequestMapping("fileDownload.do")
	public ModelAndView fileDownload(String fileName){
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("path", documentPath);
		return new ModelAndView("downloadView",map);
	}


	@RequestMapping("doc_mainList.do")
	public ModelAndView mainList(int page){
		ListVO mainList = documentService.mainList(page);
		return new ModelAndView("doc_main","mainList",mainList);
	}
	
	
	@RequestMapping("doc_return.do")
	public ModelAndView docReturn(int docNo){
		documentService.docReturn(docNo);
		return new ModelAndView("redirect:doc_mainList.do?page=1");
	}
	
	@RequestMapping("doc_sign.do")
	public ModelAndView docSign(HttpServletRequest request,int docNo,String approver){
		HttpSession session=request.getSession(false);
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");

		if(evo!=null&&evo.getPositionVO().getPositionNo()==5){
			documentService.docSign(approver,docNo,evo.getPositionVO().getPositionNo(),evo.getEmpSign());
			documentService.docEnd(docNo);//마감 =결재완료
		}else{
				documentService.docSign(approver,docNo,evo.getPositionVO().getPositionNo(),evo.getEmpSign());
		}
		
		return new ModelAndView("redirect:doc_mainList.do?page=1");
	}
	

	
	  
	   
	   @RequestMapping("doc_myDocumentList.do")
	   public ModelAndView myDocumentList(int page, HttpServletRequest request){
			HttpSession session = request.getSession(false);
			EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
			  int empNo = Integer.parseInt(evo.getEmpNo());
	      ListVO myDocumentList = documentService.myDocumentList(page,empNo);
	      return new ModelAndView("doc_mydocument","mydocumentList",myDocumentList);
	   }
	 //반려--------------------------------------------------
	      //내가 쓴 공문중 반려된 리스트    
	      @RequestMapping("doc_returnMy.do")
	      public ModelAndView returnMy(int page, HttpServletRequest request){
	    	  HttpSession session = request.getSession(false);
				EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
				  int empNo = Integer.parseInt(evo.getEmpNo());
	         ListVO returnMy = documentService.returnMy(page,empNo);
	         return new ModelAndView("doc_returnmy","returnMy",returnMy);
	      }
	      //내가 반려 시킨 공문 리스트
	      @RequestMapping("doc_returnSign.do")
	      public ModelAndView returnSign(int page, HttpServletRequest request){
	    	  HttpSession session = request.getSession(false);
				EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
				  int empNo = Integer.parseInt(evo.getEmpNo());
	         ListVO returnSign = documentService.returnSign(page,empNo);
	         return new ModelAndView("doc_returnsign","returnSign",returnSign);
	      }   
	      //반려된 공문중 내가 관련된 리스트       
	      @RequestMapping("doc_returnList.do")
	      public ModelAndView returnList(int page, HttpServletRequest request){
	         HttpSession session = request.getSession(false);
	         EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
	         int empNo = Integer.parseInt(evo.getEmpNo());
	         String empSign=evo.getEmpSign();
	         int positionNo=evo.getPositionVO().getPositionNo();
	         ListVO returnList= documentService.returnList(page,empNo,empSign,positionNo);
	         
	         return new ModelAndView("doc_returnlist","returnList",returnList);
	      }
	      //리턴 전체 리스트  
	      @RequestMapping("doc_returnMain.do")
	      public ModelAndView returnMain(int page, HttpServletRequest request){
	         HttpSession session = request.getSession(false);
	         EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
	         int empNo = Integer.parseInt(evo.getEmpNo());
	         String empSign=evo.getEmpSign();
	         int positionNo=evo.getPositionVO().getPositionNo();
	         ListVO returnMain= documentService.returnMain(page,empNo,empSign,positionNo);
	         
	         return new ModelAndView("doc_returnmain","returnMain",returnMain);
	      }
	   
	   
	   
	   //결재중---------------------------------------------------
	  
	   // 내가 사인했는데 아직결재중인문서
	   @RequestMapping("doc_waiting.do")
	   public ModelAndView waitingList(int page, HttpServletRequest request){
		   HttpSession session = request.getSession(false);
		   EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		   int empNo = Integer.parseInt(evo.getEmpNo());
		   String empSign=evo.getEmpSign();
		   int positionNo=evo.getPositionVO().getPositionNo();
		   ListVO waiting = documentService.waiting(page,empNo,empSign,positionNo);
		   return new ModelAndView("doc_waiting","waiting",waiting);
	   }
	   //내가쓴것중 결재중인문서
	   @RequestMapping("doc_waitingMy.do")
	   public ModelAndView myWaitingList(int page, HttpServletRequest request){
		   HttpSession session = request.getSession(false);
			EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
			  int empNo = Integer.parseInt(evo.getEmpNo());
	      ListVO waitingMy = documentService.waitingMy(page,empNo);
	      return new ModelAndView("doc_waitingmy","waitingMy",waitingMy);
	   }
	   //결재중 메인 ( 나와관련된 모든 결재중문서)
	   @RequestMapping("doc_waitingMain.do")
	   public ModelAndView waitingMain(int page, HttpServletRequest request){
		   HttpSession session = request.getSession(false);
		   EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		   int empNo = Integer.parseInt(evo.getEmpNo());
		   String empSign=evo.getEmpSign();
		   int positionNo=evo.getPositionVO().getPositionNo();
	      ListVO waitingMain = documentService.waitingMain(page, empNo, empSign, positionNo);
	      return new ModelAndView("doc_waitingmain","waitingMain",waitingMain);
	   }
	  //결재대기중
	   @RequestMapping("doc_waitingMySign.do")
	   public ModelAndView waitingMySign(int page, HttpServletRequest request){
	         HttpSession session=request.getSession(false);
	         EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
	         int empNo = Integer.parseInt(evo.getEmpNo());
	         String empSign=evo.getEmpSign();
	         ListVO waitingMySign= documentService.waitingMySign(page,empNo,empSign);
	         
	         return new ModelAndView("doc_waitingmysign","waitingMySign",waitingMySign);
	      }
	  
	
	   
	 
	   
	 
	 //-----------결재완료-----------------------------------------------  
	   
	   // 내가 쓴 문서중 완료된것
	   @RequestMapping("doc_completeMy.do")
	   public ModelAndView completeMy(int page, HttpServletRequest request){
		   HttpSession session = request.getSession(false);
			EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
			  int empNo = Integer.parseInt(evo.getEmpNo());
	      ListVO completeMy = documentService.completeMy(page,empNo);
	      return new ModelAndView("doc_completemy","completeMy",completeMy);
	   }
	   //내가결재했는데  완료된것
	   @RequestMapping("doc_complete.do")
	   public ModelAndView complete(int page, HttpServletRequest request){
		   HttpSession session = request.getSession(false);
		   EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		   int empNo = Integer.parseInt(evo.getEmpNo());
		   String empSign=evo.getEmpSign();
		   int positionNo=evo.getPositionVO().getPositionNo();
		   ListVO complete = documentService.complete(page,empNo,empSign,positionNo);
		   return new ModelAndView("doc_complete","complete",complete);
	   }
	   //내가 결재완료한것(사장)
	   @RequestMapping("doc_completeSign.do")
	   public ModelAndView completeSign(int page, HttpServletRequest request){
		   HttpSession session = request.getSession(false);
		   EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		   int empNo = Integer.parseInt(evo.getEmpNo());
		   String empSign=evo.getEmpSign();
		   int positionNo=evo.getPositionVO().getPositionNo();
		   ListVO completeSign = documentService.completeSign(page,empSign,empNo,positionNo);
		   return new ModelAndView("doc_completesign","completeSign",completeSign);
	   }
	   //내가관련된 완료목록 전체
	   @RequestMapping("doc_completeMain.do")
	   public ModelAndView completeMain(int page, HttpServletRequest request){
		   HttpSession session = request.getSession(false);
		   EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		   int empNo = Integer.parseInt(evo.getEmpNo());
		   String empSign=evo.getEmpSign();
		   int positionNo=evo.getPositionVO().getPositionNo();
		   ListVO completeMain = documentService.completeMain(page,empNo,empSign,positionNo);
		   return new ModelAndView("doc_completemain","completeMain",completeMain);
	   }
	   
	   
	   
	   
	  
}







