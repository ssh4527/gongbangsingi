package board.model.vo;

import java.sql.Date;

public class Board {
	private int bid; //게시글 번호
	private String bTitle; //게시글 제목
	private String bContent; //게시글 내용
	private String bWriter; //게시글 작성자 이름
	private int bCount; //게시글 조회수
	private Date createDate; //게시글 작성일
	private Date modifyDate; //게시글 수정일
	private String secret; //게시글 비밀글 여부 (y:비밀글 n:공개글)
	private String bPassword; //게시글 비밀번호
	
	// 회원(일반인지 사업자인지) 구분하기
	
	
	public int getBid() {
		return bid;
	}
	public Board(String bTitle, String bContent, String bWriter, String secret, String bPassword) {
		super();
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.secret = secret;
		this.bPassword = bPassword;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public String getbWriter() {
		return bWriter;
	}
	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}
	public int getbCount() {
		return bCount;
	}
	public void setbCount(int bCount) {
		this.bCount = bCount;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	
	public String getbPassword() {
		return bPassword;
	}
	public void setbPassword(String bPassword) {
		this.bPassword = bPassword;
	}
	public Board(int bid, String bTitle, String bContent, String bWriter, int bCount, Date createDate, Date modifyDate,
			String secret, String bPassword) {
		super();
		this.bid = bid;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.bCount = bCount;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.secret = secret;
		this.bPassword = bPassword;
	}
	@Override
	public String toString() {
		return "Board [bid=" + bid + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bWriter=" + bWriter
				+ ", bCount=" + bCount + ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", secret="
				+ secret + ", bPassword=" + bPassword + "]";
	}
	
}