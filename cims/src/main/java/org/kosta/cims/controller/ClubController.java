package org.kosta.cims.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.cims.model.ClubApplicantVO;
import org.kosta.cims.model.ClubBoardVO;
import org.kosta.cims.model.ClubMemberVO;
import org.kosta.cims.model.ClubVO;
import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.ListVO;
import org.kosta.cims.model.PagingBean;
import org.kosta.cims.service.ClubService;
import org.kosta.cims.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ClubController {
	@Resource
	private ClubService clubService;
	@Resource
	private EmployeeService service;

	 @RequestMapping("club_List.do")
		public ModelAndView showList(int pageNo, HttpServletRequest request){
		 	HttpSession session = request.getSession();
		 	EmployeeVO evo=(EmployeeVO) session.getAttribute("evo");
		 	String empNo=evo.getEmpNo();
		 	session.setAttribute("left",44);
		 	int check = clubService.checkClubCreate(empNo);
			List<Object> paging = clubService.getPostingList(pageNo);
			List<Object> paging2 = clubService.getPostingList2();
			System.out.println(paging);
			ModelAndView mv = new ModelAndView("club_clubList");
			int count = clubService.clubTotalCount();
			PagingBean pb = new PagingBean(count, pageNo);
			ListVO list = new ListVO(paging,pb);
			mv.addObject("list",list);
			mv.addObject("list2",paging2);
			mv.addObject("check", check);
			return mv;
		}
	 
	 @RequestMapping("club_showContent.do")
		public ModelAndView showContent(int no,HttpServletRequest request){
		 	HttpSession session = request.getSession();
		 	EmployeeVO evo = (EmployeeVO)session.getAttribute("evo");
		 	 ClubMemberVO cvo = new ClubMemberVO(no,evo);
			ClubVO vo = clubService.clubShowContent(no);	
			int check = clubService.clubCheck(cvo);
			ModelAndView mv = new ModelAndView("club_club_showContent");
			mv.addObject("check",check);
			mv.addObject("vo",vo);
			return mv;
		}
	 
	 @RequestMapping("club_writer.do")
		public String clubWrite(){
			return "club_clubWrite";
		}
	 
	 @RequestMapping("club_myclub.do")
	 public ModelAndView clubMyclub(HttpServletRequest request){
		 ClubVO cvo = new ClubVO();
		 HttpSession session = request.getSession();
		 EmployeeVO evo = (EmployeeVO)session.getAttribute("evo");
		 String empNo = evo.getEmpNo();
		 cvo = clubService.findClubNoByempNo(empNo);
		 int clubNo = cvo.getClubNo();		 
		 return new ModelAndView("redirect:club_showContent.do?no="+clubNo);
	 }
	 
	 @RequestMapping("club_writer_result.do")
	 	public String clubWriterResult(ClubVO vo, HttpServletRequest request){
		 HttpSession session = request.getSession();
		 EmployeeVO evo = (EmployeeVO)session.getAttribute("evo");
		 vo.setEmployeeVO(evo);
		 System.out.println(vo);
		 clubService.clubWrite(vo);
		 return "redirect:club_showContent.do?no="+vo.getClubNo();
	 }
	
	 @RequestMapping("club_update.do")
	 public ModelAndView clubUpdate(int no,  HttpServletRequest request){
		 HttpSession session = request.getSession();
		 EmployeeVO evo = (EmployeeVO)session.getAttribute("evo");
		 ClubVO vo = clubService.clubShowContent(no);
		 vo.setEmployeeVO(evo);
		 return new ModelAndView("club_clubUpdate","vo",vo);
	 }
	 
	 @RequestMapping("clubUpdate_result.do")
	 public String clubUpdateResult(ClubVO vo){
		 clubService.clubUpdate(vo);
		 return "redirect:club_showContent.do?no="+vo.getClubNo();
	 }
	 
	 @RequestMapping("club_delete.do")
	 public String clubDelete(int no){
		 clubService.clubDelete(no);
		 clubService.clubMemberDelete(no);
		 return "redirect:club_List.do?pageNo=1";
	 }
	 
	 @RequestMapping("club_approval.do")
	 public String clubApproval(int clubNo, String empNo){
		 clubService.clubApproval(clubNo);
		 EmployeeVO evo = service.findByNo(empNo);
		 ClubMemberVO cvo = new ClubMemberVO(clubNo,evo);
		 clubService.clubRegister(cvo);
		 return "redirect:mail_sendForm.do";
	 }
	 
	 @RequestMapping("club_reject.do")
	 public String clubReject(int clubNo){
		 clubService.clubReject(clubNo);
		 return "redirect:mail_sendForm.do";
	 }
	 
	 @RequestMapping("club_register.do")
	 public String clubRegister(String empNo, int clubNo,HttpServletRequest request){
		 HttpSession session = request.getSession(false);
		 EmployeeVO evo = (EmployeeVO)session.getAttribute("evo");
		 ClubMemberVO cvo = new ClubMemberVO(clubNo,evo);
		 clubService.clubRegister(cvo);
		 return "redirect:club_List.do?pageNo=1";
	 }

	   @RequestMapping("club_resign.do")
	   public String clubResign(int clubNo, HttpServletRequest request){
	      HttpSession session=request.getSession(false);
	      EmployeeVO evo =(EmployeeVO) session.getAttribute("evo");
	      ClubMemberVO cvo = new ClubMemberVO(clubNo,new EmployeeVO(evo.getEmpNo()));
	      clubService.clubResign(cvo);
	      return  "redirect:club_List.do?pageNo=1";
	   }
	   
		@RequestMapping("club_boardwriteform.do")
	public ModelAndView clubboardwriteform(HttpServletRequest request){
		HttpSession session=request.getSession(false);
		EmployeeVO evo =(EmployeeVO) session.getAttribute("evo");
		String empNo=evo.getEmpNo();
		List<ClubVO> clist = clubService.searchClubName(empNo);
		return new ModelAndView("club_boardwriteform","clubList",clist);
	}
	
	
	@RequestMapping(value="club_boardWrite.do", method=RequestMethod.POST)
	public ModelAndView clubBoardWrite(ClubBoardVO cbvo,String clubName, HttpServletRequest request){
		HttpSession session=request.getSession(false);
		EmployeeVO evo =(EmployeeVO) session.getAttribute("evo");
		String empNo=evo.getEmpNo();
		ClubVO cvo = new ClubVO();
		int clubNo = clubService.findClubByName(clubName);
		cvo.setClubNo(clubNo);
		cvo.setClubName(clubName);
		cbvo.setClubVO(cvo);
		clubService.registerClubBoard(cbvo);
		int cbNo = cbvo.getClubBoardNo();
		clubService.addApplicant(cbNo,empNo);
		return new ModelAndView("redirect:club_boardshowcontent.do?no="+cbNo);
	}
	
	
	@RequestMapping("club_boardshowcontent.do")
	public ModelAndView clubBoardshowcontent(int no,HttpServletRequest request){
		HttpSession session=request.getSession(false);
		EmployeeVO evo =(EmployeeVO) session.getAttribute("evo");
		String empNo=evo.getEmpNo();
		ModelAndView mv=new ModelAndView("club_boardshowcontent");
		ClubBoardVO cbvo=clubService.findClubBoardByNo(no);
		int clubNo = cbvo.getClubVO().getClubNo();
		List<ClubApplicantVO> list = clubService.applicantList(no);
		int count = clubService.applicantCount(no);
		clubService.updateApplicantCount(count,no);
		int appcheck = clubService.ApplicantCheck(no,empNo);
		int checkBoardWriter = clubService.checkBoardWriter(empNo,no,clubNo);
		if(checkBoardWriter == 1){
			mv.addObject("writerCheck", 1);			
		}else{
			mv.addObject("writerCheck", 0);
		}
		mv.addObject("detail", cbvo);
		mv.addObject("appList", list);
		mv.addObject("appCount", count);
		mv.addObject("appcheck", appcheck);
		return mv;
	}
	
	@RequestMapping("club_boardJoin.do")
	public ModelAndView clubBoardJoin(int no,HttpServletRequest request){
		HttpSession session=request.getSession(false);
		EmployeeVO evo =(EmployeeVO) session.getAttribute("evo");
		String empNo=evo.getEmpNo();
		clubService.addApplicant(no, empNo);	
		return new ModelAndView("redirect:club_boardshowcontent.do?no="+no);
	}
	
	@RequestMapping("club_boardJoinCancel.do")
	public ModelAndView clubBoardJoinCancel(int no,HttpServletRequest request){
		HttpSession session=request.getSession(false);
		EmployeeVO evo =(EmployeeVO) session.getAttribute("evo");
		String empNo=evo.getEmpNo();
		clubService.deleteApplicant(no, empNo);			
		return new ModelAndView("redirect:club_boardshowcontent.do?no="+no);
	}
	
	@RequestMapping("club_boardList.do")
	public ModelAndView clubBoardList(int page,HttpServletRequest request){
		ModelAndView mv = new ModelAndView("club_clubboardlist");
		HttpSession session=request.getSession(false);
		session.setAttribute("left", 45);
		EmployeeVO evo =(EmployeeVO) session.getAttribute("evo");
		String empNo=evo.getEmpNo();
		List<ClubVO> clist = clubService.searchClubName(empNo);
		ListVO clubBoardList = clubService.clubBoardList(page);
		mv.addObject("clubBoardList", clubBoardList);
		mv.addObject("clist", clist);
		return mv;
	}
	
	   @RequestMapping("club_boardUpdateForm.do")
	   public ModelAndView clubBoardUpdate(int boardNo, HttpServletRequest request){
	      ClubBoardVO cbvo=clubService.findClubBoardByNo(boardNo);
	      ModelAndView mv = new ModelAndView("club_clubBoardUpdate");
	      HttpSession session=request.getSession(false);
	      EmployeeVO evo =(EmployeeVO) session.getAttribute("evo");
	      String empNo=evo.getEmpNo();
	      List<ClubVO> clist = clubService.searchClubName(empNo);
	      mv.addObject("cbvo",cbvo);
	      mv.addObject("clubList",clist);
	      return mv;
	   }
	
	@RequestMapping(value="club_boardUpdate.do", method=RequestMethod.POST)
	public ModelAndView clubBoardUpdateForm(ClubBoardVO cbvo,String clubName){
		int clubNo = clubService.findClubByName(clubName);
		ClubVO cvo = new ClubVO();
		cvo.setClubNo(clubNo);
		cvo.setClubName(clubName);
		cbvo.setClubVO(cvo);
		clubService.clubBoardUpdate(cbvo);
		int no =cbvo.getClubBoardNo();
		return new ModelAndView("redirect:club_boardshowcontent.do?no="+no);
	}
	 @RequestMapping("club_boardDelete.do")
	   public String clubBoardDelete(int boardNo){
	      clubService.clubBoardDelete(boardNo);
	      return "redirect:club_boardList.do?page=1";
	   }
}



























