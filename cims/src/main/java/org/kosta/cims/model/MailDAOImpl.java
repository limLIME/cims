package org.kosta.cims.model;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

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
	
	@Override
	public void deleteMail(int no){
		template.delete("mail.deleteMail",no);
	}
	
	@Override
	public void sendMail(MailVO mailVO){
		template.insert("mail.sendMail",mailVO);
	}
}
