package workshop.model.vo;

import java.sql.Date;

public class Workshop {
	private String WsNo; // 공방 번호
	private String WsName; // 공방 이름
	private String Address; // 공방 주소
	private String WsTel; // 공방 전화번호
	private boolean WsYN; // 공방 승인 여부
	private Date WsEnrollDate; // 공방 등록일자
	private String Category;  // 공방 카테고리
	private String PayAccount; // 공방계좌번호
	
	public Workshop() {}

	public Workshop(String wsNo, String wsName, String address, String wsTel, boolean wsYN, Date wsEnrollDate,
			String category, String payAccount) {
		super();
		WsNo = wsNo;
		WsName = wsName;
		Address = address;
		WsTel = wsTel;
		WsYN = wsYN;
		WsEnrollDate = wsEnrollDate;
		Category = category;
		PayAccount = payAccount;
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
	
	
	
	
}
