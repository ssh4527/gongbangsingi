package workshop.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import review.model.vo.Review;
import workclass.model.vo.Workclass;

public class Workshop {
	private String WsNo; // 공방 번호 
	private String WsName; // 공방 이름
	private String Address; // 공방 주소
	private String WsTel; // 공방 전화번호
	private boolean WsYN; // 공방 승인 여부
	private Date WsEnrollDate; // 공방 등록일자
	private String Category;  // 공방 카테고리
	private String PayAccount; // 공방계좌번호
	private ArrayList<Review> rlist; //후기 글
	private ArrayList<Workclass> clist; //클래스 
	private String intro; //소개글
	private double grade; //평점
	
	public Workshop() {}

	
	
	
	public Workshop(String wsNo, String wsName, String category, double grade) {
		super();
		WsNo = wsNo;
		WsName = wsName;
		Category = category;
		this.grade = grade;
	}




	public Workshop(String wsNo, String wsName, String address, String wsTel, String category, ArrayList<Review> rlist,
			ArrayList<Workclass> clist, String intro, double grade) {
		super();
		WsNo = wsNo;
		WsName = wsName;
		Address = address;
		WsTel = wsTel;
		Category = category;
		this.rlist = rlist;
		this.clist = clist;
		this.intro = intro;
		this.grade = grade;
	}




	public Workshop(String wsNo, String wsName, String address, String wsTel, 
			String category, double grade) {
		super();
		WsNo = wsNo;
		WsName = wsName;
		Address = address;
		WsTel = wsTel;
		Category = category;
		this.grade=grade;
	}

	public String getWsNo() {
		return WsNo;
	}

	public void setWsNo(String wsNo) {
		WsNo = wsNo;
	}

	public String getWsName() {
		return WsName;
	}

	public void setWsName(String wsName) {
		WsName = wsName;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getWsTel() {
		return WsTel;
	}

	public void setWsTel(String wsTel) {
		WsTel = wsTel;
	}

	public boolean isWsYN() {
		return WsYN;
	}

	public void setWsYN(boolean wsYN) {
		WsYN = wsYN;
	}

	public Date getWsEnrollDate() {
		return WsEnrollDate;
	}

	public void setWsEnrollDate(Date wsEnrollDate) {
		WsEnrollDate = wsEnrollDate;
	}

	public String getCategory() {
		return Category;
	}

	public void setCategory(String category) {
		Category = category;
	}

	public String getPayAccount() {
		return PayAccount;
	}

	public void setPayAccount(String payAccount) {
		PayAccount = payAccount;
	}

	public ArrayList<Review> getRlist() {
		return rlist;
	}

	public void setRlist(ArrayList<Review> rlist) {
		this.rlist = rlist;
	}

	public ArrayList<Workclass> getClist() {
		return clist;
	}

	public void setClist(ArrayList<Workclass> clist) {
		this.clist = clist;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public double getGrade() {
		return grade;
	}

	public void setGrade(double grade) {
		this.grade = grade;
	}




	@Override
	public String toString() {
		return "Workshop [WsNo=" + WsNo + ", WsName=" + WsName + ", Address=" + Address + ", WsTel=" + WsTel + ", WsYN="
				+ WsYN + ", WsEnrollDate=" + WsEnrollDate + ", Category=" + Category + ", PayAccount=" + PayAccount
				+ ", rlist=" + rlist + ", clist=" + clist + ", intro=" + intro + ", grade=" + grade + "]";
	}
	
	
	
	
}
