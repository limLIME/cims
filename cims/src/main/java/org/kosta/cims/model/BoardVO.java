package org.kosta.cims.model;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private int boardNo;
	private EmployeeVO employeeVO;
	private String boardTitle;
	private String boardContent;
	private String boardDate;
	private MultipartFile uploadFile;
	private String boardPath;
	private int likeCnt;
	private int pageNo;
	private int ranking;
	public BoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BoardVO(int boardNo) {
		super();
		this.boardNo = boardNo;
	}

	public BoardVO(int boardNo, EmployeeVO employeeVO, String boardTitle,
			String boardContent, String boardDate, MultipartFile uploadFile,
			String boardPath, int likeCnt, int pageNo, int ranking) {
		super();
		this.boardNo = boardNo;
		this.employeeVO = employeeVO;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.uploadFile = uploadFile;
		this.boardPath = boardPath;
		this.likeCnt = likeCnt;
		this.pageNo = pageNo;
		this.ranking = ranking;
	}

	public BoardVO(String boardDate) {
		super();
		this.boardDate = boardDate;
	}

	public BoardVO(int boardNo, EmployeeVO employeeVO, String boardTitle,
			String boardContent, String boardDate, MultipartFile uploadFile,
			String boardPath, int likeCnt, int pageNo) {
		super();
		this.boardNo = boardNo;
		this.employeeVO = employeeVO;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.uploadFile = uploadFile;
		this.boardPath = boardPath;
		this.likeCnt = likeCnt;
		this.pageNo = pageNo;
	}

	public BoardVO(int boardNo, EmployeeVO employeeVO, String boardTitle,
			String boardContent, String boardDate, MultipartFile uploadFile,
			String boardPath, int pageNo) {
		super();
		this.boardNo = boardNo;
		this.employeeVO = employeeVO;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.uploadFile = uploadFile;
		this.boardPath = boardPath;
		this.pageNo = pageNo;
	}
	public BoardVO(int boardNo, EmployeeVO employeeVO, String boardTitle,
			String boardContent, String boardDate, MultipartFile uploadFile,
			String boardPath) {
		super();
		this.boardNo = boardNo;
		this.employeeVO = employeeVO;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.uploadFile = uploadFile;
		this.boardPath = boardPath;
	}
	
	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public EmployeeVO getEmployeeVO() {
		return employeeVO;
	}
	public void setEmployeeVO(EmployeeVO employeeVO) {
		this.employeeVO = employeeVO;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getBoardPath() {
		return boardPath;
	}
	public void setBoardPath(String boardPath) {
		this.boardPath = boardPath;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	

	public int getRanking() {
		return ranking;
	}

	public void setRanking(int ranking) {
		this.ranking = ranking;
	}

	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", employeeVO=" + employeeVO
				+ ", boardTitle=" + boardTitle + ", boardContent="
				+ boardContent + ", boardDate=" + boardDate + ", uploadFile="
				+ uploadFile + ", boardPath=" + boardPath + ", likeCnt="
				+ likeCnt + ", pageNo=" + pageNo + ", ranking=" + ranking + "]";
	}

}
