package org.kosta.cims.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.model.NoticeVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	@Resource
	private SqlSessionTemplate template;
	
	/* (non-Javadoc)
	 * @see org.kosta.cims.model.NoticeDAO#getNoticeList(java.lang.String)
	 */
	@Override
	public List<Object> getNoticeList(int pageNo){
		return template.selectList("notice.getNoticeList", pageNo);
	}
	
	@Override
	public int totalContent(){
		return template.selectOne("notice.totalContent");
	}
	
	@Override
	public NoticeVO showContent(int no){
		return template.selectOne("notice.showContent",no);
	}
	
	@Override
	public void writeContent(NoticeVO nvo){
		template.insert("notice.writeContent",nvo);
	}
	
	@Override
	public void deleteContent(int no){
		template.delete("notice.deleteContent",no);
	}
	
	@Override
	public void updateContent(NoticeVO nvo){
		template.update("notice.updateContent",nvo);
	}
}
