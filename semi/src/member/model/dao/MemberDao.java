package member.model.dao;


import java.sql.*;
import java.util.ArrayList;

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
				m.setUserBirth(rs.getString("C_BIRTH"));
				m.setAuthority(rs.getInt("AUTHORITY"));
				m.setUserName(rs.getString("C_NAME"));
				m.setPoint(rs.getInt("c_point"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rs);
			close(ps);
		}
		return m;
	}

	public int idCheck(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT COUNT(*) FROM CLIENT WHERE C_ID=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int insertMember(Connection c, Member m) {
		int result = 0;
		PreparedStatement ps = null;
		String q = "INSERT INTO CLIENT VALUES(?,?,?,?,?,?,default,default,default,?,default,?,?)";
		
		try {
			ps = c.prepareStatement(q);
			ps.setString(1, m.getUserId());
			ps.setString(2, m.getUserPwd());
			ps.setString(3, m.getUserName());
			ps.setString(4, m.getUserBirth());
			ps.setString(5, m.getEmail());
			ps.setString(6, m.getPhone());
			
				ps.setString(7, m.getInterest());
			
			ps.setString(8, m.getUserHint());
			ps.setInt(9, m.getPwdHint());
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			
			close(ps);
		}
		
		return result;
	}
	public Member checkEmail(Connection conn, String findEmail, String findPhone) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = new Member();
		String sql = "SELECT * FROM CLIENT WHERE C_EMAIL=? AND C_PHONE=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, findEmail);
			pstmt.setString(2, findPhone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m.setUserName(rset.getString("C_NAME"));
				m.setEmail(rset.getString("C_EMAIL"));
				m.setPhone(rset.getString("C_PHONE"));
				m.setUserId(rset.getString("C_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}

	public int findPwd(Connection c, Member m) {
		int result = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String q=  "SELECT COUNT(*) FROM CLIENT WHERE C_ID=? AND C_HINTPWD=? AND C_CHECKPWD=?";
		try {
			ps= c.prepareStatement(q);
			ps.setString(1, m.getUserId());
			ps.setString(2, m.getUserHint());
			ps.setInt(3,m.getPwdHint());
			
			rs = ps.executeQuery();
			if(rs.next()) {
				
				result = rs.getInt(1);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(ps);
		}
		
		
		return result;
	}

	public int changePwd(Connection c, String id, String pwd) {
		int result =0;
		PreparedStatement ps = null;
		String q = "UPDATE CLIENT SET C_PW=? WHERE C_ID=?";
		
		try {
			ps= c.prepareStatement(q);
			ps.setString(1, pwd);
			ps.setString(2, id);
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(ps);
		}
		
		return result;
	}

	

	public int changeAuth(Connection c, String id) {
		int result = 0;
		String q = "update client set authority=2 where c_id=? ";
		PreparedStatement ps = null;
		
		try {
			ps = c.prepareStatement(q);
			ps.setString(1, id);
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(ps);
		}
		
		
		return result;
	}

	public int selectAlarm(Connection c) {
		int result = 0;
		Statement st = null;
		ResultSet rs =null;
		String q = "select aa.a+bb.b+cc.c as 알람 from (" + 
				"select count(*) a from client c, workshop ws where c.c_id = ws.c_id and c.authority = 1) aa,(" + 
				"select count(enrollyn) b from workshop where enrollyn='N') bb,(" + 
				"select count(wc_yn) c from work_class where wc_yn='N') cc";
		try {
			st = c.createStatement();
			rs = st.executeQuery(q);
			if(rs.next()) {
				result += rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(st);
		}
		
		
		return result;
	}

	public int selectQna(Connection c) {
		int result = 0;
		Statement st = null;
		ResultSet rs =null;
		String q = "select count(*) from qna where wc_no = 'admin' and q_replay_ck = 'N'";
		
		try {
			st = c.createStatement();
			rs = st.executeQuery(q);
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rs);
			close(st);
		}
		return result;
	}

}
