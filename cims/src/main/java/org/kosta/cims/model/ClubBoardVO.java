package org.kosta.cims.model;

public class ClubBoardVO {
	private int clubBoardNo;
	private String clubBoardTitle;
	private String clubBoardContent;
	private int clubBoardMaxPeople;
	private String clubBoardDate;
	private int clubBoardMember;
	private ClubVO clubVO;
	public ClubBoardVO() {
		super();
	}

	public ClubBoardVO(int clubBoardNo, String clubBoardTitle,
			String clubBoardContent, int clubBoardMaxPeople,
			String clubBoardDate, int clubBoardMember, ClubVO clubVO) {
		super();
		this.clubBoardNo = clubBoardNo;
		this.clubBoardTitle = clubBoardTitle;
		this.clubBoardContent = clubBoardContent;
		this.clubBoardMaxPeople = clubBoardMaxPeople;
		this.clubBoardDate = clubBoardDate;
		this.clubBoardMember = clubBoardMember;
		this.clubVO = clubVO;
	}

	public int getClubBoardMember() {
		return clubBoardMember;
	}

	public void setClubBoardMember(int clubBoardMember) {
		this.clubBoardMember = clubBoardMember;
	}

	public int getClubBoardNo() {
		return clubBoardNo;
	}
	public void setClubBoardNo(int clubBoardNo) {
		this.clubBoardNo = clubBoardNo;
	}
	public String getClubBoardTitle() {
		return clubBoardTitle;
	}
	public void setClubBoardTitle(String clubBoardTitle) {
		this.clubBoardTitle = clubBoardTitle;
	}
	public String getClubBoardContent() {
		return clubBoardContent;
	}
	public void setClubBoardContent(String clubBoardContent) {
		this.clubBoardContent = clubBoardContent;
	}
	public int getClubBoardMaxPeople() {
		return clubBoardMaxPeople;
	}
	public void setClubBoardMaxPeople(int clubBoardMaxPeople) {
		this.clubBoardMaxPeople = clubBoardMaxPeople;
	}
	public String getClubBoardDate() {
		return clubBoardDate;
	}
	public void setClubBoardDate(String clubBoardDate) {
		this.clubBoardDate = clubBoardDate;
	}
	public ClubVO getClubVO() {
		return clubVO;
	}
	public void setClubVO(ClubVO clubVO) {
		this.clubVO = clubVO;
	}

	@Override
	public String toString() {
		return "ClubBoardVO [clubBoardNo=" + clubBoardNo + ", clubBoardTitle="
				+ clubBoardTitle + ", clubBoardContent=" + clubBoardContent
				+ ", clubBoardMaxPeople=" + clubBoardMaxPeople
				+ ", clubBoardDate=" + clubBoardDate + ", clubBoardMember="
				+ clubBoardMember + ", clubVO=" + clubVO + "]";
	}

	
}
