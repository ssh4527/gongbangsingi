package review.model.vo;

import java.sql.Date;

public class Review {

	/*R_NO	VARCHAR2(30 BYTE)
	C_ID	VARCHAR2(30 BYTE)
	R_TITLE	VARCHAR2(100 BYTE)
	R_ENT_DATE	DATE
	R_CONTENT	VARCHAR2(2000 BYTE)
	R_VIEW_CNT	NUMBER
	R_GRADE	NUMBER
	WC_NO	NUMBER*/
	
	private String R_No; // 후기글번호
	private String C_ID; //회원아이디//
	private String R_Title; // 제목
	private Date R_EnT_Date; // 등록일//
	private String R_Content; // 내용
	private int R_VIEW_CNT; // 조회수
	private double R_GRADE; // 평점 //
	private String WC_NAME; //클래스 이름//
	

	public Review() {}


	public Review(String c_ID, Date r_EnT_Date, double r_GRADE, String wC_NAME) {
		super();
		C_ID = c_ID;
		R_EnT_Date = r_EnT_Date;
		R_GRADE = r_GRADE;
		WC_NAME = wC_NAME;
	}


	public String getR_No() {
		return R_No;
	}


	public void setR_No(String r_No) {
		R_No = r_No;
	}


	public String getC_ID() {
		return C_ID;
	}


	public void setC_ID(String c_ID) {
		C_ID = c_ID;
	}


	public String getR_Title() {
		return R_Title;
	}


	public void setR_Title(String r_Title) {
		R_Title = r_Title;
	}


	public Date getR_EnT_Date() {
		return R_EnT_Date;
	}


	public void setR_EnT_Date(Date r_EnT_Date) {
		R_EnT_Date = r_EnT_Date;
	}


	public String getR_Content() {
		return R_Content;
	}


	public void setR_Content(String r_Content) {
		R_Content = r_Content;
	}


	public int getR_VIEW_CNT() {
		return R_VIEW_CNT;
	}


	public void setR_VIEW_CNT(int r_VIEW_CNT) {
		R_VIEW_CNT = r_VIEW_CNT;
	}


	public double getR_GRADE() {
		return R_GRADE;
	}


	public void setR_GRADE(double r_GRADE) {
		R_GRADE = r_GRADE;
	}


	public String getWC_NAME() {
		return WC_NAME;
	}


	public void setWC_NAME(String wC_NAME) {
		WC_NAME = wC_NAME;
	}

	
}
