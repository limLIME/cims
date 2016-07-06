package org.kosta.cims.dao;

import java.util.List;

import org.kosta.cims.model.ClubApplicantVO;
import org.kosta.cims.model.ClubBoardVO;
import org.kosta.cims.model.ClubMemberVO;
import org.kosta.cims.model.ClubVO;
import org.kosta.cims.model.EmployeeVO;

public interface ClubDAO {
	List<Object> getPostingList(int pageNo);
	int clubTotalCount();
	ClubVO clubShowContent(int no);
	void clubWrite(ClubVO vo);
	void clubUpdate(ClubVO vo);
	void clubDelete(int no);
	List<Object> getPostingList2();
	void clubApproval(int clubNo);
	void clubReject(int clubNo);
	void clubRegister(ClubMemberVO cvo);
	String findByClubName(int clubNo);
	int clubCheck(ClubMemberVO cvo);
	void clubMemberDelete(int no);
	int checkClubCreate(String empNo);
	ClubVO findClubNoByempNo(String empNo);
	void clubResign(ClubMemberVO cvo);
	public abstract int findClubByName(String clubName);
	public abstract void registerClubBoard(ClubBoardVO cbvo);
	public abstract ClubBoardVO findClubBoardByNo(int no);
	public abstract void addApplicant(int cbNo,String empNo);
	public abstract List<ClubApplicantVO> applicantList(int cbno);
	public abstract int applicantCount(int cbno);
	public abstract List<Object> clubBoardList(int page);
	public abstract int getClubBoardListTotalPage();
	public abstract void updateApplicantCount(int count,int no);
	public abstract int ApplicantCheck(int no, String empNo);
	public abstract void deleteApplicant(int no, String empNo);
	public abstract List<ClubVO> searchClubName(String empNo);
	public abstract int checkBoardWriter(String empNo,int no,int clubNo);
	public abstract void clubBoardUpdate(ClubBoardVO cbvo);
	public abstract void clubBoardDelete(int boardNo);
}














