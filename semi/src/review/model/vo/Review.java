package review.model.vo;

import java.sql.Date;

public class Review {
	private String RNo; // 후기글번호
	private String RTitle; // 제목
	private Date REnDate; // 등록일
	private String RContent; // 내용
	private int RCount; // 조회수
	private int RGrade; // 평점

	public Review() {}

	public Review(String rNo, String rTitle, Date rEnDate, String rContent, int rCount, int rGrade) {
		super();
		RNo = rNo;
		RTitle = rTitle;
		REnDate = rEnDate;
		RContent = rContent;
		RCount = rCount;
		RGrade = rGrade;
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
	
	
}
