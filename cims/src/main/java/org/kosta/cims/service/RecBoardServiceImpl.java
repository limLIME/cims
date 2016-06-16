package org.kosta.cims.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.model.CommentVO;
import org.kosta.cims.model.RecBoardDAO;
import org.kosta.cims.model.RecCommentVO;
import org.kosta.cims.model.RecommendVO;
import org.springframework.stereotype.Service;

@Service
public class RecBoardServiceImpl implements RecBoardService{
	@Resource
	RecBoardDAO recBoardDAO;

	@Override
	public List<Object> getPostingList(int pageNo) {
		// TODO Auto-generated method stub
		return recBoardDAO.getPostingList(pageNo);
	}

	@Override
	public int recTotalCount() {
		// TODO Auto-generated method stub
		return recBoardDAO.recTotalCount();
	}

	@Override
	public RecommendVO recShowContent(int no) {
		// TODO Auto-generated method stub
		return recBoardDAO.recShowContent(no);
	}

	@Override
	public void recDelete(int no) {
		recBoardDAO.recDelete(no);
		
	}

	@Override
	public void recUpdate(RecommendVO recommendVO) {
		recBoardDAO.recUpdate(recommendVO);
		
	}

	@Override
	public void recWriter(RecommendVO vo) {
		recBoardDAO.recWriter(vo);
		
	}

	@Override
	public void recCommentRegister(RecCommentVO commentVO) {
		recBoardDAO.recCommentRegister(commentVO);
		
	}

	@Override
	public List<Object> recCommentList(int no) {
		return recBoardDAO.recCommentList(no);
	}

	@Override
	public void deleteRecComment(int commentNo) {
		recBoardDAO.deleteRecComment(commentNo);
		
	}


}
