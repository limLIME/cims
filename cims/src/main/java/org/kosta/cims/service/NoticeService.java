package org.kosta.cims.service;

import java.util.List;

import org.kosta.cims.model.NoticeVO;

public interface NoticeService {

	public abstract List<Object> getNoticeList(int pageNo);
	int totalContent();
	NoticeVO showContent(int no);
	void writeContent(NoticeVO nvo);
	void deleteContent(int no);
	void updateContent(NoticeVO nvo);
	List<Object> searchByTitle(String searchVar, int pageNo);
	List<Object> searchByContent(String searchVar, int pageNo);
	List<Object> searchByTitleContent(String searchVar, int pageNo);
	int totalContentByTitle(String searchVar);
	int totalContentBycontent(String searchVar);
	int totalContentByTitleContent(String searchVar);

}