package org.kosta.cims.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.dao.RecBoardDAO;
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
	
	@Override
	public List<Object> searchTitleList(String searchVar, int pageNo) {
		// TODO Auto-generated method stub
		return recBoardDAO.searchTitleList(searchVar, pageNo);
	}
	public List<Object> searchContentList(String searchVar, int pageNo) {
		// TODO Auto-generated method stub
		return recBoardDAO.searchContentList(searchVar, pageNo);
	}
	@Override
	public List<Object> searchTitleContentList(String searchVar, int pageNo) {
		// TODO Auto-generated method stub
		return recBoardDAO.searchTitleContentList(searchVar, pageNo);
	}

	public int totalTitleCount(String searchVar) {
		// TODO Auto-generated method stub
		return recBoardDAO.totalTitleCount(searchVar);
	}
	public int totalContentCount(String searchVar) {
		// TODO Auto-generated method stub
		return recBoardDAO.totalContentCount(searchVar);
	}
	@Override
	public int totalTitleContentCount(String searchVar) {
		// TODO Auto-generated method stub
		return recBoardDAO.totalTitleContentCount(searchVar);
	}

}
