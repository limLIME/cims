package org.kosta.cims.service;

import java.util.List;

import javax.annotation.Resource;

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
}
