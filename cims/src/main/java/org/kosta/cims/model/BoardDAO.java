package org.kosta.cims.model;

import java.util.List;

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
	
}
