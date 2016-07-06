package org.kosta.cims.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.dao.BoardDAO;
import org.kosta.cims.model.BoardVO;
import org.kosta.cims.model.CommentVO;
import org.kosta.cims.model.GoodVO;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{
	@Resource
	private BoardDAO boardDAO;
	
	public void writer(BoardVO vo) {
		boardDAO.writer(vo);
	}
	public List<Object> getPostingList(int pageNo) {
		// TODO Auto-generated method stub
		return boardDAO.getPostingList(pageNo);
	}
	public BoardVO showContent(int no) {
		return boardDAO.showContent(no);
	}
	public int totalCount() {
		return boardDAO.totalCount();
	}
	@Override
	public void update(BoardVO vo) {
		boardDAO.update(vo);
		
	}
	@Override
	public void delete(String no) {
		boardDAO.delete(no);
		
	}
	@Override
	public void like(int boardNo, String empNo) {
		boardDAO.like(boardNo,empNo);
	}
	@Override
	public void likeUpdate(int boardNo) {
		boardDAO.likeUpdate(boardNo);	
	}
	@Override
	public int checkLike(GoodVO goodVO) {
		// TODO Auto-generated method stub
		return boardDAO.checkLike(goodVO);
	}
	@Override
	public List<Object> popularList() {
		// TODO Auto-generated method stub
		return boardDAO.popularList();
	}
	@Override
	public List<Object> commentList(int boardNo) {
		// TODO Auto-generated method stub
		return boardDAO.commentList(boardNo);
	}
	@Override
	public void commentRegister(CommentVO commentVO) {
		boardDAO.commentRegister(commentVO);
		
	}
	@Override
	public void deleteComment(int commentNo) {
		boardDAO.deleteComment(commentNo);
		
	}
	@Override
	public void updateComment(int commentNo) {
		boardDAO.updateComment(commentNo);
		
	}
	@Override
	public List<Object> searchTitleList(String searchVar, int pageNo) {
		// TODO Auto-generated method stub
		return boardDAO.searchTitleList(searchVar, pageNo);
	}
	public List<Object> searchContentList(String searchVar, int pageNo) {
		// TODO Auto-generated method stub
		return boardDAO.searchContentList(searchVar, pageNo);
	}
	@Override
	public List<Object> searchTitleContentList(String searchVar, int pageNo) {
		// TODO Auto-generated method stub
		return boardDAO.searchTitleContentList(searchVar, pageNo);
	}
	public int totalTitleCount(String searchVar) {
		// TODO Auto-generated method stub
		return boardDAO.totalTitleCount(searchVar);
	}
	public int totalContentCount(String searchVar) {
		// TODO Auto-generated method stub
		return boardDAO.totalContentCount(searchVar);
	}
	@Override
	public int totalTitleContentCount(String searchVar) {
		// TODO Auto-generated method stub
		return boardDAO.totalTitleContentCount(searchVar);
	}
	@Override
	public Integer countBor() {
		return boardDAO.countBor();
	}
	
}
