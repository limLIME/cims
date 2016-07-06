package org.kosta.cims.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.model.MailVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MailDAOImpl implements MailDAO {
	@Resource
	private SqlSessionTemplate template;
	
	
	/* (non-Javadoc)
	 * @see org.kosta.cims.model.MailDAO#getMailList(int)
	 */
	@Override
	public List<Object> getSendMailList(String empNo,int pageNo){
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("empNo", empNo);
		map.put("pageNo",""+pageNo);
		return template.selectList("mail.getSendMailList",map);
	}
	@Override
	public List<Object> getReceiveMailList(String empNo,int pageNo){
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("empNo", empNo);
		map.put("pageNo",""+pageNo);
		return template.selectList("mail.getReceiveMailList",map);
	}
	@Override
	public int totalSendMailContent(String empNo){
		return template.selectOne("mail.totalSendMailContent",empNo);
	}
	@Override
	public int totalReceiveMailContent(String empNo){
	
		return template.selectOne("mail.totalReceiveMailContent",empNo);
	}
	
	@Override
	public MailVO showMailContent(int no){
		return template.selectOne("mail.showMailContent",no);
	}
	public int checkMail(int no,String empNo){
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("no", ""+no);
		map.put("empNo", empNo);
		
		return template.update("mail.checkMail",map);
	}
	
	@Override
	public void sDeleteMail(int no){
		template.update("mail.sDeleteMail",no);
	}
	@Override
	public void rDeleteMail(int no){
		template.update("mail.rDeleteMail",no);
	}
	
	@Override
	public void sendMail(MailVO mailVO){
		System.out.println(mailVO);
		template.insert("mail.sendMail",mailVO);
	}
	
	@Override
	public Integer countMail(String empNo) {
		return template.selectOne("mail.countMail", empNo);
	}
	@Override
	public List<MailVO> getMyMailList(String empNo) {
		return template.selectList("mail.getMyMailList", empNo);
	}
}
