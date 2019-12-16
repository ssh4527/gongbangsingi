package qna.model.vo;

import java.sql.Date;

public class Qna {
	private String qNo; // qna 번호
	private String cId; // 작성자
	private String qTitle; // 제목
	private String qContent; // 내용
	private Date qEntdate; // 작성일
	private boolean qSecret; // 비밀여부 default 'N'
	private boolean qReplayck; // 답글확인체크 default 'N'
	private String wcNo; // 받는 사람 아이디 default null -> 관리자
	private int qCount; // 조회수
	private String qPwd; // 비밀번호
	
	public Qna() {}

	public String getqNo() {
		return qNo;
	}

	public void setqNo(String qNo) {
		this.qNo = qNo;
	}

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public Date getqEntdate() {
		return qEntdate;
	}

	public void setqEntdate(Date qEntdate) {
		this.qEntdate = qEntdate;
	}

	public boolean isqSecret() {
		return qSecret;
	}

	public void setqSecret(boolean qSecret) {
		this.qSecret = qSecret;
	}

	public boolean isqReplayck() {
		return qReplayck;
	}

	public void setqReplayck(boolean qReplayck) {
		this.qReplayck = qReplayck;
	}

	public String getWcNo() {
		return wcNo;
	}

	public void setWcNo(String wcNo) {
		this.wcNo = wcNo;
	}

	public Number getqCount() {
		return qCount;
	}

	public void setqCount(int qCount) {
		this.qCount = qCount;
	}

	public String getqPwd() {
		return qPwd;
	}

	public void setqPwd(String qPwd) {
		this.qPwd = qPwd;
	}

	public Qna(String qNo, String cId, String qTitle, String qContent, Date qEntdate, boolean qSecret,
			boolean qReplayck, String wcNo, int qCount, String qPwd) {
		super();
		this.qNo = qNo;
		this.cId = cId;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qEntdate = qEntdate;
		this.qSecret = qSecret;
		this.qReplayck = qReplayck;
		this.wcNo = wcNo;
		this.qCount = qCount;
		this.qPwd = qPwd;
	}

	@Override
	public String toString() {
		return "Qna [qNo=" + qNo + ", cId=" + cId + ", qTitle=" + qTitle + ", qContent=" + qContent + ", qEntdate="
				+ qEntdate + ", qSecret=" + qSecret + ", qReplayck=" + qReplayck + ", wcNo=" + wcNo + ", qCount="
				+ qCount + ", qPwd=" + qPwd + "]";
	}

	
	
}
