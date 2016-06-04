package org.kosta.cims.controller;

import javax.annotation.Resource;

import org.kosta.cims.model.MemberService;
import org.kosta.cims.model.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;
	@RequestMapping("findMemberById.do")
	public ModelAndView findMemberById(String id){
		System.out.println(id);
		MemberVO vo=memberService.findMemberById(id);
		System.out.println(vo);
		return new ModelAndView("member_findbyid_result","vo",vo);
	}
}







