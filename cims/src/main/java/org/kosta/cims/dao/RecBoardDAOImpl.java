package org.kosta.cims.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.model.RecCommentVO;
import org.kosta.cims.model.RecommendVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class RecBoardDAOImpl implements RecBoardDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public List<Object> getPostingList(int pageNo) {
		// TODO Auto-generated method stub
		return template.selectList("rec.getPostingList",pageNo);
		
	}

	@Override
	public int recTotalCount() {
		// TODO Auto-generated method stub
		return template.selectOne("rec.recTotalCount");
	}

	@Override
	public RecommendVO recShowContent(int no) {
		// TODO Auto-generated method stub
		return template.selectOne("rec.recShowContent",no);
	}

	@Override
	public void recDelete(int no) {
		template.delete("rec.recDelete",no);
		
	}

	@Override
	public void recUpdate(RecommendVO recommendVO) {
		template.update("rec.recUpdate",recommendVO);
		
	}

	@Override
	public void recWriter(RecommendVO vo) {
		template.insert("rec.recWriter",vo);
		
	}

	@Override
	public void recCommentRegister(RecCommentVO commentVO) {
		template.insert("commentRec.recCommentRegister",commentVO);
		
	}

	@Override
	public List<Object> recCommentList(int no) {
		// TODO Auto-generated method stub
		return template.selectList("commentRec.recCommentList",no);
	}

	@Override
	public void deleteRecComment(int commentNo) {
		template.delete("commentRec.deleteRecComment",commentNo);
		
	}
	@Override
	public List<Object> searchTitleList(String searchVar, int pageNo) {
		RecommendVO vo = new RecommendVO(searchVar,pageNo);
		return template.selectList("rec.searchTitleList",vo);
	}
	@Override
	public List<Object> searchContentList(String searchVar, int pageNo) {
		RecommendVO vo = new RecommendVO(searchVar,pageNo);
		return template.selectList("rec.searchContentList",vo);
	}
	@Override
	public List<Object> searchTitleContentList(String searchVar, int pageNo) {
		// TODO Auto-generated method stub
		RecommendVO vo = new RecommendVO(searchVar,searchVar,pageNo);
		return template.selectList("rec.searchTitleContentList",vo);
	}

	public int totalTitleCount(String searchVar) {
		
		return template.selectOne("rec.totalTitleCount",searchVar);
	}
	@Override
	public int totalContentCount(String searchVar) {
		// TODO Auto-generated method stub
		return template.selectOne("rec.totalContentCount",searchVar);
	}
	@Override
	public int totalTitleContentCount(String searchVar) {
		// TODO Auto-generated method stub
		return template.selectOne("rec.totalTitleContentCount",searchVar);
	}

}
