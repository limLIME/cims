package org.kosta.cims.model;

public interface MemberDAO {

	public abstract MemberVO findMemberById(String id);

	MemberVO login(MemberVO vo);

	void updateMember(MemberVO vo);

	void registerMember(MemberVO vo);

	int idcheck(String id);

	

}