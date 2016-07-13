package org.kosta.cims.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.cims.model.BoardVO;
import org.kosta.cims.model.CommentVO;
import org.kosta.cims.model.EmployeeVO;
import org.kosta.cims.model.GoodVO;
import org.kosta.cims.model.ListVO;
import org.kosta.cims.model.PagingBean;
import org.kosta.cims.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class FreeBoardController {
	@Resource
	private BoardService boardService;
   @Resource(name="boardUploadPath")
   private String boardUploadPath;
	
	//write 폼으로 가기
	@RequestMapping("free_writer.do")
	public String write(){
		return "board_boardwrite";
	}
	
	//폼에서 글쓴후 등록
	@RequestMapping(value="free_writer_result.do", method=RequestMethod.POST)
	public ModelAndView writer(BoardVO vo, HttpSession session){
		EmployeeVO evo = (EmployeeVO)session.getAttribute("evo");
		vo.setEmployeeVO(evo);
		//이미지 업로드
		MultipartFile file  = vo.getUploadFile();
		if(file.isEmpty() == false){
			File uploadFile = new File(boardUploadPath+file.getOriginalFilename());
			try{
				file.transferTo(uploadFile);
			}catch (Exception e){
				e.printStackTrace();
			}
			vo.setBoardPath(file.getOriginalFilename());
		}else{
			vo.setBoardPath("1");
		}
		boardService.writer(vo);
		System.out.println(vo);
			return new ModelAndView("redirect:free_showContent.do?no="+vo.getBoardNo());
	}
	
	//보드리스트
	@RequestMapping("free_boardList.do")
	public ModelAndView showList(int pageNo,HttpServletRequest request){
		HttpSession session =request.getSession(false);
		session.setAttribute("left", 36);
		session.setAttribute("map", null);
		List<Object> paging = boardService.getPostingList(pageNo);	
		List<Object> lvo = boardService.popularList();
		ModelAndView mv = new ModelAndView("board_boardlist");
		int count = boardService.totalCount();
		PagingBean pb = new PagingBean(count, pageNo);
		ListVO list = new ListVO(paging,pb);
		mv.addObject("list",list);
		mv.addObject("popular",lvo);
		return mv;
	}
	@RequestMapping("free_BoardSearchList.do")
	public ModelAndView searchList(String search, String data,String searchVar,int pageNo,HttpServletRequest request){
		HttpSession session =request.getSession();
		if(searchVar.equals("")){
			session.setAttribute("map", null);
			return new ModelAndView("redirect:free_boardList.do?pageNo=1");
		}
		ModelAndView mv = new ModelAndView("board_boardlist");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("searchVar", searchVar);
		List<Object> lvo = boardService.popularList();
		List<Object> sList = null;
		int count = 0;
		if(search.equals("title")){
			sList = boardService.searchTitleList(searchVar,pageNo);
			count = boardService.totalTitleCount(searchVar);
		}else if(search.equals("content")){
			sList = boardService.searchContentList(searchVar,pageNo);
			count = boardService.totalContentCount(searchVar);
		}else if(search.equals("titleContent")){
			sList = boardService.searchTitleContentList(searchVar,pageNo);
			count = boardService.totalTitleContentCount(searchVar);
		}
		PagingBean pb = new PagingBean(count, pageNo);
		ListVO list = new ListVO(sList,pb);
		mv.addObject("list",list);
		mv.addObject("popular",lvo);
		mv.addObject("data",data);
		session.setAttribute("map", map);
		return mv;
	}
	
	//쇼컨텐트
	@RequestMapping("free_showContent.do")
	public ModelAndView showContent(int no){
		BoardVO vo = boardService.showContent(no);
		List<Object> list = boardService.commentList(no);
		ModelAndView mv = new ModelAndView("board_showContent");
		mv.addObject("vo",vo);
		mv.addObject("list",list);
		return mv;
	}
	
	//업데이트 폼으로가기
	@RequestMapping("free_update.do")
	public ModelAndView showUpdate(String no){
		BoardVO vo = boardService.showContent(Integer.parseInt(no));
		return new ModelAndView("board_boardUpdate","vo",vo);
	}
	
	//업데이트 하기
	@RequestMapping("free_update_result.do")
	public String update(BoardVO vo){
		BoardVO vo2 = boardService.showContent(vo.getBoardNo());
		MultipartFile file  = vo.getUploadFile();
		if(file.isEmpty()){
			vo.setBoardPath(vo2.getBoardPath());
		}else{
			File uploadFile = new File(boardUploadPath+file.getOriginalFilename());
			try{
				file.transferTo(uploadFile);
			}catch (Exception e){
				e.printStackTrace();
			}
			vo.setBoardPath(file.getOriginalFilename());
		}
		System.out.println(vo);
		boardService.update(vo);
		return("redirect:free_showContent.do?no="+vo.getBoardNo());
	}
	
	//삭제하기
	@RequestMapping("free_delete.do")
	public String delete(String no){
		boardService.delete(no);
		return("redirect:free_boardList.do?pageNo=1");
	}
	
	@RequestMapping("free_like.do")
	@ResponseBody
	public Object like(int boardNo, String empNo){
		GoodVO goodVO = new GoodVO(boardNo,empNo);
		int check = boardService.checkLike(goodVO);
		HashMap<String, String> map = new HashMap<String, String>();
		if(check == 0){
			boardService.likeUpdate(boardNo);
			boardService.like(boardNo, empNo);
			map.put("success", "1");
		}else{
			map.put("success", "0");
			//return "redirect:boardList.do?pageNo=1";
		}	
		return map;
	}
	
	@RequestMapping("free_board_comment.do")
	@ResponseBody
	public String boardComment(CommentVO commentVO, HttpServletRequest request){
		System.out.println("아아");
		HttpSession session = request.getSession();
		EmployeeVO evo = (EmployeeVO)session.getAttribute("evo");
		commentVO.setEmployeeVO(evo);
		boardService.commentRegister(commentVO);
		return "good";
	}
	
	@RequestMapping("free_delete_comment.do")
	public ModelAndView deleteComment(int commentNo, int boardNo){
		boardService.deleteComment(commentNo);
		return new ModelAndView("redirect:free_showContent.do?no="+boardNo);
	}
	@RequestMapping("free_update_comment.do")
	public ModelAndView updateComment(int commentNo, int boardNo){
		
		return new ModelAndView("");
	}
	
	
}

