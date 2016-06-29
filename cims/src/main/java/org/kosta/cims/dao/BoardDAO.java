package org.kosta.cims.dao;

import java.util.List;

import org.kosta.cims.model.BoardVO;
import org.kosta.cims.model.CommentVO;
import org.kosta.cims.model.GoodVO;

public interface BoardDAO {
	public abstract void writer(BoardVO vo);
	public abstract List<Object> getPostingList(int pageNo);
	public abstract BoardVO showContent(int no);
	public abstract int totalCount();
	public abstract void update(BoardVO vo);
	public abstract void delete(String no);
	public abstract void like(int boardNo, String empNo);
	public abstract void likeUpdate(int boardNo);
	public abstract int checkLike(GoodVO goodVO);
	public abstract List<Object> popularList();
	public abstract List<Object> commentList(int boardNo);
	public abstract void commentRegister(CommentVO commentVO);
	public abstract void deleteComment(int commentNo);
	public abstract void updateComment(int commentNo);
	public abstract List<Object> searchTitleList(String searchVar, int pageNo);
	public abstract List<Object> searchContentList(String searchVar, int pageNo);
	public abstract List<Object> searchTitleContentList(String searchVar,
			int pageNo);
	public abstract int totalTitleCount(String searchVar);
	public abstract int totalContentCount(String searchVar);
	public abstract int totalTitleContentCount(String searchVar);
	
}
