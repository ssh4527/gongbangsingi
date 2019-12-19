package qna.model.vo;

import java.sql.Date;

public class QnaRe {
	private String rqNo; // Qna리플 번호
	private String rqComment; //Qna리플 내용
	private Date rqEntDate; // 날짜
	private String Secret; // 비밀글여부
	private String qNo; // 리플달릴 Qna
	private String cId; // 단사람
	private String rqChk; // 답변받는사람이 확인했는지 여부
	
	public QnaRe() {}
	
	public QnaRe(String rqNo, String rqComment, Date rqEntDate, String secret, String qNo, String cId, String rqChk) {
		super();
		this.rqNo = rqNo;
		this.rqComment = rqComment;
		this.rqEntDate = rqEntDate;
		Secret = secret;
		this.qNo = qNo;
		this.cId = cId;
		this.rqChk = rqChk;
	}
	public String getRqNo() {
		return rqNo;
	}
	public void setRqNo(String rqNo) {
		this.rqNo = rqNo;
	}
	public String getRqComment() {
		return rqComment;
	}
	public void setRqComment(String rqComment) {
		this.rqComment = rqComment;
	}
	public Date getRqEntDate() {
		return rqEntDate;
	}
	public void setRqEntDate(Date rqEntDate) {
		this.rqEntDate = rqEntDate;
	}
	public String getSecret() {
		return Secret;
	}
	public void setSecret(String secret) {
		Secret = secret;
	}
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
	public String getRqChk() {
		return rqChk;
	}
	public void setRqChk(String rqChk) {
		this.rqChk = rqChk;
	}
	@Override
	public String toString() {
		return "QnaRe [rqNo=" + rqNo + ", rqComment=" + rqComment + ", rqEntDate=" + rqEntDate + ", Secret=" + Secret
				+ ", qNo=" + qNo + ", cId=" + cId + ", rqChk=" + rqChk + "]";
	}
	
	
	
	
	
	
	
}
