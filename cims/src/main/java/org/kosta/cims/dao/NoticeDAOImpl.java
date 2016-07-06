package org.kosta.cims.dao;

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
	
	@Override
	public List<Object> searchByTitle(String searchVar, int pageNo){
		System.out.println(searchVar);
		System.out.println(pageNo);
		NoticeVO nvo = new NoticeVO(searchVar, pageNo);
		return template.selectList("notice.searchByTitle",nvo);
	}
	
	@Override
	public int totalContentByTitle(String searchVar){
		return template.selectOne("notice.totalContentByTitle",searchVar);
	}
	
	@Override
	public List<Object> searchByContent(String searchVar, int pageNo){
		NoticeVO nvo = new NoticeVO(searchVar, pageNo);
		return template.selectList("notice.searchByContent",nvo);
	}
	
	@Override
	public int totalContentBycontent(String searchVar){
		return template.selectOne("notice.totalContentBycontent",searchVar);
	}
	
	@Override
	public List<Object> searchByTitleContent(String searchVar, int pageNo){
		NoticeVO nvo = new NoticeVO(searchVar,searchVar,pageNo);
		return template.selectList("notice.searchByTitleContent",nvo);
	}
	
	@Override
	public int totalContentByTitleContent(String searchVar){
		return template.selectOne("notice.totalContentByTitleContent",searchVar);
	}

	@Override
	public int totalContentByTitleContent() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Integer countNot() {
		return template.selectOne("notice.countNot");
	}
	
}
