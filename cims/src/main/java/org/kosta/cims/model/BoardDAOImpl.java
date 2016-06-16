package org.kosta.cims.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class BoardDAOImpl implements BoardDAO {
	@Resource
	private SqlSessionTemplate template;
	public void writer(BoardVO vo) {
		//BoardVO vo = new BoardVO(title, contents);
		template.insert("board.writer",vo);
	}
	public List<Object> getPostingList(int pageNo) {
		return template.selectList("board.getPostingList",pageNo);
	}
	public BoardVO showContent(int no) {
		return template.selectOne("board.showContent",no);
	}
	public int totalCount() {
		return template.selectOne("board.totalCount");
	}
	@Override
	public void update(BoardVO vo) {
		template.update("board.update",vo);
		
	}
	@Override
	public void delete(String no) {
		template.delete("board.delete",no);
		
	}
	@Override
	public void like(int boardNo, String empNo) {
		GoodVO vo = new GoodVO(boardNo,empNo);
		template.insert("good.like",vo);
	}
	@Override
	public void likeUpdate(int boardNo) {
		template.update("board.likeUpdate",boardNo);
		
	}
	@Override
	public int checkLike(GoodVO goodVO) {
		return template.selectOne("good.checkLike",goodVO);
	}
	@Override
	public List<Object> popularList() {
		return template.selectList("board.popularList");
	}
	@Override
	public List<Object> commentList(int boardNo) {
		// TODO Auto-generated method stub
		return template.selectList("comment.commentList",boardNo);
	}
	@Override
	public void commentRegister(CommentVO commentVO) {
		template.insert("comment.commentRegister",commentVO);
		
	}
	@Override
	public void deleteComment(int commentNo) {
		template.delete("comment.deleteComment",commentNo);
		
	}
	@Override
	public void updateComment(int commentNo) {
		template.update("comment.updateContent",commentNo);
		
	}
}
