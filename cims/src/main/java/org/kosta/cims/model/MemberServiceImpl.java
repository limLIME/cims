package org.kosta.cims.model;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;
	@Override
	public MemberVO findMemberById(String id){
		return memberDAO.findMemberById(id);
	}
	@Override
	public MemberVO login(MemberVO vo){
		return memberDAO.login(vo);
	}
	@Override
	public void updateMember(MemberVO vo) {
		memberDAO.updateMember(vo);			
	}	
	@Override
	public void registerMember(MemberVO vo) {		
		memberDAO.registerMember(vo);
	}	
	@Override
	public String idcheck(String id) {
		int count=memberDAO.idcheck(id);
		return (count==0) ? "ok":"fail"; 
	}
}






