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

	private String id; //사업자아이디
	private String intro; //소개글
	private double grade; //평점
	private String sns; //sns계정

	private String AccountNum; // 사업자 등록번호
	public Workshop() {}




	public Workshop(String wsNo, String wsName, String address, String wsTel,String id, String category,String accountNum) {
		super();
		WsNo = wsNo;
		WsName = wsName;
		Address = address;
		WsTel = wsTel;
		this.id = id;
		Category = category;
		AccountNum =accountNum;
	}
	

	public Workshop(String wsNo, String wsName,  String category) {
		super();
		WsNo = wsNo;
		WsName = wsName;
		Category = category;
	}




	public Workshop(String wsNo, String wsName, String category, double grade, String address) {
		WsNo = wsNo;
		WsName = wsName;
		Category = category;
		Address = address;
		this.grade = grade;
	}


	public Workshop(String wsNo, String wsName, String address, String wsTel, String category, double grade, String sns,String id,String intro) {
		WsNo = wsNo;
		WsName = wsName;
		Address = address;
		WsTel = wsTel;
		Category = category;
		this.grade = grade;
		this.sns=sns;
		this.id=id;
		this.intro=intro;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSns() {
		return sns;
	}

	public void setSns(String sns) {
		this.sns = sns;
	}



	public String getAccountNum() {
		return AccountNum;
	}



	public void setAccountNum(String accountNum) {
		AccountNum = accountNum;
	}

	
	
	
	
}
