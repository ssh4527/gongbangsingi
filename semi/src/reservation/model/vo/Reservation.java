package reservation.model.vo;

import java.util.Date;

public class Reservation {

	private String resCode;
	private String resState;
	private int resNop;
	private int totalPrice;
	private String resDate;
	
	
	///////////////////////////
	private String cid;
	private String classtime;
	private String wcNo;
	
	
	
	// -------------------------------
	private String wsName; 
	private String wcName;
	
	//------------------------------
	private String cName;
	
	public Reservation() {}

	
	public Reservation(String resDate, String cName, String wcName, int resNop, int totalPrice,  String resState) {
		super();
		this.resState = resState;
		this.resNop = resNop;
		this.totalPrice = totalPrice;
		this.resDate = resDate;
		this.wcName = wcName;
		this.cName = cName;
	}


	public String getcName() {
		return cName;
	}


	public void setcName(String cName) {
		this.cName = cName;
	}


	public Reservation(String resDate, String wsName, String wcName,int resNop, int totalPrice) {
		super();
		this.wsName = wsName;
		this.wcName = wcName;
		this.resNop = resNop;
		this.totalPrice = totalPrice;
		this.resDate = resDate;
	}

	
	

	public Reservation(String resCode, String resState, int resNop, int totalPrice, String resDate, String cid,
			String classtime, String wcNo) {
		super();
		this.resCode = resCode;
		this.resState = resState;
		this.resNop = resNop;
		this.totalPrice = totalPrice;
		this.resDate = resDate;
		this.cid = cid;
		this.classtime = classtime;
		this.wcNo = wcNo;
	}




	public String getResDate() {
		return resDate;
	}

	public void setResDate(String resDate) {
		this.resDate = resDate;
	}

	public String getWsName() {
		return wsName;
	}

	public void setWsName(String wsName) {
		this.wsName = wsName;
	}

	public String getWcName() {
		return wcName;
	}

	public void setWcName(String wcName) {
		this.wcName = wcName;
	}

	public String getResCode() {
		return resCode;
	}

	public void setResCode(String resCode) {
		this.resCode = resCode;
	}

	public String getResState() {
		return resState;
	}

	public void setResState(String resState) {
		this.resState = resState;
	}

	public int getResNop() {
		return resNop;
	}

	public void setResNop(int resNop) {
		this.resNop = resNop;
	}
	

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getClasstime() {
		return classtime;
	}

	public void setClasstime(String classtime) {
		this.classtime = classtime;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	

	public String getWcNo() {
		return wcNo;
	}
	public void setWcNo(String wcNo) {
		this.wcNo = wcNo;
	}




	@Override
	public String toString() {
		return "Reservation [resCode=" + resCode + ", resState=" + resState + ", resNop=" + resNop + ", totalPrice="
				+ totalPrice + ", resDate=" + resDate + ", cid=" + cid + ", classtime=" + classtime + ", wcNo=" + wcNo
				+ "]";
	}

	
	
	
}
