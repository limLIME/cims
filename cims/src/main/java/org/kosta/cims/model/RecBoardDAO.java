package org.kosta.cims.model;

import java.util.List;

public interface RecBoardDAO {
	public abstract List<Object> getPostingList(int pageNo);
	public abstract int recTotalCount();
	public abstract RecommendVO recShowContent(int no);
	public abstract void recDelete(int no);
	public abstract void recUpdate(RecommendVO recommendVO);
	public abstract void recWriter(RecommendVO vo);
	public abstract void recCommentRegister(RecCommentVO commentVO);
	public abstract List<Object> recCommentList(int no);
	public abstract void deleteRecComment(int commentNo);


}
