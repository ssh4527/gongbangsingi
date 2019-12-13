package review.model.vo;

import java.sql.Date;

public class Review {
	private String RNo; // 후기글번호
	private String RTitle; // 제목
	private Date REnDate; // 등록일
	private String RContent; // 내용
	private int RCount; // 조회수
	private int RGrade; // 평점
	private String RWriter; //작성자
	private String wcNo; // 클래스 번호
	private String cName;
	public Review() {}


	public Review(String cName, Date rEnDate, int rGrade, String rWriter) {
		this.cName = cName;
		REnDate = rEnDate;
		RGrade = rGrade;
		RWriter = rWriter;
	}


	public Review(String rNo, String rTitle, Date rEnDate, String rContent, int rCount, int rGrade, String rWriter,
			String wcNo) {
		super();
		RNo = rNo;
		RTitle = rTitle;
		REnDate = rEnDate;
		RContent = rContent;
		RCount = rCount;
		RGrade = rGrade;
		RWriter = rWriter;
		this.wcNo = wcNo;
	}


	public Review(String rTitle, String rContent, int rGrade, String rWriter, String wcNo) {
		super();
		RTitle = rTitle;
		RContent = rContent;
		RGrade = rGrade;
		RWriter = rWriter;
		this.wcNo = wcNo;
	}

	public String getRWriter() {
		return RWriter;
	}



	public void setRWriter(String rWriter) {
		RWriter = rWriter;
	}



	public String getRNo() {
		return RNo;
	}

	public void setRNo(String rNo) {
		RNo = rNo;
	}

	public String getRTitle() {
		return RTitle;
	}

	public void setRTitle(String rTitle) {
		RTitle = rTitle;
	}

	public Date getREnDate() {
		return REnDate;
	}

	public void setREnDate(Date rEnDate) {
		REnDate = rEnDate;
	}

	public String getRContent() {
		return RContent;
	}

	public void setRContent(String rContent) {
		RContent = rContent;
	}

	public int getRCount() {
		return RCount;
	}

	public void setRCount(int rCount) {
		RCount = rCount;
	}

	public int getRGrade() {
		return RGrade;
	}

	public void setRGrade(int rGrade) {
		RGrade = rGrade;
	}














	public String getcName() {
		return cName;
	}


	public void setcName(String cName) {
		this.cName = cName;
	}


	public String getWcNo() {
		return wcNo;
	}














	public void setWcNo(String wcNo) {
		this.wcNo = wcNo;
	}














	@Override
	public String toString() {
		return "Review [RNo=" + RNo + ", RTitle=" + RTitle + ", REnDate=" + REnDate + ", RContent=" + RContent
				+ ", RCount=" + RCount + ", RGrade=" + RGrade + ", RWriter=" + RWriter + ", wcNo=" + wcNo + "]";
	}







	
	
	
}
