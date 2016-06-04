package org.kosta.cims.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource
	private SqlSessionTemplate template;
	@Override
	public MemberVO findMemberById(String id){
		return template.selectOne("member.findMemberById",id);
	}
	@Override
	public MemberVO login(MemberVO vo){
		return (MemberVO) template.selectOne("member.login",vo);			
	}	
	@Override
	public void updateMember(MemberVO vo) {
		template.update("member.updateMember",vo);			
	}	
	@Override
	public void registerMember(MemberVO vo) {
		template.insert("member.registerMember",vo);			
	}
	@Override
	public int idcheck(String id) {
		return template.selectOne("member.idcheck",id);				
	}
}








