package member.model.vo;

import java.sql.Date;

public class Member {
	private String userId; // 아이디
	private String userPwd; // 비밀번호
	private String userName; // 이름
	private Date userBirth; // 생년월일
	private String Email; // 이메일
	private String Phone; // 전화번호
	private Date EnrollDate; // 가입일
	private int Authority; // 권한
	private int ReadStatus; // 알람개수
	private String Interest; // 관심분야 ex : 도자기,반지
	
	public Member() {}
	
	public Member(String userId, String userPwd, String userName, Date userBirth, String email, String phone,
			Date enrollDate, int authority, int readStatus, String interest) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userBirth = userBirth;
		Email = email;
		Phone = phone;
		EnrollDate = enrollDate;
		Authority = authority;
		ReadStatus = readStatus;
		Interest = interest;
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
	public Date getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(Date userBirth) {
		this.userBirth = userBirth;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public Date getEnrollDate() {
		return EnrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		EnrollDate = enrollDate;
	}
	public int getAuthority() {
		return Authority;
	}
	public void setAuthority(int authority) {
		Authority = authority;
	}
	public int getReadStatus() {
		return ReadStatus;
	}
	public void setReadStatus(int readStatus) {
		ReadStatus = readStatus;
	}
	public String getInterest() {
		return Interest;
	}
	public void setInterest(String interest) {
		Interest = interest;
	}
}
