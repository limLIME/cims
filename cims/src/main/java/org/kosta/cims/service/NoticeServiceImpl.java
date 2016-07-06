package org.kosta.cims.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.dao.NoticeDAO;
import org.kosta.cims.model.NoticeVO;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Resource
	private NoticeDAO noticeDAO;
	
	/* (non-Javadoc)
	 * @see org.kosta.cims.model.NoticeService#getNoticeList(java.lang.String)
	 */
	@Override
	public List<Object> getNoticeList(int pageNo){
		return noticeDAO.getNoticeList(pageNo);
	}
	
	@Override
	public int totalContent(){
		return noticeDAO.totalContent();
	}
	
	@Override
	public NoticeVO showContent(int no){
		return noticeDAO.showContent(no);
	}
	
	@Override
	public void writeContent(NoticeVO nvo){
		noticeDAO.writeContent(nvo);
	}
	
	@Override
	public void deleteContent(int no){
		noticeDAO.deleteContent(no);
	}
	
	@Override
	public void updateContent(NoticeVO nvo){
		noticeDAO.updateContent(nvo);
	}
	
	@Override
	public List<Object> searchByTitle(String searchVar, int pageNo){
		return noticeDAO.searchByTitle(searchVar, pageNo);
	}
	
	@Override
	public int totalContentByTitle(String searchVar){
		return noticeDAO.totalContentByTitle(searchVar);
	}
	
	@Override
	public List<Object> searchByContent(String searchVar, int pageNo){
		return noticeDAO.searchByContent(searchVar, pageNo);
	}
	
	@Override
	public int totalContentBycontent(String searchVar){
		return noticeDAO.totalContentBycontent(searchVar);
	}
	
	@Override
	public List<Object> searchByTitleContent(String searchVar, int pageNo){
		return noticeDAO.searchByTitleContent(searchVar, pageNo);
	}
	
	@Override
	public int totalContentByTitleContent(String searchVar){
		return noticeDAO.totalContentByTitleContent(searchVar);
	}

	@Override
	public Integer countNot() {
		return noticeDAO.countNot();
	}
}
