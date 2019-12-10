package member.model.vo;

import java.sql.Date;

public class Member {
	private String userId; // 아이디
	private String userPwd; // 비밀번호
	private String userName; // 이름
	private String userBirth; // 생년월일
	private String email; // 이메일
	private String phone; // 전화번호
	private String interest; // 관심분야 ex : 도자기,반지
	private int point;
	private int pwdHint;
	private String userHint;
	private Date enrollDate; // 가입일
	private int authority; // 권한
	private int readStatus; // 알람개수
	
	
	public Member() {}

	public Member(String userId, String userPwd, String userName, String userBirth, String email, String phone,
			Date enrollDate, int authority, int readStatus, String interest, int point) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userBirth = userBirth;
		this.email = email;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.authority = authority;
		this.readStatus = readStatus;
		this.interest = interest;
		this.point = point;
	}
	
	

	public Member(String userId, String userPwd, String userName, String userBirth, String email, String phone,
			String interest, int pwdHint, String userHint) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userBirth = userBirth;
		this.email = email;
		this.phone = phone;
		this.interest = interest;
		
		this.pwdHint = pwdHint;
		this.userHint = userHint;
	}

	public int getPwdHint() {
		return pwdHint;
	}

	public void setPwdHint(int pwdHint) {
		this.pwdHint = pwdHint;
	}

	public String getUserHint() {
		return userHint;
	}

	public void setUserHint(String userHint) {
		this.userHint = userHint;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}

	public int getReadStatus() {
		return readStatus;
	}

	public void setReadStatus(int readStatus) {
		this.readStatus = readStatus;
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", userBirth="
				+ userBirth + ", email=" + email + ", phone=" + phone + ", enrollDate=" + enrollDate + ", authority="
				+ authority + ", readStatus=" + readStatus + ", interest=" + interest + ", Point=" + point + "]";
	}
	
	

	


	
}
