package workclass.model.vo;

public class ClassTime {
	private String ctNo; //시간 번호
	private String wcNo; // 클래스 번호
	private String ctTime; // 13:00 - 15:00
	private String ctDate; // 시작날짜
	private String ctEndDate; // 종료날짜
	private int ctCount; // 맥스인원
	
	
	public ClassTime() {}
	
	public ClassTime(String ctNo, String wcNo, String ctTime, String ctDate, String ctEndDate, int ctCount) {
		super();
		this.ctNo = ctNo;
		this.wcNo = wcNo;
		this.ctTime = ctTime;
		this.ctDate = ctDate;
		this.ctEndDate = ctEndDate;
		this.ctCount = ctCount;
	}
	
	

	public ClassTime(String wcNo, String ctTime, String ctDate, String ctEndDate, int ctCount) {
		super();
		this.wcNo = wcNo;
		this.ctTime = ctTime;
		this.ctDate = ctDate;
		this.ctEndDate = ctEndDate;
		this.ctCount = ctCount;
	}

	public ClassTime(String ctTime, String ctDate, String ctEndDate) {
		super();
		this.ctTime = ctTime;
		this.ctDate = ctDate;
		this.ctEndDate = ctEndDate;
	}

	public ClassTime(String wcNo, String ctTime, String ctDate, String ctEndDate) {
		super();
		this.wcNo = wcNo;
		this.ctTime = ctTime;
		this.ctDate = ctDate;
		this.ctEndDate = ctEndDate;
	}

	public String getCtNo() {
		return ctNo;
	}

	public void setCtNo(String ctNo) {
		this.ctNo = ctNo;
	}

	public String getWcNo() {
		return wcNo;
	}

	public void setWcNo(String wcNo) {
		this.wcNo = wcNo;
	}

	public String getCtTime() {
		return ctTime;
	}

	public void setCtTime(String ctTime) {
		this.ctTime = ctTime;
	}

	public String getCtDate() {
		return ctDate;
	}

	public void setCtDate(String ctDate) {
		this.ctDate = ctDate;
	}

	public String getCtEndDate() {
		return ctEndDate;
	}

	public void setCtEndDate(String ctEndDate) {
		this.ctEndDate = ctEndDate;
	}

	public int getCtCount() {
		return ctCount;
	}

	public void setCtCount(int ctCount) {
		this.ctCount = ctCount;
	}

	@Override
	public String toString() {
		return "ClassTime [ctNo=" + ctNo + ", wcNo=" + wcNo + ", ctTime=" + ctTime + ", ctDate=" + ctDate
				+ ", ctEndDate=" + ctEndDate + ", ctCount=" + ctCount + "]";
	}
	
	
	
}
