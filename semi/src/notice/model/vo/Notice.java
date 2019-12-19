package notice.model.vo;

import java.sql.Date;

public class Notice {
	private String nNo; // 공지사항 번호
	private String nTitle; // 공지사항 제목
	private String nContent; // 공지사항 내용 
	private int nCount; // 공지사항 조회수
	private Date nDate; // 공지사항 작성일


	
	public Notice() {}

	
	public Notice(String nTitle, String nContent) {
		super();
		this.nTitle = nTitle;
		this.nContent = nContent;
	}

	
	

	public String getnNo() {
		return nNo;
	}


	public void setnNo(String nNo) {
		this.nNo = nNo;
	}


	public String getnTitle() {
		return nTitle;
	}


	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}


	public String getnContent() {
		return nContent;
	}


	public void setnContent(String nContent) {
		this.nContent = nContent;
	}


	public int getnCount() {
		return nCount;
	}


	public void setnCount(int nCount) {
		this.nCount = nCount;
	}


	public Date getnDate() {
		return nDate;
	}


	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}


	public Notice(String nNo, String nTitle, String nContent, int nCount, Date nDate) {
		super();
		this.nNo = nNo;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nCount = nCount;
		this.nDate = nDate;
	}
	public Notice(String nNo, String nTitle, String nContent, Date nDate,int nCount) {
		super();
		this.nNo = nNo;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nCount = nCount;
		this.nDate = nDate;
	}


	@Override
	public String toString() {
		return "Notice [nNo=" + nNo + ", nTitle=" + nTitle + ", nContent=" + nContent + ", nCount=" + nCount
				+ ", nDate=" + nDate + "]";
	}
	
	

}
