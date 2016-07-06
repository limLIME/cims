package org.kosta.cims.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.cims.dao.ClubDAO;
import org.kosta.cims.model.ClubApplicantVO;
import org.kosta.cims.model.ClubBoardVO;
import org.kosta.cims.model.ClubMemberVO;
import org.kosta.cims.model.ClubVO;
import org.kosta.cims.model.ListVO;
import org.kosta.cims.model.PagingBean;
import org.springframework.stereotype.Service;

@Service
public class ClubServiceImpl implements ClubService {
	@Resource
	private ClubDAO clubDAO;


	@Override
	public List<Object> getPostingList(int pageNo) {
		// TODO Auto-generated method stub
		return clubDAO.getPostingList(pageNo);
	}

	@Override
	public int clubTotalCount() {
		// TODO Auto-generated method stub
		return clubDAO.clubTotalCount();
	}

	@Override
	public ClubVO clubShowContent(int no) {
		// TODO Auto-generated method stub
		return clubDAO.clubShowContent(no);
	}

	@Override
	public void clubWrite(ClubVO vo) {
		clubDAO.clubWrite(vo);
		
	}


	public void clubUpdate(ClubVO vo) {
		clubDAO.clubUpdate(vo);
		
	}

	public void clubDelete(int no) {
		clubDAO.clubDelete(no);
		
	}


	public List<Object> getPostingList2() {
		// TODO Auto-generated method stub
		return clubDAO.getPostingList2();
	}

	public void clubApproval(int clubNo) {
		clubDAO.clubApproval(clubNo);
		
	}

	public void clubReject(int clubNo) {
		clubDAO.clubReject(clubNo);
		
	}

	public void clubRegister(ClubMemberVO cvo) {
		clubDAO.clubRegister(cvo);
		
	}


	public String findByClubName(int clubNo) {
		// TODO Auto-generated method stub
		return clubDAO.findByClubName(clubNo);
	}


	public int clubCheck(ClubMemberVO cvo) {
		// TODO Auto-generated method stub
		return clubDAO.clubCheck(cvo);
	}

	public void clubMemberDelete(int no) {
		clubDAO.clubMemberDelete(no);		
	}

	@Override
	public int findClubByName(String clubName) {
		return clubDAO.findClubByName(clubName);
	}

	@Override
	public void registerClubBoard(ClubBoardVO cbvo) {
		clubDAO.registerClubBoard(cbvo);
	}

	@Override
	public ClubBoardVO findClubBoardByNo(int no) {
		return clubDAO.findClubBoardByNo(no);
	}

	@Override
	public void addApplicant(int cbNo, String empNo) {
		 clubDAO.addApplicant(cbNo, empNo);		
	}

	@Override
	public List<ClubApplicantVO> applicantList(int cbno) {
		return clubDAO.applicantList(cbno);
	}

	@Override
	public int applicantCount(int cbno) {
		return clubDAO.applicantCount(cbno);
	}

	@Override
	public ListVO clubBoardList(int page) {
		int getClubBoardListTotalPage = clubDAO.getClubBoardListTotalPage();
		List<Object> list = clubDAO.clubBoardList(page);
		PagingBean pb = new PagingBean(getClubBoardListTotalPage, page);
		ListVO lvo = new ListVO(list, pb);
		return lvo;
	}

	@Override
	public void updateApplicantCount(int count,int no) {
		clubDAO.updateApplicantCount(count,no);
	}

	@Override
	public int ApplicantCheck(int no, String empNo) {
		return clubDAO.ApplicantCheck(no, empNo);
	}

	@Override
	public void deleteApplicant(int no, String empNO) {
		clubDAO.deleteApplicant(no, empNO);
	}

	@Override
	public List<ClubVO> searchClubName(String empNo) {
		return clubDAO.searchClubName(empNo);
	}

	@Override
	public int checkClubCreate(String empNo) {
		return clubDAO.checkClubCreate(empNo);
	}

	@Override
	public ClubVO findClubNoByempNo(String empNo) {
		return clubDAO.findClubNoByempNo(empNo);
	}

	@Override
	public void clubResign(ClubMemberVO cvo) {
		clubDAO.clubResign(cvo);
	}

	@Override
	public int checkBoardWriter(String empNo, int no,int clubNo) {
		return clubDAO.checkBoardWriter(empNo, no, clubNo);
	}

	@Override
	public void clubBoardUpdate(ClubBoardVO cbvo) {
		clubDAO.clubBoardUpdate(cbvo);
	}
	  @Override
	   public void clubBoardDelete(int boardNo) {
	      clubDAO.clubBoardDelete(boardNo);
	   }
}















