package org.kosta.cims.model;

public interface MemberService {

	public abstract MemberVO findMemberById(String id);

	MemberVO login(MemberVO vo);

	void updateMember(MemberVO vo);

	void registerMember(MemberVO vo);

	String idcheck(String id);

}