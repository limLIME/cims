package org.kosta.cims.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.ListVO;
import org.kosta.cims.model.PagingBean;
import org.kosta.cims.model.RecCommentVO;
import org.kosta.cims.model.RecommendVO;
import org.kosta.cims.service.RecBoardService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RecBoardController {
	@Resource
	RecBoardService service;
	
	 @Resource(name="boardUploadPath")
	 private String uploadPath;
	 
	 @RequestMapping("rec_boardList.do")
		public ModelAndView showList(int pageNo,HttpServletRequest request){
	  	   HttpSession session =request.getSession(false);
	  	   session.setAttribute("left", 37);
	     	 session.setAttribute("map", null);
			List<Object> paging = service.getPostingList(pageNo);
			ModelAndView mv = new ModelAndView("rec_rec_boardList");
			int count = service.recTotalCount();
			PagingBean pb = new PagingBean(count, pageNo);
			ListVO list = new ListVO(paging,pb);
			mv.addObject("list",list);
			return mv;
		}
	 
	 @RequestMapping("rec_BoardSearchList.do")
		public ModelAndView searchList(String search,String data, String searchVar,int pageNo,HttpServletRequest request){
		 	HttpSession session =request.getSession();
			if(searchVar.equals("")){
				session.setAttribute("map", null);
				return new ModelAndView("redirect:rec_boardList.do?pageNo=1");
			}
			ModelAndView mv = new ModelAndView("rec_rec_boardList");
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("search", search);
			map.put("searchVar", searchVar);
			List<Object> sList = null;
			int count = 0;
			if(search.equals("title")){
				sList = service.searchTitleList(searchVar,pageNo);
				count = service.totalTitleCount(searchVar);
			}else if(search.equals("content")){
				sList = service.searchContentList(searchVar,pageNo);
				count = service.totalContentCount(searchVar);
			}else if(search.equals("titleContent")){
				sList = service.searchTitleContentList(searchVar,pageNo);
				count = service.totalTitleContentCount(searchVar);
			}
			PagingBean pb = new PagingBean(count, pageNo);
			ListVO list = new ListVO(sList,pb);
			mv.addObject("list",list);
			mv.addObject("data",data);
			session.setAttribute("map", map);
			return mv;
		}
	 
	 @RequestMapping("rec_showContent.do")
	 public ModelAndView recShowContent(int no){
			RecommendVO vo = service.recShowContent(no);
			List<Object> list = service.recCommentList(no);
			ModelAndView mv = new ModelAndView("rec_rec_showContent");
			mv.addObject("vo",vo);
			mv.addObject("list",list);
			return mv;
	 }
	 
	 @RequestMapping("rec_delete.do")
	 public String recDelete(int no){
		 service.recDelete(no);
		 return("redirect:rec_boardList.do?pageNo=1");
	 }
	 
	 @RequestMapping("rec_update.do")
		public ModelAndView recUpdate(int no){
			RecommendVO vo = service.recShowContent(no);
			return new ModelAndView("rec_rec_update","vo",vo);
		}
	 @RequestMapping("rec_updateResult.do")
	 public String recUpdateResult(RecommendVO recommendVO){
		 RecommendVO vo = service.recShowContent(recommendVO.getRecNo());
		 MultipartFile file  = recommendVO.getRecUploadFile();
		 if(file.isEmpty()){
		
			 recommendVO.setRecPath(vo.getRecPath());
		 }else{
			 File uploadFile = new File(uploadPath+file.getOriginalFilename());
				try{
					file.transferTo(uploadFile);
				}catch (Exception e){
					e.printStackTrace();
				}
			 recommendVO.setRecPath(file.getOriginalFilename());
		 }
		 service.recUpdate(recommendVO);
			return("redirect:rec_showContent.do?no="+recommendVO.getRecNo());
	 }
	 
	 @RequestMapping("rec_writer.do")
		public String write(){
			return "rec_rec_write";
		}
	 
	 @RequestMapping("rec_writeResult.do")
		public ModelAndView recWriterResult(RecommendVO vo, HttpSession session){
		 EmployeeVO evo = (EmployeeVO)session.getAttribute("evo");
			vo.setEmployeeVO(evo);
			//이미지 업로드
			MultipartFile file  = vo.getRecUploadFile();
			if(file.isEmpty() == false){
				File uploadFile = new File(uploadPath+file.getOriginalFilename());
				try{
					file.transferTo(uploadFile);
				}catch (Exception e){
					e.printStackTrace();
				}
				vo.setRecPath(file.getOriginalFilename());
			}else{
				vo.setRecPath("1");
			}
			service.recWriter(vo);
				return new ModelAndView("redirect:rec_showContent.do?no="+vo.getRecNo());
		}
	 
	 @RequestMapping("rec_comment.do")
	 @ResponseBody
		public String recComment(RecCommentVO commentVO, HttpServletRequest request){
		 	HttpSession session = request.getSession();
			EmployeeVO evo = (EmployeeVO)session.getAttribute("evo");
			commentVO.setEmployeeVO(evo);
			service.recCommentRegister(commentVO);
			return "good";
		}
	 
	 @RequestMapping("rec_deleteComment.do")
		public ModelAndView deleteComment(int commentNo, int recNo){
			service.deleteRecComment(commentNo);
			return new ModelAndView("redirect:rec_showContent.do?no="+recNo);
		}
	 
}
