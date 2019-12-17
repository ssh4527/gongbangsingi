package payment.model.vo;

import java.util.Date;

public class Payment {

	private String payCode;		// 결제 코드
	private Date payDate;		// 결제 날짜
	private String payMethod;	// 결제 수단
	private String resCode;		// 예메 코드
	private int wcNo;			// 클래스 번호
	
	public Payment() {}

	public Payment(String payCode, Date payDate, String payMethod, String resCode, int wcNo) {
		super();
		this.payCode = payCode;
		this.payDate = payDate;
		this.payMethod = payMethod;
		this.resCode = resCode;
		this.wcNo = wcNo;
	}

	public String getPayCode() {
		return payCode;
	}

	public void setPayCode(String payCode) {
		this.payCode = payCode;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public String getResCode() {
		return resCode;
	}

	public void setResCode(String resCode) {
		this.resCode = resCode;
	}

	public int getWcNo() {
		return wcNo;
	}

	public void setWcNo(int wcNo) {
		this.wcNo = wcNo;
	}

	@Override
	public String toString() {
		return "Payment [payCode=" + payCode + ", payDate=" + payDate + ", payMethod=" + payMethod + ", resCode="
				+ resCode + ", wcNo=" + wcNo + "]";
	}
	
	
}
