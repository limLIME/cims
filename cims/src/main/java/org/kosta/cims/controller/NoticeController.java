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
import org.kosta.cims.model.NoticeVO;
import org.kosta.cims.model.PagingBean;
import org.kosta.cims.service.NoticeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {
	@Resource
	private NoticeService noticeService;
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping("notice_notice.do")
	public ModelAndView getNoticeList(int pageNo){
		List<Object> nList = noticeService.getNoticeList(pageNo); 
		int totalContent = noticeService.totalContent();
		PagingBean pb = new PagingBean(totalContent,pageNo);
		ListVO list =new ListVO(nList,pb);
		return new ModelAndView("notice_notice","lvo",list);
	}	
	
	@RequestMapping("notice_showContent.do")
	public ModelAndView showContent(int no){
		NoticeVO nvo = noticeService.showContent(no);
		//System.out.println(nvo);
		return new ModelAndView("notice_notice_showContent","nvo",nvo);
	}
	
	@RequestMapping("notice_write.do")
	public String write(){
		return "notice_write";
	}
	
	@RequestMapping("notice_writeContent.do")
	public ModelAndView writeContent(NoticeVO nvo,HttpServletRequest request){
		HttpSession session = request.getSession();
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		nvo.setEmployeeVO(evo);
		MultipartFile file = nvo.getFilePath(); // 파일
		//System.out.println(file.isEmpty()); // 업로드한 파일이 있는지 확인
		//service.registerProduct(name);
		if(file.isEmpty()==false){
			//System.out.println("파일명 : " +file.getOriginalFilename()); //업로드 파일명 있으면 출력
			File uploadFile = new File(uploadPath+file.getOriginalFilename());
			//uploadpath 끝에 \\가 붙어있어서 하위 경로 적용됨
			try {
				file.transferTo(uploadFile); // 실제 디렉토리로 파일을 저장한다.
				nvo.setNoticePath(file.getOriginalFilename());
			} catch (IllegalStateException | IOException e) { 
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			nvo.setNoticePath("1");
		}
		noticeService.writeContent(nvo);
		return new ModelAndView("redirect:notice_showContent.do?no="+nvo.getNoticeNo());
	}

	@RequestMapping("notice_deleteContent.do")
	public ModelAndView deleteContent(int no){
		noticeService.deleteContent(no);
		return new ModelAndView("redirect:notice.do?pageNo=1");
	}
	
	@RequestMapping("notice_update.do")
	public ModelAndView update(int no){
		NoticeVO nvo = noticeService.showContent(no);
		return new ModelAndView("notice_update","nvo",nvo);	
	}
	
	@RequestMapping("notice_updateContent.do")
	public ModelAndView updateContent(NoticeVO nvo, HttpServletRequest request){
		HttpSession session = request.getSession();
		EmployeeVO evo = (EmployeeVO) session.getAttribute("evo");
		nvo.setEmployeeVO(evo);
		noticeService.updateContent(nvo);
		return new ModelAndView("notice_updateContent_result","nvo",nvo);	
	}
	
	// 파일 다운로드를 위한 메서드
		@RequestMapping("notice_fileDownload.do")
		public ModelAndView fileDownload(String fileName){
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("path", uploadPath);
			return new ModelAndView("downloadView",map);
		}
}









