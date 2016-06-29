package org.kosta.cims.service;

import java.util.List;

import org.kosta.cims.model.CommentVO;
import org.kosta.cims.model.RecCommentVO;
import org.kosta.cims.model.RecommendVO;

public interface RecBoardService {
	public abstract List<Object> getPostingList(int pageNo);

	public abstract int recTotalCount();

	public abstract RecommendVO recShowContent(int no);

	public abstract void recDelete(int no);

	public abstract void recUpdate(RecommendVO recommendVO);

	public abstract void recWriter(RecommendVO vo);

	public abstract void recCommentRegister(RecCommentVO commentVO);

	public abstract List<Object> recCommentList(int no);

	public abstract void deleteRecComment(int commentNo);
	
	public abstract List<Object> searchTitleList(String searchVar, int pageNo);
	public abstract List<Object> searchContentList(String searchVar, int pageNo);
	public abstract List<Object> searchTitleContentList(String searchVar,
			int pageNo);
	public abstract int totalTitleCount(String searchVar);
	public abstract int totalContentCount(String searchVar);
	public abstract int totalTitleContentCount(String searchVar);

	
}
