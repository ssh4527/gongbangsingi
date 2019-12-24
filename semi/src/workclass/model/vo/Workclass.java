package workclass.model.vo;

import java.util.Date;

public class Workclass {
	private String WcNo; // 클래스 번호
	private String WcName; // 클래스 이름 
	private int WcNOP; // 인원당 가격
	private int WcMaxP; // 클래스를 듣는 사람 최대인원
	private boolean WcYN; // 클래스 승인여부
	private String WcOpenClose; // 개강, 종강 날짜
	private int WcHits; // 조회수 
	private String WcWarning; // 유의사항
	private String WcIntroduce; // 클래스소개글
	private String WsNo; // 공방번호
	
	
	private double avgGrade; // 해당 클래스의 평균 grade by.h
	private String path; // 해당 클래스의 썸네일 사진 링크가져옴 by.h
	private String rename; // 해당 썸네일의 링크 by.h
	
	private Date startdate; // 클래스 시작하는 날짜 20191220 by.h
	private Date enddate; // 클래스 끝나는날짜
	
	
	public Workclass() {}
	
	
	// 기본생성자 by h 20191220 by h
	public Workclass(String wcNo, String wcName, int wcNOP, int wcMaxP, boolean wcYN, String wcOpenClose, int wcHits,
			String wcWarning, String wcIntroduce, String wsNo, double avgGrade, String path, String rename,
			Date startdate, Date enddate) {
		super();
		WcNo = wcNo;
		WcName = wcName;
		WcNOP = wcNOP;
		WcMaxP = wcMaxP;
		WcYN = wcYN;
		WcOpenClose = wcOpenClose;
		WcHits = wcHits;
		WcWarning = wcWarning;
		WcIntroduce = wcIntroduce;
		WsNo = wsNo;
		this.avgGrade = avgGrade;
		this.path = path;
		this.rename = rename;
		this.startdate = startdate;
		this.enddate = enddate;
	}



	public Workclass(String wcName, int wcNOP, int wcMaxP, String wcOpenClose, String wcWarning, String wcIntroduce,
			String wsNo) {
		super();
		WcName = wcName;
		WcNOP = wcNOP;
		WcMaxP = wcMaxP;
		WcOpenClose = wcOpenClose;
		WcWarning = wcWarning;
		WcIntroduce = wcIntroduce;
		WsNo = wsNo;
	}


	// 기본생성자 by h 
	public Workclass(String wcNo, String wcName, int wcNOP, int wcMaxP, boolean wcYN, String wcOpenClose, int wcHits,
			String wcWarning, String wcIntroduce, String wsNo, double avgGrade, String path, String rename) {
		super();
		WcNo = wcNo;
		WcName = wcName;
		WcNOP = wcNOP;
		WcMaxP = wcMaxP;
		WcYN = wcYN;
		WcOpenClose = wcOpenClose;
		WcHits = wcHits;
		WcWarning = wcWarning;
		WcIntroduce = wcIntroduce;
		WsNo = wsNo;
		this.avgGrade = avgGrade;
		this.path = path;
		this.rename = rename;
	}


	public Workclass(String wcName, int wcNOP, String wcOpenClose, String wcNo) {
		super();
		WcName = wcName;
		WcNOP = wcNOP;
		WcOpenClose = wcOpenClose;
		WcNo = wcNo;
	}


	public Workclass(String wcNo, String wcName, int wcNOP, int wcMaxP, boolean wcYN, String wcOpenClose, int wcHits,
			String wcWarning,String wcIntroduce, String wsNo, Double avgGrade) {
		super();
		WcNo = wcNo;
		WcName = wcName;
		WcNOP = wcNOP;
		WcMaxP = wcMaxP;
		WcYN = wcYN;
		WcOpenClose = wcOpenClose;
		WcHits = wcHits;
		WcWarning = wcWarning;
		WsNo = wsNo;
		WcIntroduce = wcIntroduce;
		this.avgGrade= avgGrade;
	}
	
