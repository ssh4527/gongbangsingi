package workclass.model.vo;

public class Workclass {
	private String WcNo; // 클래스 번호
	private String WcName; // 클래스 이름 
	private int WcNOP; // 인원당 가격
	private int WcMaxP; // 클래스를 듣는 사람 최대인원
	private boolean WcYN; // 클래스 승인여부
	private String WcOpenClose; // 개강, 종강 날짜
	private int WcHits; // 조회수 
	
	public Workclass() {}

	public Workclass(String wcNo, String wcName, int wcNOP, int wcMaxP, boolean wcYN, String wcOpenClose, int wcHits) {
		super();
		WcNo = wcNo;
		WcName = wcName;
		WcNOP = wcNOP;
		WcMaxP = wcMaxP;
		WcYN = wcYN;
		WcOpenClose = wcOpenClose;
		WcHits = wcHits;
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
	
}
