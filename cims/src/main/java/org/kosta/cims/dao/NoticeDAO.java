package org.kosta.cims.dao;

import java.util.List;

import org.kosta.cims.model.NoticeVO;

public interface NoticeDAO {

	List<Object> getNoticeList(int pageNo);
	int totalContent();
	NoticeVO showContent(int no);
	void writeContent(NoticeVO nvo);
	void deleteContent(int no);
	void updateContent(NoticeVO nvo);
	List<Object> searchByTitle(String searchVar, int pageNo);
	List<Object> searchByContent(String searchVar, int pageNo);
	List<Object> searchByTitleContent(String searchVar, int pageNo);
	int totalContentByTitle(String searchVar);
	int totalContentByTitleContent();
	int totalContentBycontent(String searchVar);
	int totalContentByTitleContent(String searchVar);
	Integer countNot();
}