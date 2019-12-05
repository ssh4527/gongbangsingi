package notice.model.vo;

import java.sql.Date;

public class Notice {
	private int nNo; // 공지사항 번호
	private String nTitle; // 제목
	private String nContent; // 내용
	private String nWriter; // 작성자
	private int nViewCnt; // 조회수
	private Date nEntDate; // 등록일
	private Date nModDate; // 수정일

	
	public Notice() {}


	public int getnNo() {
		return nNo;
	}


	public void setnNo(int nNo) {
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


	public String getnWriter() {
		return nWriter;
	}


	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
	}


	public int getnViewCnt() {
		return nViewCnt;
	}


	public void setnViewCnt(int nViewCnt) {
		this.nViewCnt = nViewCnt;
	}


	public Date getnEntDate() {
		return nEntDate;
	}


	public void setnEntDate(Date nEntDate) {
		this.nEntDate = nEntDate;
	}


	public Date getnModDate() {
		return nModDate;
	}


	public void setnModDate(Date nModDate) {
		this.nModDate = nModDate;
	}

	public Notice(int nNo, String nTitle, String nContent, String nWriter, int nViewCnt, Date nEntDate, Date nModDate) {
		super();
		this.nNo = nNo;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nWriter = nWriter;
		this.nViewCnt = nViewCnt;
		this.nEntDate = nEntDate;
		this.nModDate = nModDate;
	}

	@Override
	public String toString() {
		return "Notice [nNo=" + nNo + ", nTitle=" + nTitle + ", nContent=" + nContent + ", nWriter=" + nWriter
				+ ", nViewCnt=" + nViewCnt + ", nEntDate=" + nEntDate + ", nModDate=" + nModDate + "]";
	}
}
