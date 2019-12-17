package reservation.model.vo;

import java.util.Date;

public class Reservation {

	private String resCode;
	private String resState;
	private int resNop;
	private int totalPrice;
	private Date resDate;
	
	// -------------------------------
	private String wsName; 
	private String wcName;
	
	
	public Reservation() {}

	public Reservation(Date resDate, String wsName, String wcName,int resNop, int totalPrice) {
		super();
		this.wsName = wsName;
		this.wcName = wcName;
		this.resNop = resNop;
		this.totalPrice = totalPrice;
		this.resDate = resDate;
	}
	
	public Reservation(String resCode, String resState, int resNop, int totalPrice, Date resDate) {
		super();
		this.resCode = resCode;
		this.resState = resState;
		this.resNop = resNop;
		this.totalPrice = totalPrice;
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

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getResDate() {
		return resDate;
	}

	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}

	@Override
	public String toString() {
		return "Reservation [resCode=" + resCode + ", resState=" + resState + ", resNop=" + resNop + ", totalPrice="
				+ totalPrice + ", resDate=" + resDate + "]";
	}
	
	
	
}
