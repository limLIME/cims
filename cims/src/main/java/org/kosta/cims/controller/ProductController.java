package org.kosta.cims.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.annotation.Resource;

import org.kosta.cims.model.ProductService;
import org.kosta.cims.model.ProductVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {
	@Resource
	ProductService service;
	
	//upload할 경로를 스프링 컨테이너로부터 주입받는다. (유지보수성 때문에 함)
	@Resource(name="uploadPath")
	private String uploadPath;
	/**
	 * 상품등록화면을 제공하는 메소드
	 * @return
	 */
	/*@RequestMapping("product_register.do")
	public String registerProductView(){
		System.out.println("으앙쥬금");
		return "product_registerProduct";
	}	 */
	/**
	 * 파일 업로드 구현
	 * @param name
	 * @return
	 */
	@RequestMapping(value = "product_reg.do", method=RequestMethod.POST)
	public ModelAndView productReg(ProductVO vo){
		System.out.println(vo.toString());
		MultipartFile file = vo.getUploadFile(); // 파일
		//System.out.println(file.isEmpty()); // 업로드한 파일이 있는지 확인
		//service.registerProduct(name);
		if(file.isEmpty()==false){
			//System.out.println("파일명 : " +file.getOriginalFilename()); //업로드 파일명 있으면 출력
			File uploadFile = new File(uploadPath+file.getOriginalFilename());
			//uploadpath 끝에 \\가 붙어있어서 하위 경로 적용됨
			try {
				file.transferTo(uploadFile); // 실제 디렉토리로 파일을 저장한다.
				System.out.println(uploadPath +" 에 파일 업로드 완료");
				System.out.println(file.getOriginalFilename());
			} catch (IllegalStateException | IOException e) { 
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("product_registerProduct_result");
		mv.addObject("fileName", file.getOriginalFilename());
		return mv;
	}
	//파일 다운로드를 위한 메서드
	@RequestMapping("fileDownload.do")
	public ModelAndView fileDownload(String fileName){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("path", uploadPath);
		return new ModelAndView("downloadView", map);
	}
}
