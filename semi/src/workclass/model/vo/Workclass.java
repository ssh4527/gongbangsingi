package workclass.model.vo;

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
	
	public Workclass() {}


	public Workclass(String wcName, int wcNOP, String wcOpenClose) {
		super();
		WcName = wcName;
		WcNOP = wcNOP;
		WcOpenClose = wcOpenClose;
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


	@Override
	public String toString() {
		return "Workclass [WcNo=" + WcNo + ", WcName=" + WcName + ", WcNOP=" + WcNOP + ", WcMaxP=" + WcMaxP + ", WcYN="
				+ WcYN + ", WcOpenClose=" + WcOpenClose + ", WcHits=" + WcHits + ", WcWarning=" + WcWarning + ", WsNo="
				+ WsNo + "]";
	}


	
	
}