	public Workclass(String wcNo, String wcName, int wcNOP, int wcMaxP, boolean wcYN, String wcOpenClose, int wcHits,
			String wcWarning,String wcIntroduce, String wsNo) {
		super();
		WcNo = wcNo;
		WcName = wcName;
		WcNOP = wcNOP;
		WcMaxP = wcMaxP;
		WcYN = wcYN;
		WcOpenClose = wcOpenClose;
		WcHits = wcHits;
		WcWarning = wcWarning;
		WsNo = wsNo;
		WcIntroduce = wcIntroduce;
	}
	
	public Workclass(String wcNo, String wcName, int wcNOP, int wcMaxP, boolean wcYN, String wcOpenClose, int wcHits,
			String wcWarning,String wsNo) {
		super();
		WcNo = wcNo;
		WcName = wcName;
		WcNOP = wcNOP;
		WcMaxP = wcMaxP;
		WcYN = wcYN;
		WcOpenClose = wcOpenClose;
		WcHits = wcHits;
		WcWarning = wcWarning;
		WsNo = wsNo;
		
	}
	public Workclass(String wcName, int wcNOP, int wcMaxP, String wcOpenClose, String wcWarning, String wsNo) {
		super();
		WcName = wcName;
		WcNOP = wcNOP;
		WcMaxP = wcMaxP;
		WcOpenClose = wcOpenClose;
		WcWarning = wcWarning;
		WsNo = wsNo;
	}

	public String getWsNo() {
		return WsNo;
	}
	public String getWcIntroduce() {
		return WcIntroduce;
	}

	public void setWcIntroduce(String wcIntroduce) {
		WcIntroduce = wcIntroduce;
	}

	public void setWsNo(String wsNo) {
		WsNo = wsNo;
	}


	public String getWcWarning() {
		return WcWarning;
	}

	public void setWcWarning(String wcWarning) {
		WcWarning = wcWarning;
	}

	public String getWcNo() {
		return WcNo;
	}

	public void setWcNo(String wcNo) {
		WcNo = wcNo;
	}

	public String getWcName() {
		return WcName;
	}

	public void setWcName(String wcName) {
		WcName = wcName;
	}

	public int getWcNOP() {
		return WcNOP;
	}

	public void setWcNOP(int wcNOP) {
		WcNOP = wcNOP;
	}

	public int getWcMaxP() {
		return WcMaxP;
	}

	public void setWcMaxP(int wcMaxP) {
		WcMaxP = wcMaxP;
	}

	public boolean isWcYN() {
		return WcYN;
	}

	public void setWcYN(boolean wcYN) {
		WcYN = wcYN;
	}

	public String getWcOpenClose() {
		return WcOpenClose;
	}

	public void setWcOpenClose(String wcOpenClose) {
		WcOpenClose = wcOpenClose;
	}

	public int getWcHits() {
		return WcHits;
	}

	public void setWcHits(int wcHits) {
		WcHits = wcHits;
	}


	public double getAvgGrade() {
		return avgGrade;
	}

	public void setAvgGrade(double avgGrade) {
		this.avgGrade = avgGrade;
	}

	public String getPath() {
		return path;
	}


	public void setPath(String path) {
		this.path = path;
	}


	public String getRename() {
		return rename;
	}


	public void setRename(String rename) {
		this.rename = rename;
	}

	
	public Date getStartdate() {
		return startdate;
	}


	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}


	public Date getEnddate() {
		return enddate;
	}


	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}


	@Override
	public String toString() {
		return "Workclass [WcNo=" + WcNo + ", WcName=" + WcName + ", WcNOP=" + WcNOP + ", WcMaxP=" + WcMaxP + ", WcYN="
				+ WcYN + ", WcOpenClose=" + WcOpenClose + ", WcHits=" + WcHits + ", WcWarning=" + WcWarning
				+ ", WcIntroduce=" + WcIntroduce + ", WsNo=" + WsNo + ", avgGrade=" + avgGrade + ", path=" + path
				+ ", rename=" + rename + ", startdate=" + startdate + ", enddate=" + enddate + "]";
	}

	
}
