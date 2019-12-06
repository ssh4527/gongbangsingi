package member.model.dao;


import java.sql.*;
import static common.JDBCTemplate.*;
import member.model.vo.Member;

public class MemberDao {

	public Member LoginMember(String id, String pwd, Connection c) {
		PreparedStatement ps =null;
		ResultSet rs = null;
		String q = "select * from CLIENT where C_ID=? and C_PW=?";
		Member m = new Member();
		
		try {
			ps = c.prepareStatement(q);
			ps.setString(1, id);
			ps.setString(2, pwd);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				
				m.setUserId(id);
				m.setUserPwd(pwd);
				
				m.setEmail(rs.getString("C_EMAIL"));
				m.setEnrollDate(rs.getDate("C_ED"));
				m.setInterest(rs.getString("C_INTEREST"));
				m.setPhone(rs.getString("C_PHONE"));
				m.setUserBirth(rs.getDate("C_BIRTH"));
				m.setUserName(rs.getString("C_NAME"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rs);
			close(ps);
		}
		return m;
	}

}
