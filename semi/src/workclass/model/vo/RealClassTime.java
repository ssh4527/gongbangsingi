package workclass.model.vo;

public class RealClassTime {
	private String rctNo; //시간대 번호
	private String wcNo; // 클래스 번호
	private String rctDate; // 수강 날짜
	private String rctTime; //시간대
	private int maxp; //최대인원수
	
	public RealClassTime() {}

	public RealClassTime(String rctNo, String wcNo, String rctDate, String rctTime, int maxp) {
		super();
		this.rctNo = rctNo;
		this.wcNo = wcNo;
		this.rctDate = rctDate;
		this.rctTime = rctTime;
		this.maxp = maxp;
	}

	public String getRctNo() {
		return rctNo;
	}

	public void setRctNo(String rctNo) {
		this.rctNo = rctNo;
	}

	public String getWcNo() {
		return wcNo;
	}

	public void setWcNo(String wcNo) {
		this.wcNo = wcNo;
	}

	public String getRctDate() {
		return rctDate;
	}

	public void setRctDate(String rctDate) {
		this.rctDate = rctDate;
	}

	public String getRctTime() {
		return rctTime;
	}

	public void setRctTime(String rctTime) {
		this.rctTime = rctTime;
	}

	public int getMaxp() {
		return maxp;
	}

	public void setMaxp(int maxp) {
		this.maxp = maxp;
	}

	@Override
	public String toString() {
		return "RealClassTime [rctNo=" + rctNo + ", wcNo=" + wcNo + ", rctDate=" + rctDate + ", rctTime=" + rctTime
				+ ", maxp=" + maxp + "]";
	}
	
	
}
