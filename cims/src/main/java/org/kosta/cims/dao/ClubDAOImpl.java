package org.kosta.cims.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.model.ClubApplicantVO;
import org.kosta.cims.model.ClubBoardVO;
import org.kosta.cims.model.ClubMemberVO;
import org.kosta.cims.model.ClubVO;
import org.kosta.cims.model.EmployeeVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ClubDAOImpl implements ClubDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public List<Object> getPostingList(int pageNo) {
		// TODO Auto-generated method stub
		return template.selectList("club.getPostingList",pageNo);
	}

	@Override
	public int clubTotalCount() {
		// TODO Auto-generated method stub
		return template.selectOne("club.clubTotalCount");
	}


	@Override
	public void clubWrite(ClubVO vo) {
		template.insert("club.clubWriter",vo);
		
	}

	@Override
	public void clubUpdate(ClubVO vo) {
		template.update("club.clubUpdate",vo);
		
	}

	@Override
	public ClubVO clubShowContent(int no) {
		// TODO Auto-generated method stub
		return template.selectOne("club.clubShowContent",no);
	}

	@Override
	public void clubDelete(int no) {
		template.delete("club.clubDelete",no);
		
	}

	@Override
	public List<Object> getPostingList2() {
		// TODO Auto-generated method stub
		return template.selectList("club.getPostingList2");
	}

	@Override
	public void clubApproval(int clubNo) {
		template.update("club.clubApproval",clubNo);
		
	}

	@Override
	public void clubReject(int clubNo) {
		template.update("club.clubReject",clubNo);
		
	}

	@Override
	public void clubRegister(ClubMemberVO cvo) {
		template.insert("club.clubRegister",cvo);
		
	}

	@Override
	public String findByClubName(int clubNo) {
		// TODO Auto-generated method stub
		return template.selectOne("club.findByClubName",clubNo);
	}


	@Override
	public int clubCheck(ClubMemberVO cvo) {
		// TODO Auto-generated method stub
		return template.selectOne("club.clubCheck",cvo);
	}

	public void clubMemberDelete(int no) {
		template.delete("club.clubMemberDelete",no);
		
	}

	@Override
	public int findClubByName(String clubName) {
		return template.selectOne("clubBoard.findClubByName",clubName);
	}

	@Override
	public void registerClubBoard(ClubBoardVO cbvo) {
		template.insert("clubBoard.registerClubBoard", cbvo);
	}

	@Override
	public ClubBoardVO findClubBoardByNo(int no) {
		return template.selectOne("clubBoard.findClubBoardByNo", no);
	}

	@Override
	public void addApplicant(int cbNo, String empNo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("no", ""+cbNo);
		map.put("empNo", empNo);
		 template.insert("clubBoard.addApplicant", map);
	}

	@Override
	public List<ClubApplicantVO> applicantList(int cbno) {
		return template.selectList("clubBoard.applicantList", cbno);
	}

	@Override
	public int applicantCount(int cbno) {
		return template.selectOne("clubBoard.applicantCount", cbno);
	}

	@Override
	public List<Object> clubBoardList(int page) {
		return template.selectList("clubBoard.clubBoardList", page);
	}

	@Override
	public int getClubBoardListTotalPage() {
		return template.selectOne("clubBoard.getClubBoardListTotalPage");
	}

	@Override
	public void updateApplicantCount(int count,int no) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("boardNo", no);
		map.put("count", count);
		template.update("clubBoard.updateApplicantCount",map);
	}

	@Override
	public int ApplicantCheck(int no, String empNo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("boardNo", ""+no);
		map.put("empNo", empNo);
		return template.selectOne("clubBoard.ApplicantCheck", map);
	}

	@Override
	public void deleteApplicant(int no, String empNo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("boardNo", ""+no);
		map.put("empNo", empNo);
		template.delete("clubBoard.deleteApplicant", map);
	}

	@Override
	public List<ClubVO> searchClubName(String empNo) {
		return template.selectList("club.searchClubName", empNo);
	}

	@Override
	public int checkClubCreate(String empNo) {
		return template.selectOne("club.checkClubCreate", empNo);
	}

	@Override
	public ClubVO findClubNoByempNo(String empNo) {
		return template.selectOne("club.findClubNoByempNo",empNo);
	}

	   @Override
	   public void clubResign(ClubMemberVO cvo) {
	      template.delete("club.clubResign",cvo);
	      
	   }

	@Override
	public int checkBoardWriter(String empNo, int no,int clubNo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("empNo", empNo);
		map.put("no", ""+no);
		map.put("clubNo", ""+clubNo);
		return template.selectOne("clubBoard.checkBoardWriter", map);
	}

	@Override
	public void clubBoardUpdate(ClubBoardVO cbvo) {
		template.update("clubBoard.clubBoardUpdate", cbvo);
	}
	@Override
	   public void clubBoardDelete(int boardNo) {
	      template.delete("clubBoard.clubBoardDelete", boardNo);
	   }
}






